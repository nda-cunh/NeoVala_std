public delegate A Std.MapFunc<A,G> (owned G g);

public class Std.MapIterator<A,G> : Iterator<A>, Traversable<A> {
	private rc Iterator<G> it;
	private MapFunc<A,G> func;
	private A next_value;

	public MapIterator (Iterator<G> it, owned MapFunc<A,G> func) {
		this.it = it;
		this.func = (owned) func;
	}

	public bool next () {
		if (it.next ()) {
			G value = it.get ();
			this.next_value = func ((owned) value);
			return true;
		}
		return false;
	}

	public A get () {
		return this.next_value;
	}

	public Iterator<A> iterator () {
		return this;
	}
}

