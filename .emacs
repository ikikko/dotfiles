;; ロードパス
(setq load-path (cons "~/.emacs.d/" load-path))
(add-to-list 'load-path "~/.emacs.d/site-lisp")

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
;; Anything中で使用する変数を定義
(setq split-width-threshold 160)

;; rst.el
; (auto-install-from-url
;   "http://docutils.sourceforge.net/tools/editors/emacs/rst.el")
(autoload 'rst-mode
  "rst.el" "Mode for viewing and editing reStructuredText-documents." t)
(setq auto-mode-alist
      (append '(("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; 一般設定
;;;

;; Optionをメタキーとして扱う
(setq mac-option-modifier 'meta)

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

;; 選択範囲を明示する
(setq transient-mark-mode t)

;; リージョン内の文字を BS/DEL で消す
(delete-selection-mode 1)
