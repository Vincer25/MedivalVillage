using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UsableItem : MonoBehaviour, IUsable
{
    public void Deselect()
    {
        Debug.Log("Deselect");
    }

    public void Select()
    {
        Debug.Log("Select");
    }

    public void Use()
    {
        Debug.Log("Use");
    }
}
