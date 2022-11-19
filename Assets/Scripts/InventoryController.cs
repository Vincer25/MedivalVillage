using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InventoryController : MonoBehaviour
{
    public static InventoryController Instance;

    private List<Item> inventoryList = new();

    private void Awake()
    {
        Instance = this;
    }

    public void AddToInventory(Item item)
    {
        inventoryList.Add(item);
    }

    public void RemoveFromInventory(Item item)
    {
        if (inventoryList.Contains(item))
        {
            inventoryList.Remove(item);
        }
    }
}
