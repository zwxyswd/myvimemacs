(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(scroll-bar-mode (quote right)))

;; 字体设置
(set-default-font "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1")
(add-to-list 'default-frame-alist '(font . "-unknown-文泉驿等宽微米黑-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1"))

;;LOAD_PATH
(add-to-list 'load-path' "~/.emacs.d/site-lisp")

(require 'color-theme)
;(color-theme-initialize)
(load-file "~/.emacs.d/site-lisp/color-theme-darkmate.el")
(color-theme-darkmate)

;;鼠标靠近时自动离开   
(mouse-avoidance-mode 'animate)   

;;LANGUAGE
(set-language-environment 'Chinese-GB)  
(set-keyboard-coding-system 'utf-8)  
(set-clipboard-coding-system 'utf-8)  
(set-terminal-coding-system 'utf-8)  
(set-buffer-file-coding-system 'utf-8)  
(set-default-coding-systems 'utf-8)  
(set-selection-coding-system 'utf-8)  
(modify-coding-system-alist 'process "*" 'utf-8)  
(setq default-process-coding-system '(utf-8 . utf-8))  
(setq-default pathname-coding-system 'utf-8)  
(set-file-name-coding-system 'utf-8)  
(setq ansi-color-for-comint-mode t) ;;处理shell-mode乱码,好像没作用 

;(menu-bar-mode -1);; 不显示emcas的菜单栏,按ctrl+鼠标右键仍能调出该菜单
(tool-bar-mode -1);; 不显示emcas的工具栏

;;设置打开文文件的缺省路径
(setq default-directory "~/source")

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

;;关闭烦人的出错提示音
(setq visible-bell t)

;;关闭emacs启动画面
(setq inhibit-startup-message t)

;;标题栏
(setq frame-title-format "%f---%b@emacs")

;;关闭gnus启动时的画面
(setq gnus-inhibit-startup-message t)

;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
(fset 'yes-or-no-p 'y-or-n-p)

;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())

(setq auto-save-default nil)    ;不生成 #filename# 文件 

;; 括号匹配
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;tabbar
(require 'tabbar)
(tabbar-mode)

;;linum
(require 'linum)
(global-linum-mode t)

;;auto-complete
(add-to-list 'load-path' "~/.emacs.d/site-lisp/auto-complete-1.3")
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(require 'python-mode)
(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))

(setq interpreter-mode-alist (cons '("python" . python-mode) interpreter-mode-alist))

(autoload 'python-mode "python-mode" "Python editing mode." t)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)


;; move window (Shift + cursor)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;;YASnipped
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.6.1c/snippets")

;;cmake-mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))
