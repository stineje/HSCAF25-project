# Makefile

CC     = gcc
CFLAGS = -O3 
LIBS   = -lm
LFLAGS = -L. 
IFLAGS = -I../addins/berkeley-softfloat-3/source/include/
LIBS   = ../addins/berkeley-softfloat-3/build/Linux-x86_64-GCC/softfloat.a
SRCS   = $(wildcard *.c)

PROGS = $(patsubst %.c,%,$(SRCS))

all:	$(PROGS)

%: %.c
	$(CC) $(CFLAGS) $(IFLAGS) $(LFLAGS) -o $@ $< $(LIBS)

clean: 
	rm -f $(PROGS)
	rm -f *~


