;新たに開いたwindowのバッファの行数によって、windowのサイズを
;調節するcontrol-split-windowをつくりました。
;ただ、複数windowを開いていると、処理が複雑になってしまい
;力尽きてしまいましたので、二つ以上のwindowを開いているときには動きません
; xyzzyの使い方がわからぬやし 励ましあえ その4で、ななしさんが
; 書いてくれたmy-split-windowを参考にしました。

(defun control-split-window ()
  (interactive)
  (if
      (= 1 (count-windows nil))
      (progn
	(let
	    ((resize) (current-window-lines (ceiling (/ (window-lines) 2))))
	(switch-to-buffer-other-window (other-buffer))
	(setq resize (- current-window-lines (buffer-lines)));どれくらい小さくするか
	(if (> resize 0)
	    (enlarge-window (* -1  (- resize 1)))
	  )))
    (my-split-window)
    )
  )