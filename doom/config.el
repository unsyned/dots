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
