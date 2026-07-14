public errordomain StdError {
	QueueEmpty,
	InvalidHead
}

public class Std.Queue<G>: Iterable<G>, Traversable<G> {
	private Std.List<G> list;

	public Queue () {
		this.list = new Std.List<G> ();
	}

	// public void enqueue (G item) {
		// this.list.append (item);
	// }
// 
	// public G dequeue () throws StdError.QueueEmpty {
		// if (this.list.is_empty ()) {
			// throw new StdError.QueueEmpty ("Queue is empty");
			// // throw new Error ("Queue is empty");
		// }
		// var item = this.list.get (0);
		// this.list.remove (0);
		// return item;
	// }
// 
	// public owned G peek () {
		// if (this.list.is_empty ()) {
			// // throw new Error ("Queue is empty");
		// }
		// G? item = this.list.head;
		// if (item == null) {
			// throw new StdError.QueueEmpty ("Queue is empty");
		// }
		// return item;
	// }

	public int length {
		get { return this.list.length; }
	} 


	public bool is_empty () {
		return this.list.is_empty ();
	}


	public Iterator<G> iterator () {
		return new _QueueIterator<G> (this.list);
	}

	private class _QueueIterator<G> : Iterator<G>, Traversable<G> {
		private Std.Iterator<G> list_iterator;
		
		public _QueueIterator (Std.List<G> list) {
			this.list_iterator = list.iterator ();
		} 

		public bool next () {
			return this.list_iterator.next ();
		}

		public G get () {
			return this.list_iterator.get ();
		}

		public Iterator<G> iterator () {
			return this;
		}
	}


}
