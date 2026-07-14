


void main() {
	var lst = new Std.List<int> ();
	lst.append (1);
	lst.append (2);
	lst.append (3);
	lst.append (4);
	lst.append (5);
	lst.append (6);

	var it = lst.iterator()
		.filter(v => v % 2 == 0)
		.map<int>(v => v * 2)
	;

	foreach (var v in it) {
		print ("%d\n", v);
	}

	print ("Length: %d\n", lst.length);
}
