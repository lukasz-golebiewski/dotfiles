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
  "l" 'ensime-edit-definition
  "h" 'ensime-pop-find-definition-stack
  "k" 'kill-buffer)

(evil-mode 1)
;;(key-chord-define evil-insert-state-map  "ff" 'evil-normal-state)
(global-set-key (kbd "C-c l") 'ensime-edit-definition)
(global-set-key (kbd "C-c h") 'ensime-pop-find-definition-stack)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  )
)
;; optional: this is the evil state that evil-magit will use
;; (setq evil-magit-state 'normal)
;; optional: disable additional bindings for yanking text
;; (setq evil-magit-use-y-for-yank nil)
(use-package evil-magit)
(use-package evil-surround)
(global-evil-surround-mode 1)
