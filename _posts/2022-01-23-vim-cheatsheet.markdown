---
layout: post
title: "Programming Adventures: Vim"
description: "Guide to vim for programmers."
date: 2022-01-23 00:15 +0530
categories: [blog]
---

# Vim  

Vim is a text editor.  
It's handy when working on most remote machines.  
Many programmers use it as their default code editor.  

I created this guide to act as a cheat-sheet for my personal use.  
People who use vim regularly often create one for reference.  
More detailed vim guides for various use cases can be found on the internet.  

## Overview  

Linting is not available in plain vim.  
A prowess in typing will make vim enjoyable:  

- High typing speed; code completion is **not** available in plain vim.  
- High typing accuracy; error correction is **not** available in plain vim.  

### Resources  

- `vimtutor` Command-line program.  
- `:help _` Visit vim's documentation. Replace `_` with command.  

### Operations  

Commands and actions are used to operate vim.  
Ideally vim is supposed to be operated using only the keyboard.  
Most commands can be called multiple times by prepending them with a number or range. A range is defined as `_,_` where `_` are numbers or marks or certain special characters:  
- `.` Current line.  
- `$` Last line.  
- `%` Entire file. Equivalent to `1,$`.  
- `*` Last selection in visual mode.  
Range can also be augmented with basic arithmetic.  

## Configuration  

Vim configuration is stored in .vimrc file.  
Vimscript is used to write the configuration.  
Look for `~/.vimrc`.  
 
### General Commands  

Commands are made up of `set` followed by options. Options may hold value.  

Boolean options can be toggled by appending `!` to the option.  
Boolean options can be unset by prepending `no` to the option.  
Value of an option can be checked by appending `?` to the option.  
Value can be assigned to an option by appending `=` followed by the value to the option.  
Value can be added to an option by appending `+=` followed by the value to the option.  
Value can be subtracted from an option by appending `-=` followed by the value to the option.  
An option can be reset to default value by appending `&` to the option.  

- `:set hlsearch` Set highlight search results.  
- `:set noh` Unset highlight search results.  
- `:set number` Set line numbers.  
- `:set nonumber` Unset line numbers.  
- `:set ignorecase` Set to ignore case in patterns and words.  
- `:set smartcase` Set to consider case in patterns and words. Requires `:set ignorecase`.  
- `:set undofile` Set to track changes to a file.  
- `:set undodir=~/example/path` Set file location to save track of change. Replace `~/example/path` with path and name of file. Requires `:set undofile`.  
- `:set undolevels=_` Set number of changes to track for undo. Replace `_` with a number.  
- `:set foldenable` Set to enable fold.  
- `:set foldmethod=_` Set method to collapse blocks of code. Replace `_` with one of `manual`, `indent`, `expr`, `syntax`, `diff`, `marker`. Requires `:set foldenable`.  
- `:set foldcolumn=_` Set number of folds to display on the sidebar. Replace `_` with a number.  
- `:set incsearch` Set highlight pattern during input.  
- `:set statusline=example.expression` Set status line. Replace `example.definition` with format.  
- `:set background=_` Set background scheme. Replace `_` with scheme name.  
- `:set encoding=_` Set encoding. Replace `_` with name of encoding.  
- `:set expandtab` Set to use spaces in place of tabs.  
- `:set tabstop=_` Set number of spaces to place for each tab. Replace `_` with a number.  
- `:set shiftwidth=_` Set number of spaces for each indentation. Replace `_` with a number.  
- `:set smarttab` Set to use number of spaces depending upon the location of cursor.  
- `:set autoindent` Set auto-indent. Equivalent to `:set ai`.  
- `:set smartindent` Set to use auto-indent depending upon the location of cursor. Equivalent to `:set si`.  
- `:set cursorline` Set to show line underneath cursor.  
- `:set nocursorline` Unset cursorline.  
- `:set cursorcolumn` Set to highlight the column of cursor.  
- `:set nocursorcolumn` Unset cursorcolumn.  
- `:set warp` Set line warp.  
- `:set nowarp` Unset line warp.  
- `:set autoread` Set to re-read files modified on disk.  
- `:set noautoread` Unset autoread.  
- `:set title` Set to display file title.  
- `:set notile` Unset title display.  
- `:set wildmenu` Display tab complete options as menu.  
- `:set spell` Enable spellchecking.  
- `:set list` Set to display whitespaces.  
- `:set nolist` Unset whitespaces display.  
- `:retab` Replace all tabs with spaces.  
- `:syntax on` Enable syntax highlight.  
- `:syntax off` Disable syntax highlight.  
- `:colorscheme _` Choose colorscheme for highlight. Replace `_` with colorscheme. Requires `:syntax on`.  
- `:filetype on` Enable file type detection.  
- `:filetype plugin on` Enable plugins for the detected filetype.  
- `:filetype plugin off` Disable plugins for filetype.  
- `:filetype indent on` Enable filetype specific indentation.  
- `:filetype indent off` Disable filetype specific indentation.  

