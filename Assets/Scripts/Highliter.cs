using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Highliter : MonoBehaviour
{
    public static Highliter Instance;

    [SerializeField]
    private float rayDistance = 2f;
    [SerializeField]
    private KeyCode useKey = KeyCode.E;

    private Transform highlitedTransform;
    private IHighlitable highlitedItem;

    private void Awake()
    {
        Instance = this; 
    }

    private void Update()
    {
        Debug.DrawRay(transform.position, transform.forward, Color.red);
        if (Physics.Raycast(transform.position, transform.forward, out RaycastHit hit, rayDistance))
        {
            if (hit.transform != highlitedTransform)
            {
                highlitedItem?.Deselect();
                highlitedTransform = hit.transform;
                highlitedItem = highlitedTransform.GetComponent<IUsable>() ?? highlitedTransform.GetComponent<IHighlitable>();
                if (highlitedItem != null)
                {
                    highlitedTransform = hit.transform;
                    highlitedItem.Select();
                }
            }
        }
        else
        {
            highlitedItem?.Deselect();
            highlitedTransform = null;
            highlitedItem = null;
        }

        if (highlitedItem!= null && highlitedItem is IUsable && Input.GetKeyDown(useKey))
        {
            (highlitedItem as IUsable).Use();
        }
    }
}
