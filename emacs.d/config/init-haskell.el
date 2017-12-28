;; haskell

(packages-conditional-install
 '(ensime magit git-gutter neotree ace-window avy csv-mode
	  haskell-mode
))

(require 'haskell-mode)

(setq haskell-mode-hook (quote (turn-on-haskell-indentation)))

(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))
(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
(setq haskell-compile-cabal-build-command "stack build")
(defun my-haskell-mode-hook ()
  (local-set-key (kbd "C-c C-r") 'inferior-haskell-load-and-run))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
