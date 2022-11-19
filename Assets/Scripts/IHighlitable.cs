public interface IHighlitable
{
    public void Select();
    public void Deselect();
}

public interface IUsable : IHighlitable
{
    public void Use();
}
