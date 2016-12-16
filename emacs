learning emacs

1.kill-ring
descrpition: contains the kill history, used to copy paste cut, without size limit
key-bindings: "C-w" "M-w" "C-k" "C-y" "M-y"

2.rectangle
descrpition: commands operate on rectangular areas of the text
key-bindings: 
"C-x r k" "C-x r M-w" "C-x r d" "C-x r c"
"C-x r y" "C-x r o"   "C-x r N" "C-x r t"
"C-x SPC"

3.history-ring
descrpition: contains shell command history
key-bindings: "C-r" "M-r" "M-p" "M-n"

4.register
descrpition: use a char or number to represent a register, used to save positon text numer
note: R -> stands for your register name
key-bindings:
"C-x r <SPC> R" "C-x r s R" "C-x r n R" "C-x r w R" "C-x r r R"    -> save to register
"C-x r i R" "C-x r j R"                                            -> insert or jump to register

5.mark-ring
descrpition: used to save the cursor position across buffers
key-bindings: 
"C-SPC C-SPC"      -> save cursor position
"C-u C-SPC"        -> jump back last saved cursor position
"C-x C-SPC"        -> jump to last position of the global mark ring

6.keyboard macro
descrpition: record a sequence of editing commands so that you can repeat it conveniently later
key-bindings:
"C-x (" "C-x )"    -> define macro
"C-x eeee..."      -> execute macro n times

command: 
"name-last-kbd-macro" "insert-kbd-macro"

7.undo and redo
undo: "C-_"
redo: "C-g" "C-_"

8.deal with ispell error "no word lists can be found for the language "zh_cn"."
export LANG=en_US.UTF-8

9.retrieve the list of available packages from the package archive server.
command: "list-packages"

10.recursive edit
descrpition: "recursive edit" helps when you want to break out of the current command 
             that you’re currently doing and temporarily pursue something else,
             with the ability to snap back to where you were before.
             
for example: in the middle of "query-replace"
"C-w" or "C-r" -> break out of "query-replace", then do something else
"C-M-c"        -> go back to "query-replace"

11.
