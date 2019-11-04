;; haskell

(use-package haskell-mode
  :pin melpa
)

(use-package flycheck-haskell)
(add-hook 'haskell-mode-hook #'flycheck-haskell-setup)

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

(add-hook 'dante-mode-hook
   '(lambda () (flycheck-add-next-checker 'haskell-dante
                '(warning . haskell-hlint))))

(provide 'init-haskell)
;;; init-haskell.el ends here
