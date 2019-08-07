all: dart-server.elc

.cask:
	cask install

dart-server.elc: .cask
	cask emacs -batch -f batch-byte-compile dart-server.el

.PHONY: test

test:
	cask exec ert-runner

clean: clean-cask clean-elc

clean-cask:
	rm -rf .cask

clean-elc:
	rm dart-server.elc
