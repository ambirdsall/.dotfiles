;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(add-to-list 'load-path "/Users/ambirdsall/.emacs.d/lisp/")

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     csv
     vimscript
     auto-completion
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar t)
     elixir
     emacs-lisp
     git
     helm
     html
     javascript
     markdown
     (org :variables
          org-enable-bootstrap-support t
          org-enable-github-support t
          org-enable-reveal-js-support t)
     osx
     php
     ruby
     ruby-on-rails
     scala
     scheme
     (shell :variables
            shell-default-height 30
            shell-default-position 'fullscreen
            shell-default-shell 'eshell)
     shell-scripts
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     themes-megapack
     tmux
     typescript
     version-control
     vimscript
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(org-tree-slide
                                      evil-replace-with-register
                                      editorconfig
                                      osc
                                      sonic-pi
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         material-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
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
   dotspacemacs-distinguish-gui-tab nil
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
   dotspacemacs-default-layout-name "Everything"
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
   dotspacemacs-helm-no-header nil
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
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
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
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; LET'S JUST GET SOME THINGS STRAIGHT AROUND HERE
  ;;
  ;; TOC:
  ;; 1) Text editing conceptual UI: keybindings, text objects, commands, etc
  ;; 2) Visual application UI: modeline, file browser settings, etc
  ;; 3) Conceptual UI setup/config: tags, syntax checking, etc
  ;; 4) File settings: indents, etc
  ;; 5) One-off commands


  ;; 1) Text editing conceptual UI: keybindings, text objects, etc

  ;;;;;;;;;;;;;;;;
  ;; KEYBINDINGS
  (defun evil-open-above-without-leaving-normal-state (count)
    "Insert a new line above the current line and move the cursor to the new line without changing editing state."
    (interactive "p")
    (evil-open-above count)
    (normal-mode))

  (defun evil-open-below-without-leaving-normal-state (count)
    "Insert a new line below the current line and move the cursor to the new line without changing editing state."
    (interactive "p")
    (evil-open-below count)
    (normal-mode))

  (defun switch-to-named-terminal-buffer (buffer-name)
    "Open a new terminal buffer with the given name.

If the buffer already exists, it is opened; if not, a new ansi-term buffer is
opened with the given name. Compared to the default terminal buffer, this is
much more useful for long-running processes."
    (interactive "BName of buffer: ")
    (let ((given-buffer (get-buffer buffer-name))
             (term-command "/usr/local/bin/zsh"))
      (if given-buffer (switch-to-buffer given-buffer)
       (set-buffer (ansi-term term-command buffer-name)))))

  (defun amb/open-agenda-file ()
    "Opens the file ~/notes/agenda.org"
    (interactive)
    (find-file "~/notes/agenda.org"))

  (defun define-new-op-command (command)
    "Installs the given command under the `<SPC>op` keybinding.

For convenience, this keybinding (picked because there's no obvious mnemonic and
it's extremely ergonomic to type) is reserved for ad-hoc or temporary commands."
    (interactive "aFunction: ")
    (spacemacs/set-leader-keys "op" command))

  (spacemacs/set-leader-keys
    ; the keybinding for `<spc>op` is reserved for whatever nonsense I'm into at the moment
    ; lowercase p => call this moment's function
    ; uppercase P => install a new function
    "oP" 'define-new-op-command
    ; the rest can be considered stable
    "oa" 'amb/open-agenda-file
    "oe" 'eval-expression
    "of" 'evil-first-non-blank
    "oh" (kbd ":noh") ; tbh I have no idea why I can't directly bind to 'evil-ex-nohighlight
    "ol" 'evil-buffer
    "oo" 'evil-open-below-without-leaving-normal-state
    "oO" 'evil-open-above-without-leaving-normal-state
    "ot" 'switch-to-named-terminal-buffer
    "ow" 'delete-trailing-whitespace
    "jj" 'evil-avy-goto-char-2
    "jJ" 'evil-avy-goto-char)

  ; TODO: IF the value of variable `last-command` was an org-mode subtree
  ; manipulation command; AND the current major mode is org-mode; THEN up and
  ; down arrows should change lines, rather than scrolling
  (with-eval-after-load 'org-mode
    (define-key org-mode-map (kbd "<up>") 'previous-line)
    (define-key org-mode-map (kbd "<down>") 'next-line)
    )
  (define-key Info-mode-map (kbd "<up>") 'evil-scroll-line-up)
  (define-key Info-mode-map (kbd "<down>") 'evil-scroll-line-down)
  (define-key Info-mode-map (kbd "<left>") 'Info-backward-node)
  (define-key Info-mode-map (kbd "<right>") 'Info-forward-node)
  (define-key evil-normal-state-map (kbd "gf") 'helm-find-files)

  ;;;;;;;;;;;;;;;;;;;;;;
  ;; CUSTOM TEXT OBJECTS
  (defmacro define-and-bind-text-object (key start-regex end-regex)
    (let ((inner-name (make-symbol "inner-name"))
          (outer-name (make-symbol "outer-name")))
      `(progn
         (evil-define-text-object ,inner-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count nil))
         (evil-define-text-object ,outer-name (count &optional beg end type)
           (evil-select-paren ,start-regex ,end-regex beg end type count t))
         (define-key evil-inner-text-objects-map ,key (quote ,inner-name))
         (define-key evil-outer-text-objects-map ,key (quote ,outer-name)))))

  ;; create "il"/"al" (inside/around) line text objects:
  (define-and-bind-text-object "l" "^\\s-*" "\\s-*$")
  ;; create "ie"/"ae" (inside/around) entire buffer text objects:
  (define-and-bind-text-object "e" "\\`\\s-*" "\\s-*\\'")

  ;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Replace with register
  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install)

  ;; 2) Visual application UI: modeline, file browser settings, etc

  ;;;;;;;;;;;;;;
  ;; FILE TREE
  (setq neo-theme 'nerd)

  ;;;;;;;;;;;;;
  ;; ORG-MODE
  (setq org-src-fontify-natively t
        org-confirm-babel-evaluate nil
        ; TODO install local copy of reveal.js to allow presenter mode
        org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")

  ; Add projectile TODO.org files to agenda automatically
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (append (org-projectile:todo-files) org-agenda-files)
    (push "~/notes/agenda.org" org-agenda-files)
    (push "~/notes/ical-entries.org" org-agenda-files))

  ;; ORG TABLES IN MARKDOWN FILES PLZ
  ;; (require 'org-table)

  ;; (defun amb/convert-org-tables-to-gfm-tables ()
  ;;   (save-excursion
  ;;     (goto-char (point-min))
  ;;     (while (search-forward "-+-" nil t) (replace-match "-|-"))
  ;;     ))

  ;; (add-hook 'markdown-mode-hook 'orgtbl-mode)
  ;; (add-hook 'markdown-mode-hook
  ;;           (lambda()
  ;;             (add-hook 'after-save-hook 'amb/convert-org-tables-to-gfm-tables  nil 'make-it-local)))

  ;;;;;;;;;;;;;
  ;; MODELINE
  (spacemacs/toggle-mode-line-battery-on)
  ;; (setq powerline-default-separator 'utf-8)

  ;; RAINBOW-MODE
  ;; (setq old-rainbow-html-colors-major-mode-list rainbow-html-colors-major-mode-list)
  (with-eval-after-load 'rainbow-mode
    (setq rainbow-html-colors-major-mode-list (cons 'scss-mode rainbow-html-colors-major-mode-list)))

  ;; GOOGLE MAPS
  (require 'google-maps)
  (require 'org-location-google-maps)

  ;; 3) Conceptual UI setup/config: tags, syntax checking, etc

  ;;;;;;;;;;;;;
  ;; FLYCHECK
  (with-eval-after-load 'flycheck
    (setq flycheck-checkers '(javascript-standard)
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-strict-missing-semi-warning nil))

  (require 'flycheck)
  ;; turn on flychecking globally
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; disable jshint: I prefer standard, and use eslint in RIO
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))

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


  ;; 4) File settings: indents, etc

  ;;;;;;;;;;;;
  ;; INDENTS
  (setq-default web-mode-code-indent-offset 2
                web-mode-markup-indent-offset 2
                js-indent-level 2
                typescript-indent-level 2
                js2-basic-offset 2
                standard-indent 2)

  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

  ;; 5) One-off commands
  (call-interactively 'spacemacs/toggle-fullscreen-frame-off)
  )

dotspacemacs-configuration-layers
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (geiser csv-mode typescript-mode sbt-mode scala-mode inf-ruby company smartparens evil flycheck helm helm-core markdown-mode alert org-plus-contrib magit magit-popup git-commit with-editor async yasnippet php-mode js2-mode dash s define-word zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme sonic-pi solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme purple-haze-theme pug-mode projectile-rails professional-theme popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-tree-slide org-projectile org-present org-pomodoro org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir noflet noctilux-theme niflheim-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme insert-shebang inkpot-theme info+ indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flycheck-mix flycheck-credo flx-ido flatui-theme flatland-theme fish-mode firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-replace-with-register evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help ensime emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme django-theme diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme company-web company-tern company-statistics company-shell column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode chruby cherry-blossom-theme busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
