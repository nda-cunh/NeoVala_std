
public delegate bool Std.EqualsFunc<G> (G a, G b);
public delegate bool Std.Predicate<G> (G g);

public interface Std.Iterator<G> : Std.Traversable<G> {

	public abstract bool next ();
	public abstract G get ();

}
