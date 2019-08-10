all: package-lint dart-server.elc

.cask:
	cask install

package-lint: .cask
	cask emacs -batch \
	-eval "(setq package-archives \
	             '((\"gnu\" . \"https://elpa.gnu.org/packages/\") \
		       (\"melpa\" . \"https://melpa.org/packages/\")))" \
	-f package-initialize \
	-f package-refresh-contents \
	-l package-lint.el \
	-f package-lint-batch-and-exit \
	dart-server.el

dart-server.elc: .cask
	cask emacs -batch -f batch-byte-compile dart-server.el

checkdoc:
	emacs -batch -eval "(checkdoc-file \"dart-server.el\")"

.PHONY: test

test:
	cask exec ert-runner

clean: clean-cask clean-elc

clean-cask:
	rm -rf .cask

clean-elc:
	rm dart-server.elc
