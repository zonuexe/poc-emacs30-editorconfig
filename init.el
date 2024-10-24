;;; init.el --- Config file for PoC of Editorconfig indentation issues  -*- lexical-binding: t; -*-

;;; Code:
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name))
  (setq package-user-dir (locate-user-emacs-file "elpa")))

(package-initialize)
(unless (require 'editorconfig nil t) (package-install 'editorconfig))
(unless (require 'php-mode nil t) (package-install 'php-mode))

(debug-on-variable-change 'tab-width)

;; Disable treesit
(advice-add #'treesit-available-p :override (lambda () nil))

(editorconfig-mode)
;;; init.el ends here
