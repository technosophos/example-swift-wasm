# Not sure if this is necesssary, so omiting for now
# DEBUG_OPT = -debug-info-format=dwarf

SWIFTC = swiftc
TARGET ?= wasm32-unknown-wasi
DEST ?= example-swift-wasm.wasm
SRC_DIR ?= ./src
SDK_DIR ?= "/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin"

.PHONY: build
build:
	PATH=$(SDK_DIR):$$PATH \
	$(SWIFTC) -target $(TARGET) $(SRC_DIR)/main.swift -o $(DEST) 

.PHONY: build-linux
build-linux:
	$(SWIFTC) -target $(TARGET) -sdk ./usr/share/wasi-sysroot $(SRC_DIR)/main.swift -o $(DEST) 