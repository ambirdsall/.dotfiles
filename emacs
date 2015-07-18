;; From https://github.com/purcell/emacs.d/blob/aa789c9745b13612c4fea6e638d81d8ebbfecdf8/init-utils.el#L1-L5

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; WE DON'T NEED NO SPLASH SCREEN LET THE MOTHER *ee-ur* BURN
;; s/t/0 to re-enable
(setq inhibit-splash-screen t)

(transient-mark-mode 1)

;;;;org-mode configuration
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(load-theme 'railscasts t)
;;(load-theme 'solarized t)

;; because numbers.
(require 'linum-relative)
(after-load 'linum-relative
  (setq linum-relative-current-symbol ""))
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                EVIL                ;
(require 'evil-leader)
(require 'evil-surround)
(require 'evil)
(global-evil-leader-mode 1)
(global-evil-surround-mode 1)
(evil-mode t)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;     TAKE ME TO YOUR LEADER       ;
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
 "w" 'write
 )
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

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Custom Evil Mode keymaps
(define-key evil-normal-state-map ";" 'evil-ex)
(define-key evil-normal-state-map ":" 'evil-repeat-find-char)

(ensure-package-installed 'evil
								  'iedit
								  'helm
								  'flycheck
								  'projectile
								  'yasnippet
								  'magit)
