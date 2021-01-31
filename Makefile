CC=clang
CCFLAGS=-O3
SRC=main.c
OUT=mychmod
TEST_FILE=test

$(OUT): $(SRC)
	$(CC) $(CCFLAGS) -o $(OUT) $(SRC)
	strip $(OUT)

clean:
	rm -f $(OUT)
	rm -f $(TEST_FILE)

test: $(OUT)
	touch $(TEST_FILE) && echo
	./$(OUT) 777 $(TEST_FILE) && ls -l $(TEST_FILE) && echo
	./$(OUT) 666 $(TEST_FILE) && ls -l $(TEST_FILE) && echo
	./$(OUT) 444 $(TEST_FILE) && ls -l $(TEST_FILE) && echo
	./$(OUT) 222 $(TEST_FILE) && ls -l $(TEST_FILE) && echo
	./$(OUT) 000 $(TEST_FILE) && ls -l $(TEST_FILE) && echo
	rm -f $(TEST_FILE)

all: clean $(SRC) test

.PHONY: all clean test
