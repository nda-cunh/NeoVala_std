
public class Std.DropIterator<G> : Iterator<G>, Traversable<G> {
	private Iterator<G> it;
	private int nb;
	private bool has_next;
	private G next_value;

	public DropIterator (Iterator<G> it, int n) {
		this.nb = n;
		this.it = it;
		this.has_next = false;
	}

	public bool next () {
		while (this.nb > 0 && it.next ()) {
			this.nb--;
		}
		if (it.next ()) {
			this.next_value = it.get ();
			this.has_next = true;
			return true;
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

public class Std.DropWhileIterator<G> : Iterator<G>, Traversable<G> {
	private Iterator<G> it;
	private Predicate<G> pred;
	private bool has_next;
	private G next_value;

	public DropWhileIterator (Iterator<G> it, owned Predicate<G> pred) {
		this.pred = (owned)pred;
		this.it = it;
		this.has_next = false;
	}

	public bool next () {
		while (it.next ()) {
			G value = it.get ();
			if (!pred (value)) {
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
