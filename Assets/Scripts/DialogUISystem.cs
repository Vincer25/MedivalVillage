using UnityEngine;
using TMPro;

public class DialogUISystem : MonoBehaviour
{
    public static DialogUISystem Instance;

    [SerializeField]
    private TextMeshProUGUI textBox;

    private void Awake()
    {
        Instance = this;
        textBox.enabled = false;
    }

    public void ShowTextAndPause(string text)
    {
        textBox.enabled = true;
        textBox.SetText(text);
        CharacterController.Instance.LockCameraAndMovement(true);
    }

    public void ShowText(string text)
    {
        textBox.enabled = true;
        textBox.SetText(text);
    }

    public void HideText()
    {
        CharacterController.Instance.LockCameraAndMovement(false);
        textBox.enabled = false;
    }
}
