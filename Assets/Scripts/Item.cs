using UnityEngine;

public class Item : MonoBehaviour, IUsable
{
    [SerializeField]
    private ItemData data;

    public ItemData Data => data;

    public void Deselect()
    {
        PromptManager.Instance.HidePrompt();
    }

    public void Select()
    {
        PromptManager.Instance.ShowPrompt("Press E to collect");
    }

    public void Use()
    {
        InventoryController.Instance.AddToInventory(data);
        Destroy(gameObject);
    }
}
