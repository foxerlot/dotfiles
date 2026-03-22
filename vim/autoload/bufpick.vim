let s:origin_win = -1

function! bufpick#Open() abort
    let s:origin_win = win_getid()

    let bufs = getbufinfo({'buflisted': 1})
    if empty(bufs)
        echom 'BufPick: no listed buffers'
        return
    endif

    let pick_bufnr = bufnr(g:bufpick_bufname)
    let pick_winid = pick_bufnr != -1 ? bufwinid(pick_bufnr) : -1

    if pick_winid != -1
        call win_gotoid(pick_winid)
    elseif pick_bufnr != -1
        execute g:bufpick_position . ' ' . g:bufpick_height . 'split'
        execute 'buffer ' . pick_bufnr
    else
        execute g:bufpick_position . ' ' . g:bufpick_height . 'new'
        execute 'file ' . g:bufpick_bufname
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    endif

    setlocal cursorline
    setlocal nonumber norelativenumber
    setlocal statusline=\ Buffers
    setlocal modifiable
    silent %delete _

    let b:bufpick_map = {}
    let lnum = 1
    for buf in bufs
        let name    = empty(buf.name) ? '[No Name]' : fnamemodify(buf.name, ':~:.')
        let flags   = buf.changed ? ' [+]' : ''
        let current = buf.bufnr == bufnr('#') ? '#' : ' '
        let line    = printf('%s %3d  %s%s', current, buf.bufnr, name, flags)
        call setline(lnum, line)
        let b:bufpick_map[lnum] = buf.bufnr
        let lnum += 1
    endfor

    setlocal nomodifiable
    let cur_bufnr = winbufnr(s:origin_win)
    for [ln, nr] in items(b:bufpick_map)
        if nr == cur_bufnr
            execute ln
            break
        endif
    endfor

    nnoremap <buffer> <silent> <CR>  :call bufpick#Select()<CR>
    nnoremap <buffer> <silent> d     :call bufpick#Delete()<CR>
    nnoremap <buffer> <silent> q     :call bufpick#Close()<CR>
    nnoremap <buffer> <silent> <Esc> :call bufpick#Close()<CR>
    nnoremap <buffer> e :e<space>
endfunction

function! bufpick#Select() abort
    let lnum = line('.')
    if !has_key(b:bufpick_map, lnum) | return | endif
    let target = b:bufpick_map[lnum]
    call bufpick#Close()
    if win_gotoid(s:origin_win)
        execute 'buffer ' . target
    endif
endfunction

function! bufpick#Delete() abort
    let lnum = line('.')
    if !has_key(b:bufpick_map, lnum) | return | endif
    let target = b:bufpick_map[lnum]
    if target == winbufnr(s:origin_win)
        echom 'BufPick: cannot delete the active buffer'
        return
    endif
    execute 'bdelete ' . target
    call bufpick#Open()
endfunction

function! bufpick#Close() abort
    let pick_bufnr = bufnr(g:bufpick_bufname)
    if pick_bufnr != -1
        execute 'bwipeout ' . pick_bufnr
    endif
    call win_gotoid(s:origin_win)
endfunction
