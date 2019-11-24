;; haskell

(use-package haskell-mode
  :pin melpa
)

(use-package flycheck-haskell)
(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

(provide 'init-haskell)
;;; init-haskell.el ends here
