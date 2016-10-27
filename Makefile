CRYSTAL_BIN ?= $(shell which crystal)
build:
	$(CRYSTAL_BIN) build --release -o bin/cli bin/cli.cr $(CRFLAGS)
clean:
	rm -f ./bin/cli
