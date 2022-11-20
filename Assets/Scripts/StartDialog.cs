using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StartDialog : MonoBehaviour
{
    [SerializeField]
    private DialogData data;

    private void Start()
    {
        StartCoroutine(Dialog());
    }

    private IEnumerator Dialog()
    {
        yield return new WaitForSecondsRealtime(2f);
        DialogController.Instance.ActivateDialog(data);
    }
}
