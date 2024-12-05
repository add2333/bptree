CC = gcc
CFLAGS = -Wall -g

TARGET = bptree
SRCS = bptree.c main.c
OBJS = $(SRCS:.c=.o)
HEADERS = BPlusTree.h

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean run r debug d

clean:
	rm -f $(OBJS) $(TARGET)

run: $(TARGET)
	./$(TARGET)

r: run

debug: CFLAGS += -DDEBUG
debug: clean $(TARGET)
	./$(TARGET)

d: debug