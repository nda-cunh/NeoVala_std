
public class Std.FilterIterator<G> : Iterator<G>, Traversable<G> {
	private Iterator<G> it;
	private Predicate<G> pred;
	private bool has_next;
	private G next_value;

	public FilterIterator (Iterator<G> it, owned Predicate<G> pred) {
		this.it = it;
		this.pred = (owned) pred;
		this.has_next = false;
	}

	public bool next () {
		while (it.next ()) {
			G value = it.get ();
			if (pred (value)) {
				this.next_value = value;
				this.has_next = true;
				return true;
			}
		}
		this.has_next = false;
		return false;
	}

	public G get () {
		return this.next_value;
	}

	public Iterator<G> iterator () {
		return this;
	}
}
