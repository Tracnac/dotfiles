(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package nano-theme
  :ensure t
  :init
  (setq nano-font-family-monospaced "VictorMono NF")
  (setq nano-font-family-proportional "VictorMono NF")
  (setq nano-font-size 10)
  :config
  (load-theme 'nano-light t))

(use-package evil
  :ensure t
  :init
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-want-fine-undo t)
  (setq evil-normal-state-cursor '("DarkOrange" (hbar . 2)))
  :config
  (evil-mode t)
  )

(use-package undo-fu
  :ensure t
  :config
  (setq undo-fu-allow-undo-in-region t)
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z")   'undo-fu-only-undo)
  (global-set-key (kbd "C-S-z") 'undo-fu-only-redo))

(use-package undo-fu-session
  :ensure t
  :config
  (setq undo-fu-session-incompatible-files '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (undo-fu-session-global-mode t))

(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package savehist
  :config
  (setq kill-ring-max 50
        history-length 50)
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
          file-name-history))
  (put 'minibuffer-history         'history-length 50)
  (put 'file-name-history          'history-length 50)
  (put 'set-variable-value-history 'history-length 25)
  (put 'custom-variable-history    'history-length 25)
  (put 'query-replace-history      'history-length 25)
  (put 'read-expression-history    'history-length 25)
  (put 'read-char-history          'history-length 25)
  (put 'face-name-history          'history-length 25)
  (put 'bookmark-history           'history-length 25)
  (setq history-delete-duplicates t)
  (let (message-log-max)
    (savehist-mode)))

(use-package helm
  :ensure t
  :config
  (helm-mode t))

(use-package magit)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package use-package-chords
  :ensure t
  :config
  (key-chord-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(setq auto-save-list-file-prefix
      (expand-file-name "auto-save-list/.saves-" user-emacs-directory)
      auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)

;; (setq bookmark-default-file (expand-file-name "bookmark" user-emacs-directory))

(defun unpropertize-kill-ring ()
  "Custom."
  (setq kill-ring (mapcar 'substring-no-properties kill-ring)))
(add-hook 'kill-emacs-hook 'unpropertize-kill-ring)

;; (switch-to-buffer (get-buffer-create "empty"))

(setq initial-scratch-message
      (format ";; Welcome to GNU Emacs T R /\\ C N /\\ C. Edition\n;; Initialization time: %s\n\n"
              (emacs-init-time)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(cursor-type '(hbar . 2))
 '(custom-safe-themes t)
 '(find-file-visit-truename t)
 '(fringe-mode '(12 . 12) nil (fringe))
 '(indicate-buffer-boundaries nil)
 '(inhibit-buffer-choice t)
 '(inhibit-compacting-font-caches t t)
 '(inhibit-startup-echo-area-message '(user-login-name))
 '(inhibit-startup-screen t)
 '(iso-transl-char-map nil t)
 '(make-pointer-invisible t)
 '(mouse-wheel-inhibit-click-time 0)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount '(1 ((shift) . 1) ((meta)) ((control) . text-scale)))
 '(mouse-yank-at-point t)
 '(org-babel-load-languages '((shell . t) (emacs-lisp . t) (python . t)))
 '(org-log-done 'time)
 '(org-log-done-with-time t)
 '(package-selected-packages
   '(nano-modeline use-package-chords flycheck undo-fu-session which-key use-package undo-fu nano-theme evil smartparens rainbow-delimiters))
 '(prefer-coding-system 'utf-8)
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(select-enable-clipboard t)
 '(set-default-coding-systems 'utf-8)
 '(set-keyboard-coding-system 'utf-8)
 '(set-language-environment "English")
 '(set-terminal-coding-system 'utf-8)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(undo-limit 67108864)
 '(undo-outer-limit 1073741824)
 '(undo-strong-limit 134217728)
 '(user-full-name "Tracnac")
 '(user-mail-address "tracnac@devmobs.fr")
 '(visible-bell nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "VictorMono NF" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))
