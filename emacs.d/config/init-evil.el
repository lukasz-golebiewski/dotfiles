;;; init-evil.el --- Evil mode bindings

;;; Commentary:

;; see no evil

;;; Code:
(use-package evil)
(use-package evil-leader)
(use-package evil-mc)

(require 'evil)
(require 'evil-leader)

(global-evil-mc-mode  1) ;; enable

(evil-define-key 'visual evil-mc-key-map
  "A" #'evil-mc-make-cursor-in-visual-selection-end
  "I" #'evil-mc-make-cursor-in-visual-selection-beg)

(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "e" 'find-file
  "y" 'helm-show-kill-ring
  "u" 'undo-tree-visualize
  "b" 'switch-to-buffer
  "r" 'lsp-find-references
  "d" 'lsp-find-definition
  "k" 'kill-buffer
  "gb" 'magit-blame
  "gf" 'magit-log-buffer-file ;; Shows history of the current file
  "gt" 'git-timemachine
  "jd" 'dumb-jump-go-prompt
)

;; folds text
(use-package vimish-fold
  :pin melpa
)
(vimish-fold-global-mode 1)
(evil-leader/set-key
  "vf" 'vimish-fold
  "vd" 'vimish-fold-delete
  "vD" 'vimish-fold-delete-all
  "vu" 'vimish-fold-unfold
  "vU" 'vimish-fold-unfold-all
  "vt" 'vimish-fold-toggle
  "vT" 'vimish-fold-toggle-all
)

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

(provide 'init-evil)
;;; init-evil.el ends here
