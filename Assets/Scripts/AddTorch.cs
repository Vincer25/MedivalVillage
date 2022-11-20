using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AddTorch : MonoBehaviour
{
    [SerializeField]
    private TorchLight tl;
    [SerializeField]
    private bool activeOnScene;

    private void Start()
    {
        tl.gameObject.SetActive(activeOnScene);
    }
}
