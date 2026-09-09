;;; init-ai.el --- Claude Code + local LLM (Centaur init-ai.el, NyanVim ai.lua)  -*- lexical-binding: t -*-
;;; Code:

;; claude-code.el: the `claude' CLI in an eat terminal beside your code.
;; <leader>a opens its map: c start · t toggle · s send prompt · r send region
;; e fix error at point · / slash commands · m full menu · k kill.
(use-package claude-code
  :vc (:url "https://github.com/stevemolitor/claude-code.el" :rev :newest)
  :hook (after-init . claude-code-mode)
  :custom
  (claude-code-terminal-backend 'eat)
  (claude-code-newline-keybinding-style 'newline-on-shift-return)
  :config
  ;; Claude buffer on the right, a third of the frame, like NyanVim's split.
  (add-to-list 'display-buffer-alist
               '("^\\*claude" (display-buffer-in-side-window)
                 (side . right) (window-width . 0.38)))
  (with-eval-after-load 'evil (evil-set-initial-state 'claude-code-eat-mode 'emacs)))

;; gen.nvim (ollama) → gptel. `M-x gptel-menu' switches backend/model.
(use-package gptel
  :custom (gptel-default-mode 'org-mode)
  :config
  (setq gptel-backend (gptel-make-ollama "Ollama" :host "localhost:11434" :stream t
                        :models '(llama3.1 qwen2.5-coder))
        gptel-model 'qwen2.5-coder))

(provide 'init-ai)
;;; init-ai.el ends here
