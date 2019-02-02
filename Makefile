LDSCRIPT = xdk-asf/samd21g18a_flash.ld
BOOTUP = xdk-asf/startup_samd21.o xdk-asf/system_samd21.o
MCUTYPE=__SAMD21G18A__

OBJS=$(BOOTUP) TestCode.o

# Tools
CC=arm-none-eabi-gcc
LD=arm-none-eabi-gcc
AR=arm-none-eabi-ar
AS=arm-none-eabi-as

ELF=TestCode.elf

LDFLAGS+= -T$(LDSCRIPT) -mthumb -mcpu=cortex-m0 -Wl,--gc-sections
CFLAGS+= -mcpu=cortex-m0 -mthumb -g
CFLAGS+= -I xdk-asf -I xdk-asf/include -I xdk-asf/cmsis -I .
CFLAGS+= -D$(MCUTYPE)

$(ELF):	$(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

# compile and generate dependency info
%.o:	%.c
	$(CC) -c $(CFLAGS) $< -o $@
	$(CC) -MM $(CFLAGS) $< > $*.d
%.o: %.s
	$(AS) $< -o $@
clean:
	rm -f $(OBJS) $(OBJS:.o=.d) $(ELF) startup_stm32f* $(CLEANOTHER)
debug:	$(ELF)
	arm-none-eabi-gdb -iex "target extended-remote localhost:3333" $(ELF)

# pull in dependencies
-include        $(OBJS:.o=.d)
