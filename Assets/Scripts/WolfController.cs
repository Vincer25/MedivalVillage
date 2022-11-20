using UnityEngine;
using UnityEngine.AI;

public class WolfController : MonoBehaviour
{
    [SerializeField]
    private NavMeshAgent agent;
    [SerializeField]
    private float waitDistance = 10f;
    [SerializeField]
    private Animator animator;

    private CharacterController player;
    private bool isWaiting = false;
    private bool isWalking = false;

    private void Start()
    {
        player = CharacterController.Instance;
    }

    private void Update()
    {
        if (Vector3.Distance(transform.position, player.transform.position) > waitDistance)
        {
            if (!isWalking)
            {
                isWalking = true;
                animator.SetBool("isWalking", isWalking);
            }
            isWaiting = false;
            agent.destination = player.transform.position;
        }
        else if (!isWaiting)
        {
            WaitPosition();
        }
    }

    private void WaitPosition()
    {
        isWaiting = true;
        isWalking = false;
        animator.SetBool("isWalking", isWalking);
        agent.destination = agent.transform.position;
    }
}
