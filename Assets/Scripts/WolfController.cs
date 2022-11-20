using UnityEngine;
using UnityEngine.AI;

public class WolfController : MonoBehaviour
{
    [SerializeField]
    private NavMeshAgent agent;
    [SerializeField]
    private float waitDistance = 10f;

    private CharacterController player;
    private bool isWaiting = false;

    private void Start()
    {
        player = CharacterController.Instance;
    }

    private void Update()
    {
        if (Vector3.Distance(transform.position, player.transform.position) > waitDistance)
        {
            isWaiting = false;
            agent.destination = player.transform.position;
        }
        else if (!isWaiting)
        {
            WaitPosition();
        }
    }

    private void WaitPosition()
    {
        isWaiting = true;
        agent.destination = agent.transform.position;
    }
}
