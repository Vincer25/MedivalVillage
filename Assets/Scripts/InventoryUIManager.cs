using System.Collections.Generic;
using UnityEngine;

public class InventoryUIManager : MonoBehaviour
{
    [SerializeField]
    private List<ToolBarImage> images;

    private Dictionary<ItemData, ToolBarImage> displayedItems = new();
    private InventoryController inventoryController;

    private void Start()
    {
        inventoryController = InventoryController.Instance;
        inventoryController.onItemAdd += CreateItemInstance;
        inventoryController.onItemRemove += DestroyItemInstance;
    }

    private void CreateItemInstance(ItemData item)
    {
        if (GetFreeCell(out ToolBarImage image))
        {
            displayedItems.Add(item, image);
            image.DisplayItem(item);
        }
        else
        {
            Debug.LogError("To many items in eq");
        }
    }

    private void DestroyItemInstance(ItemData item)
    {
        if (displayedItems.ContainsKey(item))
        {
            displayedItems[item].HideItem();
            displayedItems.Remove(item);
        }
    }

    private bool GetFreeCell(out ToolBarImage bar)
    {
        foreach (var item in images)
        {
            if (item.DisplayedItem == null)
            {
                bar = item;
                return true;
            }
        }
        bar = null;
        return false;
    }
}