Commands in .vimrc must be added without `:`.  

### Save Options and Sessions  

- `:mk example.file` Save operations and mappings to file. Replace `example.file` with name of file. Use `:mk! example.file` to overwrite file.  
- `:mkexrc example/file` Save operations and mappings to file. Replace `example/file` with path and name of file. Use `:mkexrc! example/file` to overwrite file.  
- `:mks example/file` Save session to file. Equivalent to `:mksession example/file`. Replace `example/file` with path and name of file. Use `:mks! example/file` to overwrite file.  
- `:source example/file` Restore operations and mapping or session.  Replace `example/file` with path and name of file.  

## Buffers, Windows and Tabs  

A buffer is an open file.  
A window displays a buffer.  
A tab contains one or more windows.  

### General Commands  

- `:buffers` List buffers.  
- `:buffer _` Move to buffer. Replace `_` with id or name of the buffer.  
- `:ls` List buffers. Equivalent to `:buffers`.  
- `:bn` Move to next buffer. Equivalent to `:bnext`.  
- `:bp` Move to previous buffer. Equivalent to `:bprevious`.  
- `:bf` Move to first buffer. Equivalent to `:bfirst`.  
- `:bl` Move to last buffer. Equivalent to `:blast`.  
- `:badd example.file` Add file to buffer. Replace `example.file` with file path.  
- `:bdelete _` Delete buffer. Replace `_` with id or name of the buffer.  
- `:_,_bdelete` Delete buffers. Replace `_,_` with start id and end id respectively.  
- `:bd` Delete buffer. Equivalent to `:bdelete`.  
- `:Bdelete` Delete buffer but do not close window.  
- `:jumps` Display jump list.  
- `:history :` Command history.  
- `:history /` Search command history.  
- `:history ?` Search command history.  
- `:qall` Quit all buffers.  

### Operations And Navigation  

- `ctrl + ^` Switch to alternate buffer.  
- `_ctrl + ^` Switch to specific buffer. Replace `_` with buffer id.  
- `ctrl + w` followed by `s` Split the current window horizontally.  
- `ctrl + w` followed by `v` Split the current window vertically.  
- `ctrl + w` followed by `n` Split the current window horizontally and edit a new file.  
- `ctrl + w` followed by `^` Split the current window with alternate file.  
- `_` followed by `ctrl + w` followed by `^` Split current window with specific buffer. Replace `_` with buffer id.  
- `ctrl + w` followed by `j` Move to lower window.  
- `ctrl + w` followed by `k` Move to upper window.  
- `ctrl + w` followed by `h` Move to left window.  
- `ctrl + w` followed by `l` Move to right window.  
- `ctrl + w` followed by `r` Rotate the windows.  
- `ctrl + w` followed by `x` Exchange current window with next window.  
- `ctrl + w` followed by `=` Resize current window to fit.  
- `ctrl + w` followed by `-` Decrease the height of current window.  
- `ctrl + w` followed by `+` Increase the height of current window.  
- `ctrl + w` followed by `<` Decrease the width of current window.  
- `ctrl + w` followed by `>` Increase the width of current window.  
- `ctrl + o` Jump to previous cursor position.  
- `ctrl + i` Jump to next cursor position.  

