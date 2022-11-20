using System.Collections;
using UnityEngine;

public class CharacterController : MonoBehaviour
{
    public static CharacterController Instance;

    [SerializeField]
    private Camera playerCamera;
    [SerializeField]
    private float mouseSensitivity = 2f;
    [SerializeField]
    private float maxLookAngle = 50f;
    [SerializeField]
    private float maxVelocityChange = 10f;
    [SerializeField]
    private float walkSpeed = 3f;
    [SerializeField]
    private float sprintSpeed = 6f;
    [SerializeField]
    private float sprintDuration = 5f;
    [SerializeField]
    private float sprintCooldown = 3f;
    [SerializeField]
    private float sprintFOV = 80f;
    [SerializeField]
    private float sprintFOVStepTime = 10f;
    [SerializeField]
    private float jumpPower = 5f;
    [SerializeField]
    private float crouchHeight = 0.5f;
    [SerializeField]
    private float speedReduction = 0.5f;

    private Rigidbody rb;
    private Vector3 originalTransformScale;
    private float sprintRemaining;
    private float yaw;
    private float pitch;
    private float startFOV;
    private bool isSprintCooldown = false;
    private bool isSprinting = false;
    private bool canCameraMove = true;
    private bool canSprint = true;
    private bool canJump = true;
    private bool canMove = true;
    private bool isGrounded = false;
    private bool isCrouched = false;
    private KeyCode sprintKey = KeyCode.LeftShift;
    private KeyCode jumpKey = KeyCode.Space;
    private KeyCode crouchKey = KeyCode.LeftControl;

    private void Awake()
    {
        Instance = this;
        rb = GetComponent<Rigidbody>();
        originalTransformScale = transform.localScale;
        sprintRemaining = sprintDuration;
        Cursor.lockState = CursorLockMode.Locked;
        startFOV = playerCamera.fieldOfView;
    }

    private void Update()
    {
        CheckGround();

        if (canCameraMove)
        {
            yaw = transform.localEulerAngles.y + Input.GetAxis("Mouse X") * mouseSensitivity;
            pitch -= mouseSensitivity * Input.GetAxis("Mouse Y");
            pitch = Mathf.Clamp(pitch, -maxLookAngle, maxLookAngle);
            transform.localEulerAngles = new Vector3(0, yaw, 0);
            playerCamera.transform.localEulerAngles = new Vector3(pitch, 0, 0);
        }

        if (isSprinting)
        {
            playerCamera.fieldOfView = Mathf.Lerp(playerCamera.fieldOfView, sprintFOV, sprintFOVStepTime * Time.deltaTime);
            sprintRemaining -= 1 * Time.deltaTime;
            if (sprintRemaining <= 0)
            {
                isSprinting = false;
                StartCoroutine(SprintCooldown());
            }
        }
        else
        {
            playerCamera.fieldOfView = Mathf.Lerp(playerCamera.fieldOfView, startFOV, sprintFOVStepTime * Time.deltaTime);
            sprintRemaining = Mathf.Clamp(sprintRemaining += 1 * Time.deltaTime, 0, sprintDuration);
        }

        #region Buttons

        if (Input.GetKeyDown(jumpKey))
        {
            Jump();
        }

        if (Input.GetKeyDown(crouchKey))
        {
            Crouch();
        }
        else if (Input.GetKeyUp(crouchKey))
        {
            Crouch();
        }

        if (Input.GetKeyDown(sprintKey))
        {
            Sprint();
        }
        else if (Input.GetKeyUp(sprintKey))
        {
            Sprint();
        }
        #endregion
    }

    private void FixedUpdate()
    {
        if (canMove && isGrounded)
        {
            Vector3 targetVelocity = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
            targetVelocity = transform.TransformDirection(targetVelocity) * (isSprinting ? sprintSpeed : walkSpeed);
            Vector3 velocityChange = (targetVelocity - rb.velocity);
            velocityChange.x = Mathf.Clamp(velocityChange.x, -maxVelocityChange, maxVelocityChange);
            velocityChange.z = Mathf.Clamp(velocityChange.z, -maxVelocityChange, maxVelocityChange);
            velocityChange.y = 0;
            rb.AddForce(velocityChange, ForceMode.VelocityChange);
        }
    }

    private void CheckGround()
    {
        var rayPosition = new Vector3(transform.position.x, transform.position.y - (transform.localScale.y * 0.5f), transform.position.z);
        var rayDistance = 0.75f;
        var rayRadius = 0.1f;
        if (Physics.SphereCast(rayPosition, rayRadius, Vector3.down, out RaycastHit hit, rayDistance))
        {
            isGrounded = true;
        }
        else
        {
            isGrounded = false;
        }
    }

    private void Sprint()
    {
        if (!isSprinting && canSprint && sprintRemaining > 0f && !isSprintCooldown && !isCrouched)
        {
            isSprinting = true;
        }
        else
        {
            isSprinting = false;
        }
    }

    private IEnumerator SprintCooldown()
    {
        isSprintCooldown = true;
        yield return new WaitForSecondsRealtime(sprintCooldown);
        isSprintCooldown = false;
        sprintRemaining = sprintDuration;
    }

    private void Jump()
    {
        if (canJump && isGrounded)
        {
            rb.AddForce(0f, jumpPower, 0f, ForceMode.Impulse);
        }
    }

    private void Crouch()
    {
        if (isCrouched)
        {
            transform.localScale = new Vector3(originalTransformScale.x, originalTransformScale.y, originalTransformScale.z);
            walkSpeed /= speedReduction;
            isCrouched = false;
        }
        else if (!isSprinting)
        {
            transform.localScale = new Vector3(originalTransformScale.x, crouchHeight, originalTransformScale.z);
            walkSpeed *= speedReduction;
            isCrouched = true;
        }
    }

    public void LockCamera(bool state) => canCameraMove = !state;

    public void LockMovement(bool state) => canMove = !state;

    public void LockCameraAndMovement(bool state)
    {
        canCameraMove = !state;
        canMove = !state;
        canJump = !state;
    }
}
