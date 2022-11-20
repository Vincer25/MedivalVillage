using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class TorchLight : MonoBehaviour
{
    [SerializeField]
    private Light torch;
    [SerializeField]
    private Color one;
    [SerializeField]
    private Color two;
    [SerializeField]
    private float intensityOne;
    [SerializeField]
    private float intensityTwo;
    [SerializeField]
    private float tweenTime;

    private void Start()
    {
        torch.DOColor(one, tweenTime).OnComplete(StartTwo);
        torch.DOIntensity(intensityOne, tweenTime);
    }

    private void StartOne()
    {
        torch.DOColor(one, tweenTime).OnComplete(StartTwo);
        torch.DOIntensity(intensityOne, tweenTime);
    }

    private void StartTwo()
    {
        torch.DOColor(two, tweenTime).OnComplete(StartOne);
        torch.DOIntensity(intensityTwo, tweenTime);
    }
}
