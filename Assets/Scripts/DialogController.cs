using System.Collections;
using UnityEngine;
using System;

public class DialogController : MonoBehaviour
{
    public Action onDialogEnd;

    public static DialogController Instance;

    [SerializeField]
    private float textChangeTime = 3f;
    [SerializeField]
    private KeyCode nextButton = KeyCode.Space;

    private bool canSkip = false;
    private bool dialogIsActive = false;

    private void Awake()
    {
        Instance = this;
    }

    private void Update()
    {
        if (dialogIsActive && Input.GetKeyDown(nextButton))
        {
            canSkip = true;
        }
    }

    public void ActivateSingleDialog(string text)
    {
        StartCoroutine(StartDialog(text));
    }

    public void ActivateDialog(DialogData data)
    {
        StartCoroutine(StartDialog(data));
        dialogIsActive = true;
    }

    private IEnumerator StartDialog(DialogData data)
    {
        var controlValue = data.dialogList.Count;
        var i = 0;
        while (i < controlValue)
        {
            DialogUISystem.Instance.ShowTextAndPause(data.dialogList[i]);
            i++;
            yield return new WaitUntil(() => canSkip);
            DialogUISystem.Instance.HideText();
            canSkip = false;
        }
        onDialogEnd?.Invoke();
    }

    private IEnumerator StartDialog(string text)
    {
        DialogUISystem.Instance.ShowText(text);
        yield return new WaitForSecondsRealtime(textChangeTime);
        DialogUISystem.Instance.HideText();
    }
}
