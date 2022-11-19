using UnityEngine;

public abstract class UIPanel : MonoBehaviour
{
    public virtual bool CanBePaused => false;
    public virtual bool CanBeClosedByEscape => true;
    public virtual bool IsPausingTheGame => false;

    public virtual void Open()
    {
        gameObject.SetActive(true);
    }

    public virtual void Close()
    {
        UIManager.Instance.ConfirmClosePanel(this);
        gameObject.SetActive(false);
    }
}
