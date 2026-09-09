;;; init-evil.el --- evil + a flat <space> leader  -*- lexical-binding: t -*-
;; Single owner of every global keymap. Doom-style: the things you do all day
;; are one key after <space>; everything else is a two-key group which-key
;; shows you. Vim-native keys (gd, gr, gc, K, C-h/j/k/l) stay where Vim has them.
;;; Code:

(use-package evil
  :demand t
  :init
  (setq evil-want-keybinding nil        ; evil-collection does it
        evil-want-C-u-scroll t
        evil-want-C-i-jump t
        evil-want-Y-yank-to-eol t
        evil-undo-system 'undo-redo
        evil-split-window-below t
        evil-vsplit-window-right t
        evil-search-module 'evil-search
        evil-ex-search-case 'smart
        evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  ;; v< v> keep the selection.
  (evil-define-key 'visual 'global
    "<" (lambda () (interactive) (call-interactively #'evil-shift-left)  (evil-normal-state) (evil-visual-restore))
    ">" (lambda () (interactive) (call-interactively #'evil-shift-right) (evil-normal-state) (evil-visual-restore)))
  (evil-define-key 'normal 'global
    (kbd "C-h") #'evil-window-left  (kbd "C-j") #'evil-window-down
    (kbd "C-k") #'evil-window-up    (kbd "C-l") #'evil-window-right
    "H" #'previous-buffer "L" #'next-buffer
    "K" #'nyan-hover
    "gd" #'xref-find-definitions "gr" #'xref-find-references
    "gi" #'eglot-find-implementation "gD" #'eglot-find-declaration
    (kbd "C-p") #'nyan-find-file))

(use-package evil-collection
  :after evil :demand t
  :custom (evil-collection-setup-minibuffer nil)
  :config (evil-collection-init))
(use-package evil-surround   :after evil :demand t :config (global-evil-surround-mode 1))
(use-package evil-commentary :after evil :demand t :config (evil-commentary-mode 1)) ; gc

(use-package general
  :after evil :demand t
  :config
  (general-evil-setup)
  (general-create-definer nyan-leader :states '(normal visual) :keymaps 'override :prefix "SPC")
  (nyan-leader
    ;; one key: all-day actions
    "SPC" '(nyan-find-file :wk "Find file")
    "/"   '(consult-ripgrep :wk "Grep project")
    ","   '(consult-buffer :wk "Switch buffer")
    "."   '(consult-recent-file :wk "Recent files")
    "*"   '(consult-ripgrep-symbol-at-point :wk "Grep word at point")
    "e"   '(treemacs :wk "Explorer")
    "g"   '(magit-status :wk "Git")
    "t"   '(nyan-terminal :wk "Terminal")
    "w"   '(save-buffer :wk "Save")
    "q"   '(evil-quit :wk "Quit window")
    "Q"   '(save-buffers-kill-terminal :wk "Quit Emacs")
    "h"   '(evil-ex-nohighlight :wk "Clear search")
    "d"   '(kill-current-buffer :wk "Delete buffer")
    "p"   '(project-switch-project :wk "Switch project")
    "?"   '(describe-bindings :wk "All keys")
    ;; two keys: groups
    "a"   '(:keymap claude-code-command-map :package claude-code :wk "claude")
    "o"   '(gptel :wk "Ollama chat")
    "c"   '(:ignore t :wk "code")
    "ca"  '(eglot-code-actions :wk "Action")
    "cf"  '(nyan-format :wk "Format")
    "cr"  '(eglot-rename :wk "Rename")
    "cd"  '(consult-flymake :wk "Diagnostics")
    "cs"  '(consult-imenu :wk "Symbols")
    "cS"  '(consult-eglot-symbols :wk "Workspace symbols")
    "ct"  '(hl-todo-occur :wk "TODOs")
    "s"   '(:ignore t :wk "search")
    "ss"  '(consult-line :wk "In buffer")
    "sh"  '(consult-info :wk "Help/info")
    "sy"  '(consult-yank-pop :wk "Yank history")
    "b"   '(:ignore t :wk "buffer")
    "bo"  '(nyan-kill-other-buffers :wk "Kill others")
    "bd"  '(magit-diff-buffer-file :wk "Diff this file")
    "n"   '(:ignore t :wk "nyan")
    "nh"  '(nyan-health :wk "Health")
    "nu"  '(nyan-update :wk "Update")
    "nc"  '(nyan-config :wk "Edit user.el")
    "nt"  '(nyan-theme :wk "Theme")
    "np"  '(list-packages :wk "Packages")))

(provide 'init-evil)
;;; init-evil.el ends here
