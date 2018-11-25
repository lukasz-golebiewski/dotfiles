;; haskell

(use-package haskell-mode)
(use-package intero
  :pin melpa
)
(add-hook 'haskell-mode-hook 'intero-mode)
