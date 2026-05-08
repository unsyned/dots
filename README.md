## todo
- ~set up qmk and~ qmk userspace
- ~keyboard shortcut toggle for night light~
- ~create virtual desktop kwin scripts for dynamic virtual desktops~
    - ~when moving to undefined workspace, create if not exists (including movign window to workspace that doesn't exist)~
    - using https://gitlab.com/carmanaught/kwin-scripts for this for now
- try plasma manager again

- clean up nvim config

### emacs custom distro
- evil
    - evil collection, snipe, surround, magit. what is evil everywhere?
- magit
- git signs/gutters? I think this is from vc gutter? what is the + pretty?
- org-roam
- vterm?
- vertico, consult, marginalia
- olivetti mode
- org modern mode
- hl-todo
- modeline
- snippets
- dired
- smart parens?
- file templates
- nix mode, emacs lisp, latex, lua, markdown, org, python, sh, yaml, cc + lsp, kotlin, java
- look into electric, tramp, undo, vc, checkers syntax
- also ophints
- do I need orderless? do i even use it? what is corfu?
- popup?
- what is vi tilde fringe
- look into what default bindings and smart parens gives us

#### doom info
modules    :config use-package :completion (corfu +orderless) vertico :ui doom dashboard hl-todo modeline ophints (popup +defaults) (vc-gutter +pretty) vi-tilde-fringe workspaces :editor (evil +everywhere) file-templates fold
           snippets (whitespace +guess +trim) :emacs dired electric tramp undo vc :term vterm :checkers syntax :tools (eval +overlay) lookup magit :os tty :lang (cc +lsp) emacs-lisp kotlin latex lua markdown nix org python sh yaml
           :config (default +bindings +smartparens)
packages   (olivetti) (org-modern) (org-super-agenda)
elpa       nix-mode magit-section llama cond-let
