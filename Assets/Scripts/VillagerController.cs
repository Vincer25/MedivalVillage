using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class VillagerController : MonoBehaviour
{
    [SerializeField]
    private NavMeshAgent agent;

    private void Update()
    {
        //agent.destination = CharacterController.Instance.transform.position;
    }
}
