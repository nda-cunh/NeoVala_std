namespace Std {



public class List<G> : Iterable<G>, Traversable<G> {
	private Node<G>? m_head = null;
	private unowned Node<G>? m_tail = null;

	private class Node<G> {
		public G data;
		public Node<G>? next;
		public Node (G data) {
			this.data = data;
		}
	}

	public List () {
		this.m_head = null;
		this.length = 0;
	}
	// public G get_head() throws StdError.InvalidHead {
		// if (this.m_head == null) {
			// throw new StdError.InvalidHead ("List is empty");
		// }
		// return this.m_head.data;
	// }

	// public G? head {
		// get { return this.m_head?.data ?? null; }
	// }

	// public G? tail {
		// get { return this.m_tail?.data ?? null; }
	// }


	public int length { get; private set; }


	public bool contains (G item) {
 		return this.contains_by (item, null);
	}

	public bool contains_by (G item, EqualsFunc<G>? cmp = null) {
		unowned EqualsFunc<G>? func;
		if (cmp == null) {
			func = from_type<G> ();
			if (func == null)
				return false;
		}
		else
			func = cmp;
		var it = this.iterator ();
		while (it.next ()) {
			if (func (it.get (), item)) {
				return true;
			}
		}
		return false;
	}

	public bool is_empty () {
		return this.m_head == null;
	}
	
	public void prepend (G data) {
		var new_node = new Node<G> (data);
		if (this.m_head == null) {
			this.m_head = new_node;
			this.m_tail = new_node;
		} else {
			new_node.next = this.m_head;
			this.m_head = new_node;
		}
		this.length++;
	}

	public void append (G data) {
		var new_node = new Node<G> (data);
		if (this.m_head == null) {
			this.m_head = new_node;
			this.m_tail = new_node;
		} else {
			((!)this.m_tail).next = new_node;
			this.m_tail = new_node;
		}
		this.length++;
	}

	private class _ListIterator<G> : Iterator<G>, Traversable<G> {
		private unowned Node<G>? current;
		private bool started;

		public _ListIterator (Node<G>? head) {
			this.current = head;
			this.started = false;
		}

		public bool next () {
			if (!started) {
				started = true;
				return this.current != null;
			}
			if (this.current != null) {
				this.current = this.current.next;
			}
			return this.current != null;
		}

		public G get () {
			return ((!)current).data;
		}

		public Iterator<G> iterator () {
			return this;
		}
	}

	public Iterator<G> iterator () {
		return new _ListIterator<G> (this.m_head);
	}
}

}
