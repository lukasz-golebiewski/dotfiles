;; haskell

(use-package haskell-mode)
(use-package intero
  :pin melpa
)
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'intero-mode-hook
          (lambda() (local-set-key (kbd "C-c l") 'intero-goto-definition))
)
