using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;

    public Stack<UIPanel> OpenedPanels { get; private set; } = new Stack<UIPanel>();
    public UIPanel PauseMenu { get => pauseMenu; }

    [SerializeField]
    private KeyCode pauseButton = KeyCode.Escape;
    [SerializeField]
    private UIPanel pauseMenu;

    private float targetTimeScale = 1;

    private void Awake()
    {
        Instance = this;
    }

    private void Update()
    {
        if (Input.GetKeyDown(pauseButton))
        {
            OnEscapeClick();
        }
    }

    private void OnEscapeClick()
    {
        if (OpenedPanels.Count == 0 || OpenedPanels.Peek().CanBePaused)
        {
            OpenPanel(pauseMenu);
        }
        else if (OpenedPanels.Peek().CanBeClosedByEscape)
        {
            ClosePanel(OpenedPanels.Peek());
        }
    }

    public void OpenPanel(UIPanel panel)
    {
        if (!OpenedPanels.Contains(panel))
        {
            GameManager.Instance.SetUIControlls();
            OpenedPanels.Push(panel);
            panel.Open();
            if (panel.IsPausingTheGame)
            {
                Pause();
            }
        }
    }

    private void Pause()
    {
        Time.timeScale = 0;
    }

    private void UnPause()
    {
        Time.timeScale = targetTimeScale;
    }

    public void ClosePanel(UIPanel panel)
    {
        panel.Close();
        if (panel.IsPausingTheGame)
        {
            UnPause();
        }
    }

    public void ConfirmClosePanel(UIPanel panel)
    {
        if (panel == OpenedPanels.Peek())
        {
            OpenedPanels.Pop();
            if (OpenedPanels.Count == 0)
            {
                GameManager.Instance.SetGameplayControlls();
            }
        }
    }
}
