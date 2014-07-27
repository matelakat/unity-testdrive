.PHONY: test clean clean_binaries

test: test_all
	./test_all

test_all: unity.o test_all.o test_opener.o unity_fixture.o
	$(CC) -o $@ $^

test_%.o: test_%.c
	$(CC) -I unity/src -I unity/extras/fixture/src -c -o $@ $^

unity.o: unity/src/unity.c
	$(CC) -c -o $@ $^

unity_fixture.o: unity/extras/fixture/src/unity_fixture.c
	$(CC) -c -I unity/src/ -o $@ $^

unity/src/unity.c unity/src/unity.h unity/extras/fixture/src/unity_fixture.c: unity

unity:
	git clone https://github.com/ThrowTheSwitch/Unity.git unity
	$(MAKE) -C unity

clean: clean_binaries
	rm -rf unity

clean_binaries:
	rm -f test_all
	rm -rf *.o
