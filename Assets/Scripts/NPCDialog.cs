using UnityEngine;

public class NPCDialog : MonoBehaviour
{
    [SerializeField, TextArea]
    private string text;

    private bool wasActivated = false;

    private void OnTriggerEnter(Collider other)
    {
        if (!wasActivated)
        {
            DialogController.Instance.ActivateSingleDialog(text);
        }
    }
}
