using UnityEngine;

[CreateAssetMenu(fileName = "ItemData", menuName = "ScriptableObjects/Item", order = 1)]
public class ItemData : ScriptableObject
{
    public Sprite inventoryImage;
    public GameObject itemPrefab;
}
