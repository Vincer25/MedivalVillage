using System.Collections;
using UnityEngine;

public class DialogController : MonoBehaviour
{
    public static DialogController Instance;

    [SerializeField]
    private float textChangeTime = 3f;

    private void Awake()
    {
        Instance = this;
    }

    public void ActivateDialog(DialogData data)
    {
        StartCoroutine(StartDialog(data));
    }

    private IEnumerator StartDialog(DialogData data)
    {
        var controlValue = data.dialogList.Count;
        var i = 0;
        while (i < controlValue)
        {
            DialogUISystem.Instance.ShowText(data.dialogList[i]);
            i++;
            yield return new WaitForSecondsRealtime(textChangeTime);
            DialogUISystem.Instance.HideText();
        }
    }
}
