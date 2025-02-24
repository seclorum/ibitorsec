run:
	lua borker.lua | tee run.txt

words:
	cat run.txt  | grep -o -E '\w+' | tr '[:upper:]' '[:lower:]' | sort | uniq
