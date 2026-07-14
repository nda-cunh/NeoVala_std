public delegate A Std.FoldFunc<A,G> (owned G g, owned A a);

public class Std.FoldIterator<A,G> : Iterator<A>, Traversable<A> {
	private Iterator<G> it;
	private FoldFunc<A,G> func;
	private A next_value;

	public FoldIterator (Iterator<G> it, owned FoldFunc<A,G> func, owned A initial) {
		this.it = it;
		this.func = (owned) func;
		this.next_value = initial;
	}

	public bool next () {
		if (it.next ()) {
			G value = it.get ();
			this.next_value = func ((owned) value, (owned) this.next_value);
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
