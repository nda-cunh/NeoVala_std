namespace Memory {
	[CCode (cname = "memcpy", cheader_filename = "string.h")]
	public extern void copy (uint8* dest, uint8* src, size_t n);
}
