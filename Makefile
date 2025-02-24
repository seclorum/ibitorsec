run:
	lua borker.lua

strip:
	lua borker.lua | grep -o -E '\w+' | sort | uniq
