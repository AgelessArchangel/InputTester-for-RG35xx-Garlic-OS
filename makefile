
TARGET = inputTester

CC = $(CROSS_COMPILE)gcc
CFLAGS   = -Os -marm -mtune=cortex-a9 -mfpu=neon-fp16 -mfloat-abi=softfp -march=armv7-a
LDFLAGS	 = -ldl -lSDL -lSDL_image -lSDL_ttf -lpthread

all:
	@mkdir -p build
	$(CC) ./src/main.c -o ./build/$(TARGET) $(CFLAGS) $(LDFLAGS)
	@mkdir -p ./build/res
	@cp ./res/* ./build/res

linux:
	$(MAKE) CC=gcc CROSS_COMPILE="" CFLAGS="" --no-print-directory	
	
.PHONY: clean

clean:
	rm -fr ./build
