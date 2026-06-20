NAME := PROG

SHELL := pwsh.exe
.SHELLFLAGS := -NoProfile -ExecutionPolicy Bypass -Command

AC := java -jar C:\Users\alexe\Tools\ac.jar

compile: build/${NAME}

build/${NAME}: src/${NAME}.S
	-mkdir build -ErrorAction SilentlyContinue
	merlin32 src $<

disk: build/work.dsk

build/work.dsk:
	Copy-Item disk/work.dsk build/work.dsk
	Set-Content -Encoding ASCII build/HELLO.bas '10 PRINT CHR$$(4);"BRUN $(NAME)"'
	Add-Content -Encoding ASCII build/HELLO.bas '20 END'
	${AC} -d build/work.dsk HELLO
	Get-Content -Raw -Encoding ASCII build/HELLO.bas | ${AC} -bas build/work.dsk HELLO

transfer: compile disk
	${AC} -d build/work.dsk ${NAME}
	Get-Content -Raw -AsByteStream build/${NAME} | ${AC} -p build/work.dsk ${NAME} BIN 0x2000

run: transfer
	AppleWin -d1 build/work.dsk

clean:
	cmake -E rm -rf build

build/work.dsk:
.PHONY: clean compile disk transfer run
