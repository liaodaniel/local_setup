;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Search chars across windows
(setq avy-all-windows 'all-frames)

;; Set to use nerd hack font
(setq doom-font (font-spec :family "Hack Nerd Font" :size 12))

;; Reload existing files changed outside of emacs
(global-auto-revert-mode t)

;; Set default theme
(setq doom-theme 'doom-oceanic-next)

;; Cats
(use-package nyan-mode
   :custom
   (nyan-animate-nyancat t)
   :hook
   (doom-modeline-mode . nyan-mode))

;; Make vterm take the full length of the screen
(defun comint-fix-window-size ()
  "Change process window size."
  (when (derived-mode-p 'comint-mode)
    (set-process-window-size (get-buffer-process (current-buffer))
                         (window-height)
                         (window-width))))

(defun my-shell-mode-hook ()
  ;; add this hook as buffer local, so it runs once per window.
  (add-hook 'window-configuration-change-hook 'comint-fix-window-size nil t))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

;; Custom jump across the windows
(map!
  :leader
  "j" nil
  (:desc "Go To Chars Across Windows" "j" #'evil-avy-goto-char-timer))
