CC = g++
CXX = vlog
PGM=observer
OBJS = ./bin/$(PGM).o

./bin/$(PGM): $(OBJS)
	g++ -o $@ $^ 
#	g++ -g -o $@ $^ && $@

./bin/%.o:%.cpp
	if [ ! -d ./bin ]; then mkdir bin; fi
	$(CC) -g -c -o $@ $<

run:
	./bin/$(PGM)
clean:
	rm -rf $(PGM).exe $(OBJS) ./bin

.PHONY: check-syntax
check-syntax:
	$(CXX) -sv -work ../../design/sim/rtl_sim/rtl_work -lint $(CHK_SOURCES)
