namespace Std {

	public interface Traversable<G> {
		public abstract Iterator<G> iterator ();

		public virtual Iterator<G> filter (owned Predicate<G> pred) {
			return new FilterIterator<G> (iterator (), (owned) pred);
		}

		public virtual Iterator<A> map<A> (owned MapFunc<A,G> func) {
			return new MapIterator<A,G> (iterator (), (owned) func);
		}

		public virtual Iterator<A> fold<A> (owned FoldFunc<A,G> func, owned A initial) {
			return new FoldIterator<A,G> (iterator (), (owned) func, (owned) initial);
		}

		public virtual Iterator<G> drop (int n) {
			return new DropIterator<G> (iterator (), n);
		}

		public virtual Iterator<G> drop_while (owned Predicate<G> pred) {
			return new DropWhileIterator<G> (iterator (), (owned) pred);
		}

		public virtual Iterator<G> @foreach (owned ForeachFunc<G> func) {
			return new ForeachIterator<G> (iterator (), (owned) func);
		}
	}

}
