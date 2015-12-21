;; From https://github.com/purcell/emacs.d/blob/aa789c9745b13612c4fea6e638d81d8ebbfecdf8/init-utils.el#L1-L5

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; WE DON'T NEED NO SPLASH SCREEN LET THE MOTHER *ee-ur* BURN
;; s/t/0 to re-enable
(setq inhibit-splash-screen t)
(tool-bar-mode -1)

(transient-mark-mode 1)

;;;;org-mode configuration
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-src-fontify-natively 1)
(setq org-todo-keyword-faces
		'(("TODO" . org-warning)
		  ("STARTED" . "#cccc00")
		  ("DONE" . "#009933")))
(setq org-hide-leading-stars 1)
; In documentation this is how to prevent splitting lines with M-RET; C-S-RET is a better bet generally for me, but still. But it don't work.
;(setq org-M-RET-may-split-line 0)
;; Set to the location of your Org files on your local system
(setq org-directory "~/org-mode")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org-mode/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory "~/.emacs.d/"
    "Directory beneath which additional per-user Emacs-specific
files are placed.
  Various programs in Emacs store information in this directory.
  Note that this should end with a directory separator.
  See also `locate-user-emacs-file'."))

(add-to-list 'load-path (concat user-emacs-directory
  (convert-standard-filename "github/powerline")))

;; Make it look nice
(require 'powerline)
(powerline-evil-theme)
(load-theme 'railscasts t)

;; because numbers.
(require 'linum-relative)
(after-load 'linum-relative
  (setq linum-relative-current-symbol ""))
(global-linum-mode 1)

(helm-mode t)
;;TODO: set up yasnippet, iedit, flycheck, projectile, magit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                EVIL                ;
(require 'key-chord)
(key-chord-mode 1)
(require 'evil-leader)
(global-evil-leader-mode 1)
(require 'evil-surround)
(global-evil-surround-mode 1)
;(require 'evil-numbers)
(require 'evil)
(evil-mode t)
(evil-set-initial-state 'snake-mode 'emacs)
(evil-set-initial-state 'pong-mode 'emacs)
(evil-set-initial-state 'tetris-mode 'emacs)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;             MAPPINGS             ;
(define-key evil-motion-state-map ";" 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char)

(defun evil-normal-state-and-forward-char (interactive)
  ((evil-normal-state)
  (evil-forward-char)))
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state-and-forward-char)
(key-chord-define evil-insert-state-map "kj" 'evil-normal-state-and-forward-char)
(key-chord-define evil-insert-state-map "jf" 'evil-normal-state)
(key-chord-define evil-insert-state-map "fj" 'evil-normal-state)

(key-chord-define evil-insert-state-map "kk" 'evil-append-line)

(key-chord-define evil-insert-state-map "jj" 'evil-open-below)
(key-chord-define evil-insert-state-map "uu" 'evil-open-above)

	 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	 ;     TAKE ME TO YOUR LEADER     ;
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "w" 'evil-write
 "n" 'make-frame
 "f" 'evil-first-non-blank
 "lb" 'evil-buffer
 "af" 'auto-fill-mode
 "sw" 'whitespace-cleanup
 "org" 'org-mode
 )
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ensure-package-installed (&rest packages)
    "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
    (mapcar
     (lambda (package)
       (if (package-installed-p package)
	   nil
	 (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	     (package-install package)
	   package)))
     packages))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	(quote
	 ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(evil-ex-substitute-global t)
 '(evil-shift-width 2)
 '(evil-want-fine-undo t)
 '(make-backup-files nil)
 '(show-trailing-whitespace t)
 '(tab-width 3 nil nil "8 is huge, tho")
 '(track-eol t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(color-theme-approximate-on)

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'evil
								  'iedit
								  'helm
								  'flycheck
								  'projectile
								  'yasnippet
								  'magit)

;; open in org-mode
(switch-to-buffer (get-buffer-create (generate-new-buffer-name "*scratch-org*")))
(insert "Scratch buffer with org-mode.\n\n")
(org-mode)
