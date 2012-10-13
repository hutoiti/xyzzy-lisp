;�V���ɊJ����window�̃o�b�t�@�̍s���ɂ���āAwindow�̃T�C�Y��
;���߂���control-split-window������܂����B
;�����A����window���J���Ă���ƁA���������G�ɂȂ��Ă��܂�
;�͐s���Ă��܂��܂����̂ŁA��ȏ��window���J���Ă���Ƃ��ɂ͓����܂���
; xyzzy�̎g�������킩��ʂ₵ ��܂����� ����4�ŁA�ȂȂ�����
; �����Ă��ꂽmy-split-window���Q�l�ɂ��܂����B

(defun control-split-window ()
  (interactive)
  (if
      (= 1 (count-windows nil))
      (progn
	(let
	    ((resize) (current-window-lines (ceiling (/ (window-lines) 2))))
	(switch-to-buffer-other-window (other-buffer))
	(setq resize (- current-window-lines (buffer-lines)));�ǂꂭ�炢���������邩
	(if (> resize 0)
	    (enlarge-window (* -1  (- resize 1)))
	  )))
    (my-split-window)
    )
  )