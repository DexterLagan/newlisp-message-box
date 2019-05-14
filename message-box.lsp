;; @module message-box.lsp
;; @description Definitions and a function to display message boxes on Windows
;; @version 1.0 - comments redone for automatic documentation
;; @author Dexter Santucci 2018
;; <h3>Definitions and a function to display message boxes on Windows</h3>
;; This module is platform-specific (Windows)
;; 
;; Before using the module it must be loaded:
;; <pre>
;; (load "C:\Program Files (x86)/newlisp/modules/message-box.lsp")
;; ; or shorter
;; (module "message-box.lsp")
;; </pre>

(context 'win-message-box)

;;; imports

(import "user32.dll" "MessageBoxA")

;;; defs

; message box types
(constant 'MB_ABORTRETRYIGNORE  	  0x00000002) ; The message box contains three push buttons: Abort, Retry, and Ignore.
(constant 'MB_CANCELTRYCONTINUE 	  0x00000006) ; The message box contains three push buttons: Cancel, Try Again, Continue. Use this message box type instead of MB_ABORTRETRYIGNORE. 
(constant 'MB_HELP              	  0x00004000) ; Adds a Help button to the message box. When the user clicks the Help button or presses F1, the system sends a WM_HELP message to the owner. 
(constant 'MB_OK             	 	    0x00000000) ; The message box contains one push button: OK. This is the default. 
(constant 'MB_OKCANCEL 		 	        0x00000001) ; The message box contains two push buttons: OK and Cancel. 
(constant 'MB_RETRYCANCEL 	 	      0x00000005) ; The message box contains two push buttons: Retry and Cancel. 
(constant 'MB_YESNO 		 	          0x00000004) ; The message box contains two push buttons: Yes and No. 
(constant 'MB_YESNOCANCEL 	 	      0x00000003) ; The message box contains three push buttons: Yes, No, and Cancel. 

; message box icons
(constant 'MB_ICONEXCLAMATION 	    0x00000030) ; An exclamation-point icon appears in the message box.
(constant 'MB_ICONWARNING 	 	      0x00000030) ; An exclamation-point icon appears in the message box.  
(constant 'MB_ICONINFORMATION 	    0x00000040) ; An icon consisting of a lowercase letter i in a circle appears in the message box.  
(constant 'MB_ICONASTERISK 	 	      0x00000040) ; An icon consisting of a lowercase letter i in a circle appears in the message box. 
(constant 'MB_ICONQUESTION 	 	      0x00000020) ; A question-mark icon appears in the message box. 
(constant 'MB_ICONSTOP 		 	        0x00000010) ; A stop-sign icon appears in the message box.
(constant 'MB_ICONERROR 		        0x00000010) ; A stop-sign icon appears in the message box.
(constant 'MB_ICONHAND 		 	        0x00000010) ; A stop-sign icon appears in the message box. 

; message box default button specification
(constant 'MB_DEFBUTTON1 	 	        0x00000000) ; The first button is the default button. MB_DEFBUTTON1 is the default unless another is specified.
(constant 'MB_DEFBUTTON2 	 	        0x00000100) ; he second button is the default button.
(constant 'MB_DEFBUTTON3 	 	        0x00000200) ; The third button is the default button.
(constant 'MB_DEFBUTTON4 	 	        0x00000300) ; The fourth button is the default button.

; message box modality
(constant 'MB_APPLMODAL 		        0x00000000) ; The user must respond to the message box before continuing work in the window (hWnd parameter).
(constant 'MB_SYSTEMMODAL 	 	      0x00001000) ; Same as MB_APPLMODAL except that the message box has the WS_EX_TOPMOST style.
(constant 'MB_TASKMODAL 		        0x00002000) ; Same as MB_APPLMODAL except that all the top-level windows belonging to the current thread are disabled if the hWnd parameter is NULL.

; message box other options
(constant 'MB_DEFAULT_DESKTOP_ONLY 	0x00020000) ; If the current input desktop is not the default desktop, MessageBox does not return until the user switches to the default desktop.
(constant 'MB_RIGHT 			          0x00080000) ; The text is right-justified.
(constant 'MB_RTLREADING 		        0x00100000) ; Displays message and caption text using right-to-left reading order on Hebrew and Arabic systems.
(constant 'MB_SETFOREGROUND 		    0x00010000) ; The message box becomes the foreground window.
(constant 'MB_TOPMOST 			        0x00040000) ; The message box is created with the WS_EX_TOPMOST window style.
(constant 'MB_SERVICE_NOTIFICATION 	0x00200000) ; The caller is a service notifying the user of an event. If this flag is set, the hWnd parameter must be NULL.

; message box return values
(constant 'IDOK				1)
(constant 'IDCANCEL 	2)
(constant 'IDABORT 		3)
(constant 'IDRETRY		4)
(constant 'IDIGNORE 	5)
(constant 'IDYES			6)
(constant 'IDNO				7)
(constant 'IDTRYAGAIN	10)
(constant 'IDCONTINUE 11)

;; @syntax (win-message-box:show <title> <message> <flags>)
;; @return The message box return value.
;;
;; Displays a message box matching the given <title> <message> and <flags>.
;; @example
;; (set result (win-message-box:show "My Title" "Please select something:" (+ win-message-box:MB_CANCELTRYCONTINUE)))
;;
;; @example
;; (define appname "My Program")
;; (define result (win-message-box:show appname "Please select something:" (+ win-message-box:MB_CANCELTRYCONTINUE)))
;; (case result
;;    (1          (win-message-box:show appname "You clicked on OK."        win-message-box:MB_OK))
;;    (2          (win-message-box:show appname "You clicked on Cancel."    win-message-box:MB_OK))
;;    (10         (win-message-box:show appname "You clicked on Try Again." win-message-box:MB_OK))
;;    (11         (win-message-box:show appname "You clicked on Continue."  win-message-box:MB_OK))
;;    (true       (win-message-box:show appname (append "You clicked on ID: " (string result)) win-message-box:MB_OK)))

(define (show title message flags)
  (int (MessageBoxA 0 message title flags)))

; EOF
