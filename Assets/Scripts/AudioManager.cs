using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;

    [SerializeField]
    private AudioSource source;
    [SerializeField]
    private AudioClip defaultClip;

    private void Awake()
    {
        Instance = this;
    }

    public void SetAudio(AudioClip clip)
    {
        source.clip = clip;
        source.Play();
    }

    public void SetDefaultAudio()
    {
        source.clip = defaultClip;
        source.Play();
    }
}
