;;; init-haskell.el -- Initialize packages used for Haskell development

;;; Commentary:

;;; Code:
(use-package haskell-mode
  :init (setq haskell-stylish-on-save 1)
  :pin melpa
)

;;(use-package flycheck-haskell)
;;(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

(use-package lsp-haskell
  :pin melpa
)

(use-package lsp-mode
    :hook (haskell-mode . lsp-deferred)
    :commands (lsp lsp-deferred))

(provide 'init-haskell)
;;; init-haskell.el ends here
