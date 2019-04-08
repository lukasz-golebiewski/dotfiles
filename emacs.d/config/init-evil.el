;; see no evil
(use-package evil)
(use-package evil-leader)
(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "y" 'helm-show-kill-ring
  "u" 'undo-tree-visualize
  "b" 'switch-to-buffer
  "r" 'lsp-find-references
  "d" 'lsp-find-definition
  "k" 'kill-buffer)

(evil-mode 1)
;;(key-chord-define evil-insert-state-map  "ff" 'evil-normal-state)
;;(global-set-key (kbd "C-c l") 'lsp-ui-peek-find-definitions)
;;(global-set-key (kbd "C-c h") 'lsp-ui-peek-jump-backward)

;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'normal)
;; optional: disable additional bindings for yanking text
;; (setq evil-magit-use-y-for-yank nil)
(use-package evil-magit)
(use-package evil-surround)
(global-evil-surround-mode 1)