### History  

- `q:` Open command history. Equivalent to `:history :`.  
- `q/` Search command history. Equivalent to `:history /`.   
- `q?` Search command history. Equivalent to `:history ?`.  
- `@:` Repeat last command.  

## Normal Mode  

Mode defines the purpose for which vim is being used.  
The default mode in vim is *NORMAL* mode.  
All general commands are accessible in this mode.  
Use `ctrl + c` or `ctrl + [` to activate *NORMAL* mode.  

Use `:` to switch to *COMMAND* mode:  

- `ctrl + r` followed by `ctrl + f` Copy filename under cursor.  
- `ctrl + r` followed by `ctrl + w` Copy word under cursor.  
- `ctrl + r` followed by `ctrl + l` Copy line under cursor.  

### General Commands  

- `:help` Vim's help.  
- `:q` Quit vim. Use `:q!` to Force quit vim.  
- `:w` Write file to disk.  
- `:w example.file` Write file `example.file` to disk. Replace `example.file` with name of file. Use `:w! example.file` to overwrite file `example.file` to disk.  
- `:wq` Write file to disk and quit.  
- `:x` Write file to disk and quit. Same as `:wq`.  
- `:e example.file` Edit existing file. Replace `example.file` with name of file.  
- `:pwd` Display present working directory.  
- `:cd example/directory` Change directory. Replace `example/directory` with directory path.  
- `:reg` Display register. Equivalent to `:register`.  
- `:s/example.pattern/replace.pattern/_` Substitute `example.pattern` with `replace.pattern`. Replace `example.pattern` with search pattern. `replace.pattern` can be left empty. Replace `_` with `&`, `c`, `g`, `i`, `I`, `n` or leave empty.  
- `:g/example.pattern/_` Execute command globally. Replace `example.pattern` with search pattern. Replace `_` with command.  
- `:marks` Display list of marks.  
- `:marks _` Display specific mark. Replace `_` with names of marks.  
- `:delm _` Delete mark. Replace `_` with name of mark. Equivalent to `delmarks _`.  
- `:delm!` Delete all marks. Equivalent to `delmarks!`.  
- `:dig` Display digraphs. Equivalent to `:digraphs`.  
- `:! example.command` Execute shell command. Replace `example.command` with shell command.  
- `:!!` Execute last shell command.  
- `:r! example.command` Execute shell command and insert output. Equivalent to `:read! example.command`. Replace `example.command` with shell command.
- `:r!!` Execute last shell command and insert output. Equivalent to `:read!! example.command`.  
- `:foldo` Open all folds. Equivalent to `:foldopen`.  
- `:foldo!` Open all folds recursively.  
- `:foldc` Close all folds. Equivalent to `:foldclose`.  
- `:foldc!` Close all folds recursively.  
- `:foldd example.command` Execute command on all open folds. Equivalent to `:folddoopen example.command`. Replace `example.command` with command to execute.  
- `:folddoc example.command` Execute command on all closed folds. Equivalent to `:folddoclosed example.command`. Replace `example.command` with command to execute.  
- `:ab` List abbreviations. Equivalent to `:abbreviate`. Use `:iab` for *INSERT* mode abbreviations. Use `:cab` for *COMMAND* mode abbreviations.  
- `:ab eg` List abbreviations beginning with `eg`. Equivalent to `:abbreviate eg`. Replace `eg` with any string. Use `:iab eg` for *INSERT* mode abbreviations. Use `:cab eg` for *COMMAND* mode abbreviations.  
- `:ab eg example given` Abbreviate `example given` with `eg`. Equivalent to `:abbreviate eg example given`. Replace `eg` with any string. Replace `example given` with replacement strings. Use `:iab eg example given` for *INSERT* mode abbreviations. Use `:cab eg example given` for *COMMAND* mode abbreviations.   
- `:una eg` Remove abbreviation `eg`. Equivalent to `:unabbreviate eg`. Replace `eg` with abbreviation string. Use `:iuna eg` for *INSERT* mode abbreviations. Use `:cuna eg` for *COMMAND* mode abbreviations.  
- `:abc` Remove all abbreviations. Equivalent to `:abclear`. Use `:iabc` for *INSERT* mode abbreviations. Use `:cabc` for *COMMAND* mode abbreviations.  
- `:split` Split file horizontally.  
- `:vsplit` Split file vertically.  

