using System.Collections.Generic;
using UnityEngine;

public class KeepOnScene : MonoBehaviour
{
    [SerializeField]
    private List<GameObject> objectsToKeep;

    private void Awake()
    {
        foreach (var item in objectsToKeep)
        {
            DontDestroyOnLoad(item);
        }
    }
}
