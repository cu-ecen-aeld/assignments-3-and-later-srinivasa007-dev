CC ?= $(CROSS_COMPILE) gcc
CFLAGS ?= -Wall -Werror

TARGET = writer
SRC = writer.c
OBJ = writer.o

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(TARGET) $(OBJ)