### Search  

- `/example.pattern` Search pattern forward in current file. Replace `example.pattern` with search pattern.  
- `?example.pattern` Search pattern backward in current file. Replace `example.pattern` with search pattern.  
- `/Example.Pattern\C` Search case sensitive pattern forward in current file. Replace `Example.Pattern` with cased search pattern.  
- `?Example.Pattern\C` Search case sensitive pattern backward in current file. Replace `Example.Pattern` with cased search pattern.  
- `/example.pattern\c` Search case insensitive pattern forward in current file. Replace `example.pattern` with search pattern.  
- `?example.pattern\c` Search case insensitive pattern backward in current file. Replace `example.pattern` with search pattern.  
- `//` Search previous pattern.  
- `*` Search word under cursor forward.  
- `#` Search word under cursor backward.  
- `g*` Search pattern under cursor forward.  
- `g#` Search pattern under cursor backward.  
- `gn` Select last search result.  
- `n` Next search result.  
- `N` Previous search result.   
- `ctrl + g` Next search result from *COMMAND* mode. Requires `:set incsearch`.  
- `ctrl + t` Previous search result from *COMMAND* mode. Requires `:set incsearch`.  

### Navigation  

- `h` Move one character left.  
- `j` Move one line down.  
- `k` Move one line up.  
- `l` Move one character right.  
- `w` Move one word forward.  
- `b` Move one word backward.  
- `0` Move to start of line.  
- `^` Move to first non whitespace character of line.  
- `$` Move to end of line.  
- `%` Move to the other bracket of the pair.  
- `f_` Find character forward on line. Replace `_` with character.  
- `F_` Find character backward on line. Replace `_` with character.  
- `m_` Move to character forward on line. Replace `_` with character.  
- `M_` Move to character backward on line. Replace `_` with character.  
- `;` Go forward on line. Requires `f_` or `F_` or `m_` or `M_`.  
- `,` Go backward on line. Requires `f_` or `F_` or `m_` or `M_`.  
- `_G` Move to start of line. Replace `_` with line number.  
- `G` Move to start of last line of file.  
- `gg` Move to start of first line of file. Equivalent to `1G`.  
- `ctrl + u` Move half screen up.  
- `ctrl + d` Move half screen down.  
- `ctrl + y` Scroll upwards.  
- `ctrl + e` Scroll downwards.  
- `g;` Move to next position of change.  
- `g,` Move to previous position of change.  
- `gi` Move to last position of change and switch to *INSERT* mode.  
- `gI` Move to start of line and switch to *INSERT* mode.  
- `[m` Move to start of method.  
- `m]` Move to end of method.  
- `'_` Move to first non whitespace character on marked line. Replace `_` with name of mark.  
- `` `_ `` Move to position of mark. Replace `_` with name of mark.  
- `[z` Move to start of fold.  
- `]z` Move to end of fold.  
- `zj` Move to start of next fold.  
- `zk` Move to start of previous fold.  

### Operations  

Operators may be used in conjuction to navigation commands.  

- `u` Undo.  
- `ctrl + r` Redo.  
- `.` Repeat last command.  
- `dd` Copy and delete line.  
- `d$` Delete to end of line.  
- `dgg` Delete to beginning of file.  
- `dG` Delete to end of file.  
- `ggdG` Delete entire content of file.  
- `diw` Delete inside word.  
- `dip` Delete inside paragraph.  
- `ciw` Change inside word.  
- `p` Paste.  
- `&` Repeat last substitute.  
- `zi` Toggle foldenable.  
- `zf` Create fold. Requires selection in *VISUAL* mode.  
- `zd` Delete fold under cursor.  
- `zD` Delete fold under cursor recursively.  
- `zE` Eliminate all folds.  
- `zo` Open fold under cursor.  
- `zO` Open fold under cursor recursively.  
- `zc` Close fold under cursor.  
- `zC` Close fold under cursor recursively.  
- `za` Toggle fold under cursor.  
- `zA` Toggle fold under cursor recursively.  
- `zx` Open fold under cursor and close all other folds.   
- `zm` Close all folds.  
- `zM` Close all folds recursively.  
- `zr` Open all folds.  
- `zR` Open all folds recursively.  
- `ctrl + a` Increment next number on line.  
- `ctrl + x` Decrement next number on line.  

### Registers  

- `"_` Set active register.  Replace `_` with name of register (a - z).  
- `q_` Start recording. Replace `_` with name of register (a - z).  
- `q` Stop recording. Requires `q_`.  
- `@_` Execute register. Replace `_` with name of register (a - z).  

