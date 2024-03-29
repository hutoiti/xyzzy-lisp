(setq var-vi nil)
(defun vi()
  (interactive)
  (if var-vi ;���߂�true������Ƃ�
      (progn
	(undefine-key *global-keymap* #\h )
	(undefine-key *global-keymap* #\j )
	(undefine-key *global-keymap* #\l )
	(undefine-key *global-keymap* #\k )
	(undefine-key *global-keymap* #\g )
	(undefine-key *global-keymap* #\G )
	(undefine-key *global-keymap* #\Q )
	(undefine-key *global-keymap* #\i )
	(undefine-key *global-keymap* #\C-g )
	(dolist (key '(    #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0 #\- #\=
		       #\~ #\! #\@ #\# #\$     #\^ #\& #\*         #\_ #\+
		       #\\     #\. #\/
		       #\|         #\?
		       #\a #\b #\c #\d #\e #\f #\g     #\i             #\m
		       #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z
		       ))
	  (undefine-key *global-keymap* key))
	(global-set-key  #\h 'self-insert-command)
	(global-set-key  #\j 'self-insert-command)
	(global-set-key  #\l 'self-insert-command)
	(global-set-key  #\k 'self-insert-command)
	(global-set-key  #\Q 'self-insert-command)
	(global-set-key  #\i 'self-insert-command)
	(global-set-key  #\C-g 'quit)
	(dolist (key '(    #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0 #\- #\=
		       #\~ #\! #\@ #\# #\$     #\^ #\& #\*         #\_ #\+
		       #\\     #\. #\/
		       #\|         #\?
		       #\a #\b #\c #\d #\e #\f #\g     #\i             #\m
		       #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z
		       ))
	  (global-set-key key 'self-insert-command))
	
	(setq mode-line-format "--%*- %b %/%% (%M) [%k:%l]  %f")
	(set-local-window-flags (selected-window)*window-flag-mode-line*  t)
	(setq var-vi nil)
	(set-local-window-flags (selected-window)
				*window-flag-vscroll-bar* nil)
	(setq *blink-caret* nil)
	(set-local-window-flags (selected-window)
				*window-flag-line-number* t)
	(dolist (x (buffer-list)) (set-buffer-colors #(#x00FF00 #x000000) x))
	)
    (progn
      (toggle-ime nil)
      (undefine-key *global-keymap* #\h )
      (undefine-key *global-keymap* #\+ )
      (undefine-key *global-keymap* #\- )
      (undefine-key *global-keymap* #\j )
      (undefine-key *global-keymap* #\l )
      (undefine-key *global-keymap* #\k )
      (undefine-key *global-keymap* #\g )
      (undefine-key *global-keymap* #\G )
      (undefine-key *global-keymap* #\Q )
      (undefine-key *global-keymap* #\i )
      (undefine-key *global-keymap* #\C-g )
      (dolist (key '(    #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0 #\=
		     #\~ #\! #\@ #\# #\$     #\^ #\& #\*         #\_ 		     #\\     #\. #\/
		     #\|         #\?
		     #\a #\b #\c #\d #\e #\f #\g     #\i             #\m
		     #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z
		     ))
	(undefine-key *global-keymap* key))
      (global-set-key  #\h 'previous-buffer)
      (global-set-key  #\j 'walk-down)
      (global-set-key  #\l #'(lambda() (interactive) (if (> (count-windows) 1) (other-window) (next-buffer))))
      (global-set-key  #\k 'walk-up)
      (global-set-key  #\Q #'(lambda()(interactive) (delete-buffer (selected-buffer))))
      (global-set-key #\+ 'increase-text-font-size)
      (global-set-key #\- 'decrease-text-font-size)
      (global-set-key  #\C-g #'(lambda()(interactive) (progn (vi)(quit))))
      (dolist (key '(    #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9 #\0 #\=
		     #\~ #\! #\@ #\# #\$     #\^ #\& #\*         #\_
		     #\\     #\. #\/
		     #\|         #\?
		     #\a #\b #\c #\d #\e #\f #\g     #\i             #\m
		     #\n #\o #\p #\q #\r #\s #\t #\u #\v #\w #\x #\y #\z
		     ))
	(global-set-key key #'(lambda()
				(interactive)
				(progn
				  (vi)
				  (self-insert-command)
				  ))))
      (setq mode-line-format "vi vi vi vi vi --%*- %b %/%% (%M) [%k:%l]  %f")
      (set-local-window-flags (selected-window)*window-flag-mode-line*  t)
      (show-tool-bar 'buffer-bar :top)(setf *buffer-bar-p* t)
      (delete-other-windows)
      (setq var-vi t)
      (set-local-window-flags (selected-window)
			      *window-flag-vscroll-bar* t)
      (setq *blink-caret* t)
      (set-local-window-flags (selected-window)
			      *window-flag-line-number* nil)
      (dolist (x (buffer-list)) (set-buffer-colors #(#xFFFFFF #x280a0a #x515100 #xc0c0c0 #xff0000 #xffff00 #xff00ff #xff #xff8000 #x2fffff #xffff00 #x280a0a) x))
      )
    ))
(undefine-key *global-keymap* '(#\C-c #\C-c))
(global-set-key '(#\C-c #\c) 'vi)
(global-set-key '(#\C-c #\C-c) 'vi)
