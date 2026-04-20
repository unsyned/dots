;;; -*- lexical-binding: t -*-
(defun my/evil-add-space-below ()
  "Add empty line below cursor"
  (interactive)
  (save-excursion
    (end-of-line)
    (newline-and-indent)))

(defun my/evil-add-space-above ()
  "Add empty line above cursor"
  (interactive)
  (save-excursion
    (beginning-of-line)
    (open-line 1)))

(defun my/move-line-up ()
  "Move current line up by one"
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun my/move-line-down ()
  "Move current line down by one"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;;; KEYMAP ;;;
(map! :leader
      :desc "Insert empty line below cursor" "l" #'my/evil-add-space-below)
(map! :leader
      :desc "Insert empty line above cursor" "L" #'my/evil-add-space-above)
(map! :n "M-<up>"   #'my/move-line-up
      :n "M-<down>" #'my/move-line-down
      :v "M-<up>"   #'my/move-line-up
      :v "M-<down>" #'my/move-line-down)

;; center line when browsing search results
(advice-add #'evil-ex-search-next :after #'doom-recenter-a)
(advice-add #'evil-ex-search-previous :after #'doom-recenter-a)

;;; OPTIONS ;;;
; set hybrid line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; (setq doom-theme 'doom-tokyo-night)
(setq doom-theme 'doom-one)
(setq fancy-splash-image (concat doom-user-dir "emacs.png"))

;; org mode
(defun my/org-setup ()
  (olivetti-mode))

(with-eval-after-load 'org (global-org-modern-mode))
; (after! 'org (global-org-modern-mode))

(add-hook 'org-mode-hook #'my/org-setup)

;; agenda
(setq org-agenda-files '("~/Agenda"))

(defun my/agenda-setup ()
  (olivetti-mode)
  (org-super-agenda-mode))

(add-hook 'org-agenda-mode-hook 'my/agenda-setup)

(after! org
    (setq org-modern-star '(("◉" "○" "◈" "◇" "󰫢" "●" "◆"))
          org-modern-checkbox '((?X . "󰄲")
                                (?x . "󰄲")
                                (?- . "󰍵")
                                (?! . "󰀧")
                                (?  . "󰄱"))
          org-modern-list '((?- . "–")
                            (?* . "●")
                            (?+ . "○")))
    (dolist (face '((org-level-1 . 1.35)
                    (org-level-2 . 1.3)
                    (org-level-3 . 1.2)
                    (org-level-4 . 1.1)
                    (org-level-5 . 1.1)
                    (org-level-6 . 1.1)
                    (org-level-7 . 1.1)
                    (org-level-8 . 1.1)))
      (set-face-attribute (car face) nil :height (cdr face)))
    (set-face-attribute 'org-document-title nil :weight 'bold :height 1.8)
    (setq org-src-fontify-natively t
	  org-src-tab-acts-natively t
          org-src-content-indentation 0)
    (setq org-startup-indented nil))
