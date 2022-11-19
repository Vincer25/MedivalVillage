using UnityEngine;
using UnityEngine.UI;

public class ToolBarImage : MonoBehaviour
{
    [SerializeField]
    private Image image;

    [HideInInspector]
    public ItemData DisplayedItem;

    public void DisplayItem(ItemData data)
    {
        gameObject.SetActive(true);
        image.sprite = data.inventoryImage;
        DisplayedItem = data;
    }

    public void HideItem()
    {
        gameObject.SetActive(false);
        DisplayedItem = null;
    }
}
