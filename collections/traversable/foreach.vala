
public delegate void Std.ForeachFunc<G> (G value);

public class Std.ForeachIterator<G> : Iterator<G>, Traversable<G> {
	private Iterator<G> it;
	private ForeachFunc<G> func;
	private G next_value;

	public ForeachIterator (Iterator<G> it, owned ForeachFunc<G> func) {
		this.it = it;
		this.func = (owned) func;
	}

	public bool next () {
		if (it.next ()) {
			G value = it.get ();
			func (value);
			
			return true; 
		}
		return false;
	}

	public G get () {
		return this.next_value;
	}

	public Iterator<G> iterator () {
		return this;
	}
}
