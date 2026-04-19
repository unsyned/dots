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


(map! :leader
      :desc "Insert empty line below cursor" "l" #'my/evil-add-space-below)
(map! :leader
      :desc "Insert empty line above cursor" "L" #'my/evil-add-space-above)

;; center line when browsing search results
(advice-add #'evil-ex-search-next :after #'doom-recenter-a)
(advice-add #'evil-ex-search-previous :after #'doom-recenter-a)
