.PHONY: test clean clean_binaries

test: test_all
	./test_all

main: main.o opener.o
	$(CC) -o $@ main.o opener.o

main.o: main.c opener.h
	$(CC) -c -o $@ main.c

test_all: unity.o test_all.o test_opener.o unity_fixture.o opener.o fake_file.o
	$(CC) -o $@ $^

opener.o: opener.c opener.h
	$(CC) -c -o $@ opener.c

test_%.o: test_%.c
	$(CC) -I unity/src -I unity/extras/fixture/src -c -o $@ $^

unity.o: unity/src/unity.c
	$(CC) -c -o $@ $^

unity_fixture.o: unity/extras/fixture/src/unity_fixture.c
	$(CC) -c -I unity/src/ -o $@ $^

unity/src/unity.c unity/src/unity.h unity/extras/fixture/src/unity_fixture.c: unity

unity:
	git clone https://github.com/ThrowTheSwitch/Unity.git unity

clean: clean_binaries
	rm -rf unity

clean_binaries:
	rm -f test_all main
	rm -rf *.o
