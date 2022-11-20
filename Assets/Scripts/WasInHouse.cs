using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WasInHouse : MonoBehaviour
{
    [SerializeField]
    private LasQuest quest;

    private void OnTriggerEnter(Collider other)
    {
        quest.WasInHouse = true;
    }
}
