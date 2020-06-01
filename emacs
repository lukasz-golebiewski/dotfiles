;;; emacs --- Main emacs config

;;; Commentary:

;;; Code:
(defvar show-paren-delay)
(defvar use-package-always-ensure)
(defvar tags-revert-without-query)

(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil
 select-enable-clipboard t
 tags-revert-without-query t
)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
   (when (file-exists-p custom-file)
       (load custom-file))

;; character level diffs
(setq-default ediff-forward-word-function 'forward-char)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the package manager
(require 'package)
(setq
 package-archives '(("elpa"         . "http://elpa.gnu.org/packages/")
                    ("org"          . "http://orgmode.org/elpa/")
                    ("melpa"        . "http://melpa.org/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/"))
 package-archive-priorities '(("melpa-stable" . 1)
                              ("melpa"        . 2)
                              ("elpa"         . 3)
                              ("org"          . 4)
 )
)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(setq debug-on-error t)

(load "~/.emacs.d/config/init-utils.el")

;;; used packages:
(use-package smex)
(use-package ace-window)
(use-package ag)
(use-package avy)
(use-package bind-key)
(use-package csv-mode)
(use-package dockerfile-mode)
(use-package dumb-jump
  :config (setq dumb-jump-selector 'ivy)
)
(use-package elmacro)
(use-package eno)
(use-package fireplace)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
)
(use-package git-gutter-fringe+)

(use-package git-timemachine)
(use-package helm
  :bind (
    ("C-x C-f" . helm-mini)
    ("C-x C-d" . helm-find-files)
  )
)
(use-package helm-ag)
(use-package helm-projectile)
(use-package helm-swoop)
(use-package hydra)
(use-package idris-mode)
(use-package key-chord)
(use-package nyan-mode)
(use-package magit)
(use-package markdown-mode)
(use-package monokai-theme)
(use-package multiple-cursors
  :bind (
    ("C->" . mc/mark-next-like-this)
    ("C-<" . mc/mark-previous-like-this)
    ("C-c C-<" . mc/mark-previous-like-this)
  )
)
(use-package nix-mode
  :mode "\\.nix\\'"
)
(use-package projectile)
(use-package recentf
  :ensure t
  :init (recentf-mode +1)
  :config (setq recentf-max-saved-items 200
      recentf-max-menu-items 15
  )
)
(use-package smartparens)
(use-package suggest)
(use-package undo-tree)
(use-package vlf)
(use-package which-key)
(use-package yaml-mode)
(use-package yasnippet
  :pin melpa
)
(use-package zoom-window)

;;; global hooks:
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; global modes:
(electric-indent-mode 0)
(ido-mode 1)
(global-git-gutter+-mode +1)
(show-paren-mode 1)
(column-number-mode 1)
(elmacro-mode 1)
;; Who uses the bar to scroll?
(scroll-bar-mode 0)
;; disable gui
(tool-bar-mode 0)
(menu-bar-mode 0)
(which-key-mode)
(global-undo-tree-mode 1)
(helm-mode 1)
(nyan-mode 1)
(yas-global-mode 1)

;; This is bound to f11 in Emacs 24.4
(toggle-frame-fullscreen)
;; prompt only y or no
(fset `yes-or-no-p `y-or-n-p)

;;; theme:
(load-theme 'monokai t)

(when (not package-archive-contents)
  (package-refresh-contents))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(auto-package-update-maybe)
(require 'vlf-setup)
(setq line-move-visual nil)

;;; custom key mappings:
(global-set-key (kbd "C-x C-m") 'magit-status)
(global-set-key (kbd "C-x R") 'magit-ediff-resolve)
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
(global-set-key (kbd "C-c f g") 'find-grep)
(global-set-key (kbd "C-c j") 'avy-goto-subword-1)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c C-s m") 'ace-maximize-window)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-c [") 'previous-buffer)
(global-set-key (kbd "C-c ]") 'next-buffer)
(global-set-key (kbd "S-C-l") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-h") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-j") 'shrink-window)
(global-set-key (kbd "S-C-k") 'enlarge-window)
(global-set-key (kbd "C-c u") 'undo-tree-visualize)
(global-set-key (kbd "C-c l") 'dumb-jump-go)
(global-set-key (kbd "C-c h") 'dumb-jump-back)
(global-set-key (kbd "C-x C-z") 'zoom-window-zoom)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c C-f") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(global-set-key (kbd "C-s") 'helm-occur)

;;; key chords:
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "sw" 'ace-swap-window)
(key-chord-define-global "df" 'helm-do-ag-project-root)
(key-chord-define-global "e[" 'replace-regexp)
(key-chord-define-global "e]" 'projectile-replace-regexp)
(key-chord-define-global "r[" 'replace-string)
(key-chord-define-global "r]" 'projectile-replace)
(key-chord-define-global "lm" 'linum-mode)

(require 'eno)
(key-chord-define-global "jk" 'eno-word-goto)
(global-set-key (kbd "C-x SPC") 'toggle-window-split)

(require 'imenu)

(load "~/.emacs.d/config/init-evil.el")
(load "~/.emacs.d/config/init-haskell.el")
(load "~/.emacs.d/config/init-org.el")
;;(load "~/.emacs.d/config/init-scala.el")

(load "~/.emacs.d/extras/ghcid.el")
(load "~/.emacs.d/extras/ghcid-nix.el")

(defun zoom-in () "Zooms all the frames in." (interactive) (zoom '+))
(defun zoom-out () "Zooms all the frames out." (interactive) (zoom '-))

(defun zoom (fun)
  "Helper function. FUN needs to be a binary math function on integers like + or -."
  (set-face-attribute 'default nil :height (funcall fun (face-attribute 'default :height) 10))
)

(global-set-key (kbd "C-+") 'zoom-in)
(global-set-key (kbd "C-=") 'zoom-in)
(global-set-key (kbd "C--") 'zoom-out)

(use-package company
  :init
  (setq company-backends '((company-files company-keywords company-capf company-dabbrev-code company-dabbrev company-ispell)))
  :config
  (global-company-mode)
;; (add-to-list 'company-backends 'company-yasnippet)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  :bind ("C-<tab>" . 'company-complete-common-or-cycle)
)
;; "aggressive" completion (no delays, quick feedback)
(setq company-idle-delay 0
      company-echo-delay 0
      company-minimum-prefix-length 4
      company-selection-wrap-around t
      company-transformers '(company-sort-by-occurrence
                             company-sort-by-backend-importance))
(defvar company-dabbrev-downcase nil)

(provide 'emacs)
(and window-system (server-start))
;;; emacs ends here
