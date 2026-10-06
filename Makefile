CC ?= cc
CFLAGS ?= -std=c11 -Wall -Wextra -g
CPPFLAGS ?=
LDFLAGS ?=
LDLIBS ?=

TARGET ?= text_edit
SOURCES := main.c
OBJECTS := $(SOURCES:.c=.o)

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

run: $(TARGET)
	./$(TARGET) $(ARGS)

clean:
	rm -f $(OBJECTS) $(TARGET)