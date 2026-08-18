" Set indentation options for Objective-C
setlocal shiftwidth=2
setlocal tabstop=2

" no tabs! spaces only..
setlocal expandtab

" if it looks like a tab, we can delete it like a tab
setlocal softtabstop=2

let b:undo_ftplugin = (exists('b:undo_ftplugin') ? b:undo_ftplugin . '|' : '')
      \ . 'setlocal shiftwidth< tabstop< expandtab< softtabstop<'
