using UnityEngine;

public class DialogTrigger : MonoBehaviour, IUsable
{
    [SerializeField]
    private DialogData data;
    [SerializeField]
    private bool workOnTrigger = false;
    [SerializeField]
    private bool canBeActivatedAgain = false;

    private bool canActive = true;

    public void Deselect()
    {
        PromptManager.Instance.HidePrompt();
    }

    public void Select()
    {
        if (canActive)
        {
            PromptManager.Instance.ShowPrompt("Press E to Talk");
        }
    }

    public void Use()
    {
        if (!workOnTrigger)
        {
            TryActivateDialog();
        }
    }

    private void OnTriggerEnter(Collider collision)
    {
        if (workOnTrigger)
        {
            TryActivateDialog();
        }
    }

    private void TryActivateDialog()
    {
        if (canActive)
        {
            Deselect();
            DialogController.Instance.ActivateDialog(data);
        }
        if (!canBeActivatedAgain)
        {
            canActive = false;
        }
    }
}
