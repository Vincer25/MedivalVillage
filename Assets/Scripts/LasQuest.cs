using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LasQuest : MonoBehaviour
{
    [SerializeField]
    private string sceneName;

    public bool WasInHouse = false;

    private void OnTriggerEnter(Collider other)
    {
        ChangeScene();
    }

    private void ChangeScene()
    {
        if (WasInHouse)
        {
            SceneManager.LoadScene(sceneName);
        }
    }
}
