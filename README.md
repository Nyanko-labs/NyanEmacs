# 🐱 NyanEmacs

NyanVim's keys and Night City look on Centaur Emacs' bones. One module per
file, ~600 lines of Elisp, readable in one sitting.

| NyanVim | NyanEmacs |
|---|---|
| lazy.nvim | package.el + use-package (`:defer` everywhere) |
| telescope | vertico + orderless + consult |
| nvim-cmp + LuaSnip | corfu + cape + yasnippet |
| lspconfig + Mason | eglot (builtin); install servers yourself, `M-x nyan-health` lists what's missing |
| nvim-treesitter | treesit-auto |
| conform | apheleia (`<leader>cf` falls back to eglot) |
| nvim-tree | treemacs (docked right, 35 cols) |
| lualine / bufferline | doom-modeline / `H` `L` cycle buffers |
| lazygit / gitsigns | magit / diff-hl |
| toggleterm | eat (`<leader>tt`) |
| dashboard-nvim | dashboard.el, same banner |
| claudecode.nvim | claude-code.el (`<leader>a`) |
| gen.nvim (ollama) | gptel (`<leader>o`) |
| nightcity.nvim "mix" | `themes/nightcity-mix-theme.el` |
| `:Nyan*` | `M-x nyan-{health,update,config,theme}` and `<leader>n…` |
| "Hold it Cowboy!" | ported |

## Install

```bash
brew install --cask emacs                    # 29.1+
bash ~/dotfiles/install.sh --skip-packages   # links config/emacs → ~/.config/emacs
emacs
```

First launch installs every package from MELPA (about a minute). Then
`M-x nyan-health`.

## Keys

`<space>` is the leader. One key for what you do all day, two keys for the
rest; press `<space>` and wait, which-key shows everything.

| Key | Does |
|---|---|
| `SPC SPC` · `SPC /` · `SPC ,` · `SPC .` | find file · grep project · buffers · recent |
| `SPC e` · `SPC g` · `SPC t` | explorer · magit · terminal |
| `SPC a` | Claude: `c` start `t` toggle `s` send `r` send region `e` fix error `/` slash `m` menu |
| `SPC c` | code: `a` action `f` format `r` rename `d` diagnostics `s` symbols |
| `SPC w` · `SPC q` · `SPC d` · `SPC p` | save · quit window · delete buffer · switch project |
| `SPC n` | nyan: `h` health `u` update `c` user.el `t` theme `p` packages |
| `gd` `gr` `gi` `K` `gc` `H` `L` `C-h/j/k/l` | Vim as usual |

## Make it yours

`user.el` (git-ignored) loads last: put overrides there, `<leader>nc` opens it.
`custom.el` is where Customize writes; also ignored.
