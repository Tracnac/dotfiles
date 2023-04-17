;; "GNU Emacs T R /\ C N /\ C. Edition"

(setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(load custom-file)

(fset 'yes-or-no-p #'y-or-n-p)
(fset 'display-startup-echo-area-message #'ignore)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package org)
(use-package counsel)
(use-package smex)
(use-package magit)
(use-package flycheck)
(use-package helpful)
(use-package eshell)
(use-package helm)
(use-package evil
             :config
             (evil-mode 1))
(use-package which-key
             :config
             (which-key-mode))

(use-package undo-fu
  :config
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (undo-fu-session-global-mode))

(use-package smartparens
  :config
    (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package rainbow-delimiters
  :config
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package savehist
  :config
  (setq savehist-additional-variables
        '(kill-ring
          command-history
          set-variable-value-history
          custom-variable-history   
          query-replace-history     
          read-expression-history   
          minibuffer-history        
          read-char-history         
          face-name-history         
          bookmark-history
          file-name-history
	  counsel-M-x-history
	  counsel-minibuffer-history))
  (put 'minibuffer-history         'history-length 50)
  (put 'file-name-history          'history-length 50)
  (put 'set-variable-value-history 'history-length 25)
  (put 'custom-variable-history    'history-length 25)
  (put 'query-replace-history      'history-length 25)
  (put 'read-expression-history    'history-length 25)
  (put 'read-char-history          'history-length 25)
  (put 'face-name-history          'history-length 25)
  (put 'bookmark-history           'history-length 25)
  (put 'counsel-M-x-history        'history-length 25)
  (put 'counsel-minibuffer-history 'history-length 25)
  (let (message-log-max)
    (savehist-mode)))

(use-package nano-theme
  :straight (nano-theme :type git :host github :repo "rougier/nano-emacs")
  :init
      (require 'nano-base-colors)
      (require 'nano-faces)
  :config
      (require 'nano-faces)
      (require 'nano-theme)
      (require 'nano-theme-dark)
      (require 'nano-theme-light)
      (require 'nano-modeline)
      (require 'nano-counsel)
      (nano-faces)
      (nano-theme))

(defun unpropertize-kill-ring ()
  (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
(add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

(setq initial-scratch-message
      (format "Welcome to GNU Emacs T R /\\ C N /\\ C. Edition\nInitialization time: %s\n\n"
              (emacs-init-time)))
