;; haskell

(use-package haskell-mode
  :pin melpa
)

;;(use-package intero
;;  :pin melpa
;;)
;;(add-hook 'haskell-mode-hook 'intero-mode)
;;(add-hook 'intero-mode-hook
;;          (lambda() (local-set-key (kbd "C-c l") 'intero-goto-definition))
;;)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  ;; OR:
  ;; (add-hook 'haskell-mode-hook 'flymake-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  )
