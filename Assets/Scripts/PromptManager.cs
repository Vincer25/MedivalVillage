using UnityEngine;
using TMPro;

public class PromptManager : MonoBehaviour
{
    public static PromptManager Instance;

    [SerializeField]
    private TextMeshProUGUI text;

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        text.enabled = false;
    }

    public void ShowPrompt(string text)
    {
        this.text.enabled = true;
        this.text.SetText(text);
    }

    public void HidePrompt()
    {
        text.enabled = false;
    }
}
