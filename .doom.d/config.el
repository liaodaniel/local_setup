;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq projectile-file-exists-remote-cache-expire nil)

;; Expand terminal size
(setq term-window-width 80)

;; Search chars across windows
(setq avy-all-windows 'all-frames)

;; Reload existing files changed outside of emacs
(global-auto-revert-mode t)

;; Set default theme
(setq doom-theme 'gotham)

;; Cats
(use-package nyan-mode
   :custom
   (nyan-animate-nyancat t)
   :hook
   (doom-modeline-mode . nyan-mode))

(map!
  :leader
  "j" nil
  (:desc "Go To Char All Windows" "j" #'evil-avy-goto-char-timer))

