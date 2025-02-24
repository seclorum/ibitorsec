run:
	lua borker.lua | tee run.txt

strip:
	cat run.txt  | grep -o -E '\w+' | sort | uniq
