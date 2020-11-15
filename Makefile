SRCS := $(wildcard src/*.c)
OBJS := $(patsubst src/%.c, obj/%.o, $(SRCS))

CC := gcc
CFLAGS := -I inc
PRJ := cockroach


all: $(PRJ)

$(PRJ): $(OBJS)
	$(CC) $^ -o $@
	./$@

obj/%.o: src/%.c
	$(CC) -c $< -o $@ $(CFLAGS)

clean:
ifeq ($(PRJ), $(wildcard $(PRJ)))
	rm $(PRJ)
endif
	clear

re: clean all
