# newlisp-message-box
A newLISP module for displaying message boxes natively in Windows.<br>
This module is platform-specific: Windows<br>
<br>
Before using the module it must be loaded:
<pre>
(load "C:\Program Files (x86)/newlisp/modules/message-box.lsp")
</pre>
...or shorter:
<pre>
(module "message-box.lsp")
</pre>

#Main function:<br>
win-message-box:show<br>
syntax: (win-message-box:show title message flags)<br>
return: The message box return value.<br>
Displays a message box matching the given title message and flags.<br>
<br>
Example:
<pre>
 (set result (win-message-box:show "My Title" "Please select something:" (+ win-message-box:MB_CANCELTRYCONTINUE)))
</pre>
Full program example:
 <pre>
 (define appname "My Program")
 (define result (win-message-box:show appname "Please select something:" (+ win-message-box:MB_CANCELTRYCONTINUE)))
 (case result
    (1          (win-message-box:show appname "You clicked on OK."        win-message-box:MB_OK))
    (2          (win-message-box:show appname "You clicked on Cancel."    win-message-box:MB_OK))
    (10         (win-message-box:show appname "You clicked on Try Again." win-message-box:MB_OK))
    (11         (win-message-box:show appname "You clicked on Continue."  win-message-box:MB_OK))
    (true       (win-message-box:show appname (append "You clicked on ID: " (string result)) win-message-box:MB_OK)))
 </pre>
 
 Dexter Santucci<br>
 April 2019
