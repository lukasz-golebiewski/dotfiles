;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-basic-offset 4)

;; modes
(electric-indent-mode 0)

;; global keybindings
(global-unset-key (kbd "C-z"))

;; the repositories
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(package-initialize)

(setq debug-on-error t)

;; mandatory modules installation
(defun package-conditional-install (package-name)
  "Installs a package if it is not present"
  (unless (package-installed-p package-name)
  (package-refresh-contents) (package-install package-name)))

(defun packages-conditional-install (packages)
  ""
  (when packages
    (package-conditional-install (car packages))
    (packages-conditional-install (cdr packages))))

(require 'use-package)
(use-package ensime
	     :pin melpa-stable)

(packages-conditional-install
 '(use-package ensime magit git-gutter neotree ace-window avy csv-mode
	  elmacro key-chord multiple-cursors annoying-arrows-mode smartparens
	  auto-package-update org which-key undo-tree bind-key projectile ag helm helm-ag helm-projectile
	  nyan-mode yasnippet monokai-theme zoom-frm eno vlf markdown-mode evil git-timemachine haskell-mode
))

(load-theme 'monokai t)

(when (not package-archive-contents)
  (package-refresh-contents))

;; ensime hooked to scala-mode
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
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
 '(safe-local-variable-values (quote ((python-shell-interpreter . "python3")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; missing tools
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  (next-line))

(defun copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
    (interactive "p")
    (let ((beg (line-beginning-position))
          (end (line-end-position arg)))
      (when mark-active
        (if (> (point) (mark))
            (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
          (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
      (if (eq last-command 'copy-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-ring-save beg end)))
    (kill-append "\n" nil)
    (beginning-of-line (or (and arg (1+ arg)) 2))
    (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun double-line (arg)
  "copy line and place it below the original"
  (interactive "p")
  (copy-line arg)
  (yank)
  (move-end-of-line))

;; remember all opened files
(desktop-save-mode 1)

;; enable mandatory modes
(global-git-gutter-mode +1)

(show-paren-mode 1)
(column-number-mode 1)

;; disable gui-related nonsens
(tool-bar-mode 0)
(menu-bar-mode 0)

;; prompt only y or no
(fset `yes-or-no-p `y-or-n-p)

(setq haskell-mode-hook (quote (turn-on-haskell-indentation)))
(annoying-arrows-mode 1)
(elmacro-mode 1)

;; This is bound to f11 in Emacs 24.4
(toggle-frame-fullscreen)
;; Who uses the bar to scroll?
(scroll-bar-mode 0)

(auto-package-update-maybe)

(which-key-mode)
(global-undo-tree-mode 1)

(require 'vlf-setup)
(setq line-move-visual nil)

;; custom kbd mappings
(global-set-key (kbd "C-s-c C-s-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-m") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x C-m") 'magit-status)
(global-set-key (kbd "C-x R") 'magit-ediff-resolve)
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
(global-set-key (kbd "C-+") 'zoom-frm-in)
(global-set-key (kbd "C--") 'zoom-frm-out)
(global-set-key (kbd "C-x n") 'neotree-toggle)
(global-set-key (kbd "C-c f g") 'find-grep)
(global-set-key (kbd "C-c j") 'avy-goto-subword-1)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c C-s s") 'ace-swap-window)
(global-set-key (kbd "C-c C-s m") 'ace-maximize-window)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c n") 'neotree-find)
;;(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-c C-f") 'helm-projectile-find-file-dwim)
(global-set-key (kbd "C-.") 'goto-last-change)
(global-set-key (kbd "C-c [") 'previous-buffer)
(global-set-key (kbd "C-c ]") 'next-buffer)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "sw" 'ace-swap-window)
(key-chord-define-global "fg" 'helm-do-ag-project-root)
(key-chord-define-global "cd" 'double-line)
(key-chord-define-global "r[" 'replace-string)
(key-chord-define-global "r]" 'projectile-replace-regexp)

(require 'eno)
;;(global-set-key (kbd "M-s") 'eno-word-goto)
(key-chord-define-global "jk" 'eno-word-goto)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'nyan-mode)
(nyan-mode 1)

(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional
(setq python-shell-interpreter "python3")

(global-set-key (kbd "S-C-l") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-h") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-j") 'shrink-window)
(global-set-key (kbd "S-C-k") 'enlarge-window)

(global-set-key (kbd "C-c u") 'undo-tree-visualize)

;; see no evil
(require 'evil)
(evil-mode 1)
(key-chord-define evil-insert-state-map  "gg" 'evil-normal-state)

(global-set-key (kbd "M-'") 'ensime-edit-definition)
(global-set-key (kbd "M-;") 'ensime-pop-find-definition-stack)

(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
  )
)
;; haskell
(eval-after-load "haskell-mode"
    '(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-compile))
(eval-after-load "haskell-cabal"
    '(define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-compile))
(setq haskell-compile-cabal-build-command "stack build")
(defun my-haskell-mode-hook ()
  (local-set-key (kbd "C-c C-r") 'inferior-haskell-load-and-run))
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