### Marks  

- `m_` Mark the current line. Replace `_` with name of mark (a - z for local, A - Z for global).  

### Miscellaneous  

- `gf` Open and edit file located at path under cursor.  
- `ctrl + w` followed by `ctrl + f` Open and edit file located at path under cursor in separate window.  
- `gx` Open file located at path under cursor.  
- `ga` Get code of the character under cursor.  

## Insert Mode  

Insert content.  

Use `i` in *NORMAL* mode to *INSERT* before the current character.  
Use `a` in *NORMAL* mode to *INSERT* after the current character.  
Use `A` in *NORMAL* mode to *INSERT* after the end of line.  
Use `o` in *NORMAL* mode to *INSERT* below the current line.  
Use `O` in *NORMAL* mode to *INSERT* above the current line.  

### Operations and Navigation  

- `ctrl + r` followed by `_` Insert content of register. Replace `_` with name of register.  
- `ctrl + r` followed by `=` Expression register. Enter expression to evaluate and insert.  
- `ctrl + k` followed by `__` Insert digraph. Replace `__` with digraph code.  
- `ctrl + a` Insert last content that was inserted.  
- `ctrl + @` Insert last content that was inserted.  
- `ctrl + h` Delete character before cursor.  
- `ctrl + w` Delete word under cursor.  
- `ctrl + u` Delete everything before cursor.  
- `ctrl + t` Add indentation.  
- `ctrl + d` Remove indentation.  
- `ctrl + v` followed by `_` Insert character. Replace `_` with character literal. Equivalent to `ctrl + q` followed by `_`.  
- `ctrl + g` followed by `u` Split undo sequence.  
- `ctrl + x` followed by `ctrl + y` Scroll up.  
- `ctrl + x` followed by `ctrl + e` Scroll down.  
- `ctrl + x` followed by `ctrl + l` Whole line completion.  
- `ctrl + x` followed by `ctrl + f` File name completion.  
- `ctrl + x` followed by `s` Spelling suggestion.  
- `ctrl + x` followed by `ctrl + v` Command-line completion.  
- `ctrl + x` followed by `ctrl + i` Path pattern completion.   

## Visual Mode  

Modify, edit or copy selection.  

Use `v` in *NORMAL* mode.  
Use `shift + v` in *NORMAL* mode to activate *VISUAL LINE* mode.  
Use `ctrl + v` in *NORMAL* mode to activate *VISUAL BLOCK* mode.  
Use `ctrl + q` in *NORMAL* mode to activate *VISUAL BLOCK* mode.  

Use `gv` in *NORMAL* mode to select the last selection made using *VISUAL* mode.  

### Operations  

- `o` Move to other end of selection. In *VISUAL BLOCK* mode.  
- `O` Move to other side of selection. In *VISUAL BLOCK* mode.  
- `R` Rewrite selection. Equivalent to `S` Substitute selection.  
- `U` Uppercase selection.  
- `I` Insert at start of selected line.  
- `A` Append at end of selected line.  
- `c` Substitute selected lines.  

