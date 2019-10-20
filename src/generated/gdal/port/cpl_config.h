# define SIZEOF_INT 4
# define SIZEOF_UNSIGNED_LONG 4
#ifdef _WIN64
# define SIZEOF_VOIDP 8
#else
# define SIZEOF_VOIDP 4
#endif
# define HAVE_LONG_LONG 1
