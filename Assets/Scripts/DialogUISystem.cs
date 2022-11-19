using UnityEngine;
using TMPro;

public class DialogUISystem : UIPanel
{
    public static DialogUISystem Instance;

    [SerializeField]
    private TextMeshProUGUI textBox;

    private void Awake()
    {
        Instance = this;
        gameObject.SetActive(false);
        textBox.enabled = false;
    }

    public void ShowText(string text)
    {
        UIManager.Instance.OpenPanel(this);
        textBox.enabled = true;
        textBox.SetText(text);
    }

    public void HideText()
    {
        UIManager.Instance.ClosePanel(this);
        textBox.enabled = false;
    }
}
