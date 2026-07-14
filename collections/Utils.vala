namespace Std {

	private bool int_compare (int a, int b) {
		return a == b;
	}

	private bool string_compare (string a, string b) {
		return a == b;
	}

	private bool double_compare (double? a, double? b) {
		return a == b;
	}

	private bool float_compare (float? a, float? b) {
		return a == b;
	}

	internal unowned EqualsFunc<G>? from_type<G>() {
		var type = typeof(G);
		print ("%s\n", typeof(G).name);
		if (type == typeof(int)) return (int_compare);
		if (type == typeof(string)) return (string_compare);
		if (type == typeof(float?)) return (float_compare);
		if (type == typeof(double?)) return (double_compare);
		return null;
	}
}
