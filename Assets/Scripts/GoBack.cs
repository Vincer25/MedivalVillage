using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GoBack : MonoBehaviour
{
    [SerializeField]
    private ItemData itemOne;
    [SerializeField]
    private ItemData itemTwo;
    [SerializeField]
    private string sceneName;

    private void Update()
    {
        if (InventoryController.Instance.Inventory.Contains(itemOne) && InventoryController.Instance.Inventory.Contains(itemTwo))
        {
            PromptManager.Instance.HidePrompt();
            SceneManager.LoadScene(sceneName);
        }
    }
}
