CC = gcc
CFLAGS = -Wall -g

# 设置 build 目录
BUILD_DIR = build

TARGET = $(BUILD_DIR)/bptree
SRCS = bptree.c main.c
OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o)
HEADERS = BPlusTree.h

# 创建 build 目录（如果不存在）
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET)

$(BUILD_DIR)/%.o: %.c $(HEADERS) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean run r debug d

clean:
	rm -rf $(BUILD_DIR)

run: clean $(TARGET)
	./$(TARGET)

r: run

debug: CFLAGS += -DDEBUG
debug: clean $(TARGET)
	./$(TARGET)

d: debug
