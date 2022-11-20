using UnityEngine;

public class AudioTrigger : MonoBehaviour
{
    [SerializeField]
    private AudioClip clip;

    private void OnTriggerEnter(Collider other)
    {
        AudioManager.Instance.SetAudio(clip);
    }

    private void OnTriggerExit(Collider other)
    {
        AudioManager.Instance.SetDefaultAudio();
    }
}
