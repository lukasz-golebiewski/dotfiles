;;; custom.el -- Emacs custom variables

;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "c9e123d4ecd9ceb056806c6297336763e9e96eed6962bfc1d5252afcc2761610" default)))
 '(git-gutter:update-interval 2)
 '(org-agenda-files (quote ("~/notes/DOING.org")))
 '(package-selected-packages
   (quote
    (fireplace 0blayout dumb-jump lsp-mode sbt-mode haskell-mode evil nix-mode zoom-window yasnippet yaml-mode which-key vlf use-package suggest smex smartparens scala-mode nyan-mode multiple-cursors monokai-theme lsp-ui lsp-scala lsp-haskell lcr key-chord idris-mode hydra helm-swoop helm-projectile helm-lsp helm-ag git-timemachine flycheck-haskell evil-surround evil-mc evil-magit evil-leader eno elmacro dockerfile-mode csv-mode company-lsp ag ace-window)))
 '(safe-local-variable-values (quote ((python-shell-interpreter . "python3"))))
 '(zoom-window-mode-line-color "DarkGreen"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'custom)
;;; custom.el ends here
