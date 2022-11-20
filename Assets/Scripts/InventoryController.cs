using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InventoryController : MonoBehaviour
{
    public Action<ItemData> onItemAdd , onItemRemove;

    public static InventoryController Instance;

    public List<ItemData> Inventory => inventoryList;

    private List<ItemData> inventoryList = new();

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        DialogController.Instance.onDialogEnd += Clear;
    }

    private void Clear()
    {
        var temp = new List<ItemData>(inventoryList);
        foreach (var item in temp)
        {
            RemoveFromInventory(item);
        }
    }

    public void AddToInventory(ItemData item)
    {
        inventoryList.Add(item);
        onItemAdd?.Invoke(item);
    }

    public void RemoveFromInventory(ItemData item)
    {
        if (inventoryList.Contains(item))
        {
            inventoryList.Remove(item);
            onItemRemove?.Invoke(item);
        }
    }
}
