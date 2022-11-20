using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ChangeSceneTrigger : MonoBehaviour
{
    [SerializeField]
    private string sceneName;

    private void OnTriggerEnter(Collider other)
    {
        ChangeScene();
    }

    private void ChangeScene()
    {
        SceneManager.LoadScene(sceneName);
    }
}
