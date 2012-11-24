;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; パス
;;;

;; ロードパス
(setq load-path (cons "~/.emacs.d/" load-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; より下に記述した物が PATH の先頭に追加されます
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))

;; PATH と exec-path に同じ物を追加します
(when (and (file-exists-p dir) (not (member dir exec-path)))
  (setenv "PATH" (concat dir ":" (getenv "PATH")))
  (setq exec-path (append (list dir) exec-path))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; 拡張
;;;

;; auto-install.el
(add-to-list 'load-path "~/.emacs.d/auto-install")
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; Anything.el
(require 'anything-startup)

;; markdown-mode.el
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq markdown-command-needs-filename t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; 一般設定
;;;

;; コマンドキーをメタキーにする
(setq ns-command-modifier (quote meta))

;; C-hでカーソル位置の前の文字を削除する
(global-set-key "\C-h" 'delete-backward-char)

;; C-dでカーソル位置の文字を削除する
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

;; リターンを押した時にオートインデントさせる（前の行と同じインデント）
(global-set-key "\C-m" 'newline-and-indent)
(setq indent-line-function 'indent-relative-maybe)

;; バックアップファイルを別ディレクトリに保存
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup-list/"))
            backup-directory-alist))

;; .save.. というファイルを作らない
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)

;; 対応する括弧を強調表示
(show-paren-mode t)

;; リージョン内の文字を BS/DEL で消す
(delete-selection-mode 1)

;; 日本語フォントを設定する
(create-fontset-from-ascii-font "Menlo-11:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo" 'unicode (font-spec :family "Hiragino Kaku Gothic ProN" ) nil 'append)
(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))
(setq face-font-rescale-alist '((".*Hiragino.*" . 1.2) (".*Menlo.*" . 1.0)))
