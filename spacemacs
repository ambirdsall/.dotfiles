;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; * layers
(defun dotspacemacs/layers ()
;; ** framework configuration
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
;; ** layers
   dotspacemacs-configuration-layers '(python
                                       sql
                                       yaml
                                       auto-completion
                                       better-defaults
                                       colors
                                       dash
                                       docker
                                       elixir
                                       elm
                                       emacs-lisp
                                       git
                                       github
                                       graphviz
                                       helm
                                       html
                                       javascript
                                       lsp
                                       markdown
                                       nginx
                                       (org :variables
                                            org-enable-bootstrap-support t
                                            org-enable-github-support t
                                            org-enable-reveal-js-support t
                                            org-hide-emphasis-markers t)
                                       osx
                                       react
                                       (restclient :variables
                                                   restclient-use-org t)
                                       (scala :variables
                                              scala-enable-eldoc t)
                                       (shell :variables
                                              shell-default-height 30
                                              shell-default-position 'fullscreen
                                              shell-default-shell 'eshell)
                                       shell-scripts
                                       (spell-checking :variables
                                                       spell-checking-enable-by-default nil)
                                       spotify
                                       sql
                                       syntax-checking
                                       ;; themes-megapack
                                       theming
                                       tmux
                                       (typescript :variables
                                                   typescript-backend 'tide)
                                       version-control
                                       vimscript)
;; ** additional packages
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ac-html-angular
                                      add-node-modules-path
                                      angular-mode
                                      angular-snippets
                                      bart-mode
                                      dash-at-point
                                      doom-modeline
                                      doom-themes
                                      editorconfig
                                      evil-textobj-anyblock
                                      evil-textobj-line
                                      evil-replace-with-register
                                      exec-path-from-shell
                                      fireplace
                                      groovy-mode
                                      jasminejs-mode
                                      lsp-scala
                                      nvm
                                      outshine
                                      ob-typescript
                                      origami
                                      ox-hugo
                                      ox-tufte
                                      sicp)
;; ** frozen packages
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
;; ** excluded packages
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(spaceline
                                    evil-search-highlight-persist)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

;; * dotspacemacs-variables
(defun dotspacemacs/init ()
;; ** preamble
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
;; ** le grand setq-default
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;     ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory 'emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((bookmarks . 5)
                                (projects . 15)
                                (recents . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'emacs-lisp-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-one
                         solarized-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "ᕙ(⇀‸↼‶)ᕗ"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 2
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; dotspacemacs-mode-line-theme (if (display-graphic-p) 'all-the-icons 'spacemacs)
   dotspacemacs-mode-line-theme 'vanilla
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;     :disabled-for-modes dired-mode
   ;;                         doc-view-mode
   ;;                         markdown-mode
   ;;                         org-mode
   ;;                         pdf-view-mode
   ;;                         text-mode
   ;;     :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

;; * $ENVIRONMENT_VARIABLES
(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

;; * user-init
(defun dotspacemacs/user-init ()
;; ** preamble
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
;; ** language environments
;; *** typescript
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
  ;; (setq hybrid-mode-enable-hjkl-bindings nil)

;; ** default frame size
  (when (display-graphic-p)
    (add-to-list 'default-frame-alist '(height . 72))
    (add-to-list 'default-frame-alist '(width . 150)))

  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer-elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)

;; ** backup files
  (setq backup-directory-alist
        `(("." . ,(expand-file-name
                   (concat user-emacs-directory "backups"))))))

;; * dumping
(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

;; * user-config
(defun dotspacemacs/user-config ()
;; ** return of the macOS
  (when (eq system-type 'darwin)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'super)
    (setq ns-function-modifier 'hyper))

;; ** better defaults
  (setq-default major-mode 'org-mode)
  (setq auto-save-default nil)
  (setq frame-title-format '((:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b"))))
  (setq fill-column 100)
  (setq x-select-enable-clipboard nil)
  (setq helm-info-default-sources '(helm-source-info-emacs helm-source-info-elisp helm-source-info-org helm-source-info-magit))
  (setq company-tooltip-align-annotations t)
  (setq helm-grep-ag-command "rg --color=always --colors 'match:fg:black' --colors 'match:bg:yellow' --smart-case --no-heading --line-number %s %s %s --ignore-file '*/dist-*' ")
  (setq helm-grep-ag-pipe-cmd-switches '("--colors 'match:fg:black'" "--colors 'match:bg:yellow'"))
  (setq-default indent-tabs-mode nil)
;; ** load amb/*
  (add-to-load-path (concat user-emacs-directory "amb"))
  (require 'amb-predicate-aliases)
  (require 'amb-terminal)
  (require 'amb-ui)
  (require 'amb-helper-functions)
  (require 'amb-git)
  (require 'amb-org)

  (cl-flet ((amb/ (lambda (filename) (s-concat user-emacs-directory "amb/" filename))))
    ;; (load (amb/ "whitespace.el"))
    ;; (load (amb/ "predicate-aliases.el"))
    ;; (load (amb/ "git.el"))
    (load (amb/ "hooks.el"))
    ;; (load (amb/ "text-objects.el"))
    ;; (load (amb/ "helper-functions.el"))
    ;; (load (amb/ "keybindings.el"))
    (load (amb/ "variables.el")))

;; ** require some generally-useful libraries just in case they're not around yet
  (require 'cl)
  (require 'dash)
  (require 's)

  (progn ;; nvm
    (require 'nvm)
    (nvm-use (with-temp-buffer
               ;; (insert-file-contents "~/workspace/react-mono/.nvmrc")
               (insert-file-contents "~/workspace/ngts/.nvmrc")
               (s-chomp (buffer-string)))))

;; ** evil
;; *** evil-replace-with-register
  (require 'evil-replace-with-register)
  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install)

;; ** company-mode
  (global-company-mode)
  (company-tng-configure-default)

;; ** .dir-locals.el behavior
  ;; hitting "y" once is plenty, thanks
  (advice-add 'risky-local-variable-p :override #'ignore)

;; ** org it up
;; *** outshine
    (require 'outshine)

    (add-hook 'prog-mode-hook 'outshine-mode)

    ;; Narrowing now works within the headline rather than requiring to be on it
    (advice-add 'outshine-narrow-to-subtree :before
                (lambda (&rest args) (unless (outline-on-heading-p t)
                                       (outline-previous-visible-heading 1))))

;; ** paint me like one of your french editors
;; *** frame appearance
    (when (eq system-type 'darwin)
      (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
      (add-to-list 'default-frame-alist '(ns-appearance . dark)))

;; *** Get rid of the dated stuff
    (scroll-bar-mode -1)
    (tool-bar-mode   -1)
    (tooltip-mode    -1)
    (menu-bar-mode   -1)
;; *** mode-line
  (spacemacs/toggle-mode-line-battery-on)

;; *** rainbow mode
  (with-eval-after-load 'rainbow-mode
    (setq old-rainbow-html-colors-major-mode-list rainbow-html-colors-major-mode-list)
    (setq rainbow-html-colors-major-mode-list (cons 'scss-mode rainbow-html-colors-major-mode-list)))

;; ** programming language environments
;; *** elisp
;; **** lord help me, I need a better tabs vs spaces system
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq-local indent-tabs-mode nil)))
;; *** scala
  (setq ensime-startup-notification nil)

;; *** typescript
  ;; Fix errors resulting from tempfiles in the source directory
  (with-eval-after-load 'typescript-tslint
    (setcar (memq 'source-inplace (flycheck-checker-get 'typescript-tslint 'command))
            'source-original))

  ;; ** tags and shit
  ;; I never want to open ETAGS in the editor; I want to think of it purely as a support buffer
(and (boundp 'spacemacs-useless-buffers-regexp) (push "ETAGS" spacemacs-useless-buffers-regexp))

  ;;;;;;;;;;;;;;;
  ;; PROJECTILE / TAGS
  ;; Copyright (c) 2016, Matthew Weigel, cf. https://github.com/bsdcat/effortless_git_tags
  (defun find-git-repo-tags-file ()
    "Find a TAGS file (as ETAGS) if the current buffer is in a git repository."
    (when
        (and (buffer-file-name) (vc-git-root (buffer-file-name))
             (file-readable-p (expand-file-name ".git/ETAGS" (vc-git-root (buffer-file-name)))))
      (expand-file-name ".git/ETAGS" (vc-git-root (buffer-file-name)))))

  (defvar default-tags-table-function 'find-git-repo-tags-file)

;; ** editorconfig
  (use-package editorconfig
    :ensure t
    :defer t
    :config
    (editorconfig-mode 1))

;; ** load keybindings last, in hopes that they won't be overwritten
;; *** org/outshine
(if (display-graphic-p) ;; org-mode heading keybindings
    (with-eval-after-load 'org
      (define-key org-mode-map (kbd "C-RET") #'amb/org-new-heading)
      (define-key org-mode-map (kbd "C-S-RET") #'amb/org-new-subheading)
      (define-key org-mode-map [remap evil-org-org-insert-todo-heading-respect-content-below] 'amb/org-new-subheading)
      ;; (evil-define-key 'normal org-mode-map
      ;;   (kbd "C-RET") #'amb/org-new-heading
      ;;   (kbd "C-S-RET") #'amb/org-new-subheading)
      )
  (with-eval-after-load 'org
    (let ((map (if (boundp 'input-decode-map)
                   input-decode-map
                 function-key-map)))
      (define-key map "\e[1;P9" (kbd "C-RET"))
      (define-key org-mode-map (kbd "C-RET") #'amb/org-new-heading)
      (define-key map "\e[1;P10" (kbd "C-S-RET"))
      (define-key org-mode-map (kbd "C-S-RET") #'amb/org-new-subheading)
      (define-key org-mode-map [remap evil-org-org-insert-todo-heading-respect-content-below] 'amb/org-new-subheading)
      ; (evil-define-key 'normal org-mode-map $
      ;   (kbd "C-RET") #'amb/org-new-heading $
      ;   (kbd "C-S-RET") #'amb/org-new-subheading) $
      )))

(spacemacs/set-leader-keys
  ;; Narrowing
  "nn" 'outshine-narrow-to-subtree
  "nw" 'widen

  ;; Structural edits
  "nj" 'outline-move-subtree-down
  "nk" 'outline-move-subtree-up
  "nh" 'outline-promote
  "nl" 'outline-demote)

;; TODO: use outshine map instead
(let ((kmap outline-minor-mode-map))
  (define-key kmap (kbd "M-RET") 'outshine-insert-heading)
  (define-key kmap (kbd "<backtab>") 'outshine-cycle-buffer)

  (evil-define-key '(normal visual motion) kmap
    "gh" 'outline-up-heading
    "gj" 'outline-forward-same-level
    "gk" 'outline-backward-same-level))

;; *** amb/keybindings

;; logical equivalent of vim's ~o~ and ~O~ in emacs
(progn
  (global-set-key (kbd "<C-return>") 'open-line-below)
  (global-set-key (kbd "<C-S-return>") 'open-line-above))

(progn ;; global application shortcuts to match OS keybindings
  (global-set-key (kbd "M-s-SPC") (lambda () (interactive) (shell-command "open '/Applications/Google Chrome.app'")))
  ;; s-SPC not always getting recognized tho
  (global-set-key (kbd "s-SPC") (lambda () (interactive) (shell-command "open '/Applications/iTerm.app"))))

(global-set-key [remap fill-paragraph]
                #'amb/fill-or-unfill)

(progn ;; limited global paredit
  (global-set-key (kbd "C-)") 'paredit-forward-slurp-sexp)
  (global-set-key (kbd "C-(") 'paredit-backward-slurp-sexp)
  (global-set-key (kbd "C-}") 'paredit-forward-barf-sexp)
  (global-set-key (kbd "C-}") 'paredit-backward-barf-sexp))

(with-eval-after-load 'doc-view ;; fix clobbered keybinding in docview mode
  (define-key doc-view-mode-map (kbd "n") 'doc-view-next-page)
  (define-key doc-view-mode-map (kbd "l") 'doc-view-next-page))

(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "g" #'amb/edit-org-mode-glossary-notes)

(spacemacs/declare-prefix "d" "dash")
(spacemacs/declare-prefix "o" "ᕙ(⇀‸↼‶)ᕗ")
(spacemacs/declare-prefix "oe" "edit note files")
(spacemacs/set-leader-keys
  "oea" #'amb/edit-aliases
  "oec" #'amb/edit-cli-primer
  "oee" #'amb/pick-a-note-why-dont-ya
  "oeE" #'amb/edit-elisp-notes
  "oed" #'amb/edit-helper-functions
  "oen" #'amb/edit-ngts-todos
  "oev" #'amb/edit-variables
  "fev" #'amb/edit-variables
  "fee" #'amb/pick-an-elisp-file-why-dont-ya
  "oet" #'amb/edit-text-objects
  "oes" #'amb/edit-sigfig-notes
  "oek" #'amb/edit-keybindings
  "fek" #'amb/edit-keybindings)

(spacemacs/declare-prefix "ot" "typescript")
(spacemacs/set-leader-keys
  "otc" #'tide-jsdoc-template
  "ott" #'amb/type-check-current-buffer-file
  "otp" #'amb/prettify-region
  "otP" #'amb/prettify-buffer
  "oty" #'amb/copy-file-path-relative-to-project-root)

(spacemacs/declare-prefix "oh" "help")
(spacemacs/set-leader-keys
  "ohk" #'which-key-show-major-mode
  "ohK" #'which-key-show-keymap)

(spacemacs/declare-prefix "ox" "text")
(spacemacs/set-leader-keys
  "oxt" #'amb/tabify-buffer
  "oxT" #'amb/untabify-buffer)

(spacemacs/declare-prefix "zo" "origami")
(spacemacs/set-leader-keys
  "zoc" #'origami-close-all-nodes
  "zoo" #'origami-open-all-nodes)

(spacemacs/declare-prefix ")" "paredit ⇨")
(spacemacs/set-leader-keys
  ")s" #'paredit-forward-slurp-sexp
  ")b" #'paredit-forward-barf-sexp)

(spacemacs/declare-prefix "(" "paredit ⇦")
(spacemacs/set-leader-keys
  "(s" #'paredit-forward-slurp-sexp
  "(b" #'paredit-forward-barf-sexp)

(spacemacs/declare-prefix "H" "helm")
(spacemacs/set-leader-keys
  "Hf" #'helm-find-files
  "Hp" #'helm-projectile-find-file
  "Hm" #'helm-multi-files
  "Hs" #'helm-swoop
  "HS" #'helm-multi-swoop-all
  "Hi" #'helm-semantic-or-imenu
  "Hg" #'helm-grep-do-git-grep)

(spacemacs/set-leader-keys
  ":"    #'helm-M-x
  "."    (lambda () (interactive) (dired "."))
  "/"    #'spacemacs/helm-project-do-rg
  "SPC"  #'amb/jump-around
  "aD"   #'dired-projectile-project-root
  "D"    #'docker
  "fa"   #'amb/find-alternate-file
  "ft"   #'amb/touch-current-file
  "fer"  #'source-dotspacemacs-user-config
  "G"    #'magit-status
  "L"    #'spacemacs/workspaces-transient-state/body
  "l"    #'spacemacs/layouts-transient-state/body
  "nk"   #'evil-numbers/inc-at-pt
  "nj"   #'evil-numbers/dec-at-pt
  "oa"   #'org-agenda
  "oA"   #'amb/open-agenda-file
  "oc"   #'amb/toggle-clipboard
  "od"   #'delete-trailing-whitespace
  "of"   #'evil-first-non-blank
  "oF"   #'font-lock-fontify-buffer
  ; "oh" #'spacemacs/evil-search-clear-highlight $
  "ol"   #'evil-buffer
  "oo"   #'evil-open-below-without-leaving-normal-state
  "oO"   #'evil-open-above-without-leaving-normal-state
  "op"   #'amb/paste-from-clipboard
  "oy"   #'amb/evil-yank-to-clipboard
  "oz"   #'evil-toggle-fold
  "po"   #'org-projectile/goto-todos
  "ps"   #'amb/helm-ag-in-projectile-root
  "hf"   #'describe-function
  "hh"   #'describe-key-briefly
  "hm"   #'woman
  "hk"   #'describe-key
  "hK"   #'which-key-show-top-level
  "hv"   #'describe-variable
  "J"    #'evil-avy-goto-char-timer
  "jj"   #'evil-avy-goto-char-2
  "jJ"   #'evil-avy-goto-char
  "si"   #'helm-imenu
  "V"    #'er/contract-region
  "ww"   #'ace-window
  "wW"   #'other-window
  "W"    #'subword-mode
  "xF"   #'unfill-paragraph
  "zO"   #'origami-mode
  "Z"    #'evil-toggle-fold)

(progn ;; jump between isearch results using arrow keys.
  ;; left/right is backward/forward, up/down is history. press Return to exit
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))

(with-eval-after-load 'dired
  (evilified-state-evilify dired-mode dired-mode-map
    "h" #'dired-up-directory
    "l" #'dired-find-file))

(progn ;; insert current filename into minibuffer (e.g. for shell command)
  (define-key minibuffer-local-map
    [f3] (lambda () (interactive)
           (insert (buffer-file-name (current-buffer-not-mini)))))

  (defun current-buffer-not-mini ()
    "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
    (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
          (window-buffer (previous-window)) (window-buffer (next-window))))))

(progn ;; search navigation
 (define-key evil-normal-state-map (kbd "gf") #'helm-find-files)
 (define-key evil-normal-state-map (kbd "/") #'helm-swoop)
 (define-key evil-visual-state-map (kbd "/") #'helm-swoop))

(progn ;; Info-mode scrolling
  (define-key Info-mode-map (kbd "<up>") #'evil-scroll-line-up)
  (define-key Info-mode-map (kbd "<down>") #'evil-scroll-line-down)
  (define-key Info-mode-map (kbd "<left>") #'Info-backward-node)
  (define-key Info-mode-map (kbd "<right>") #'Info-forward-node))

(with-eval-after-load 'org
 (define-key org-mode-map (kbd "<up>") #'previous-line)
 (define-key org-mode-map (kbd "<down>") #'next-line)
 ;; (define-key org-mode-map (kbd "<") #'evil-shift-left)
 ;; (define-key org-mode-map (kbd ">") #'evil-shift-right)
 (define-key org-mode-map (kbd "<C-S-return>") #'amb/org-insert-subheading-respect-content)
 (spacemacs/set-leader-keys-for-major-mode 'org-mode
   "hs" #'amb/org-insert-subheading-respect-content
   "hi" #'org-insert-heading-after-current
   "p" #'amb/html2org-clipboard))

;; TODO: if on a mac and GUI, bind `(kbd "s-_")` (i.e. alt-shift-dash, the standard OS-level em-dash binding) to self-insert em-dash
)
;; * automatically-inserted shit
dotspacemacs-configuration-layers
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(delete-by-moving-to-trash nil)
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#eee8d5")
 '(fill-column 100)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-html-doctype "html5")
 '(package-selected-packages
   (quote
    (helm-navi ac-html-angular angular-mode outshine clj-refactor edn clojure-snippets paredit peg cider-eval-sexp-fu cider queue clojure-mode ob-typescript org-category-capture ox-tufte discover cargo toml-mode racer flycheck-rust seq rust-mode racket-mode faceup groovy-mode typit mmt sudoku pacmacs 2048-game yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic graphviz-dot-mode fireplace magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht ranger ob-sml sml-mode origami spotify helm-spotify multi powerline rake inflections pcre2el spinner osc log4e gntp skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors hydra parent-mode projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flx iedit anzu goto-chg undo-tree highlight f diminish autothemer web-completion-data dash-functional tern bind-map bind-key packed elixir-mode pkg-info epl avy auto-complete popup geiser csv-mode typescript-mode sbt-mode scala-mode inf-ruby company smartparens evil flycheck helm helm-core markdown-mode alert org-plus-contrib magit magit-popup git-commit with-editor async yasnippet php-mode js2-mode dash s define-word zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme sonic-pi solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-tree-slide org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir noflet noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flycheck-mix flycheck-credo flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-replace-with-register evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme company-web company-tern company-statistics company-shell column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values
   (quote
    ((projectile-tags-file-name . "~/workspace/ngts/.git/ETAGS")
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(typescript-indent-level 2)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(delete-by-moving-to-trash nil)
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#eee8d5")
 '(fill-column 100)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-html-doctype "html5")
 '(package-selected-packages
   (quote
    (command-log-mode sicp lsp-scala lsp-ui lsp-treemacs lv lsp-java helm-lsp company-lsp lsp-mode helm-navi ac-html-angular angular-mode outshine clj-refactor edn clojure-snippets paredit peg cider-eval-sexp-fu cider queue clojure-mode ob-typescript org-category-capture ox-tufte discover cargo toml-mode racer flycheck-rust seq rust-mode racket-mode faceup groovy-mode typit mmt sudoku pacmacs 2048-game yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic graphviz-dot-mode fireplace magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht ranger ob-sml sml-mode origami spotify helm-spotify multi powerline rake inflections pcre2el spinner osc log4e gntp skewer-mode simple-httpd json-snatcher json-reformat multiple-cursors hydra parent-mode projectile request haml-mode gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flx iedit anzu goto-chg undo-tree highlight f diminish autothemer web-completion-data dash-functional tern bind-map bind-key packed elixir-mode pkg-info epl avy auto-complete popup geiser csv-mode typescript-mode sbt-mode scala-mode inf-ruby company smartparens evil flycheck helm helm-core markdown-mode alert org-plus-contrib magit magit-popup git-commit with-editor async yasnippet php-mode js2-mode dash s define-word zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme sonic-pi solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-tree-slide org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir noflet noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flycheck-mix flycheck-credo flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-replace-with-register evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme company-web company-tern company-statistics company-shell column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(safe-local-variable-values
   (quote
    ((eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.html" . web-mode)))
     (flycheck-typescript-tslint-executable . "~/workspace/react-mono/node_modules/.bin/tslint")
     (eval progn
           (require
            (quote nvm))
           (nvm-use
            (with-temp-buffer
              (insert-file-contents "~/workspace/ngts/.nvmrc")
              (s-chomp
               (buffer-string))))
           (add-to-list
            (quote auto-mode-alist)
            (quote
             ("\\.html" . web-mode))))
     (projectile-tags-file-name . "~/workspace/ngts/.git/ETAGS")
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(typescript-indent-level 2)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
