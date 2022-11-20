using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    private void Awake()
    {
        Instance = this;
    }

    public void SetGameplayControlls()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        CharacterController.Instance.LockCameraAndMovement(false);
        Time.timeScale = 1;
    }

    public void SetUIControlls()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
        CharacterController.Instance.LockCameraAndMovement(true);
        Time.timeScale = 0;
    }
}
