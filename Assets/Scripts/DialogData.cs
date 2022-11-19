using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "DialogData", menuName = "ScriptableObjects/DialogData", order = 2)]
public class DialogData : ScriptableObject
{
    [TextArea]
    public List<string> dialogList;
}
