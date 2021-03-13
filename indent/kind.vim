if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2

setlocal indentexpr=GetKindIndent()
setlocal indentkeys=!^F,o,O,}

function! GetKindIndent()
  let prevline = getline(v:lnum - 1)

  if prevline =~ '\s\+(\s*.\+\s\+:\s\+.\+\s*)\s\+->\s*$'
    return match(prevline, '(')
  elseif prevline =~ '\s\+{\s*.\+\s\+:\s\+.\+\s*}\s\+->\s*$'
    return match(prevline, '{')
  endif

  if prevline =~ '[!#$%&*+./<>?@\\^|~-]\s*$'
    let s = match(prevline, '[:=]')
    if s > 0
      return s + &shiftwidth
    else
      return match(prevline, '\S')
    endif
  endif

  if prevline =~ '[{([][^})\]]\+$'
    return match(prevline, '[{([]')
  endif

  if prevline !~ '\<with\>'
    let s = match(prevline, '\<rewrite\>.*\<in\>')
    if s > 0
      return s + &shiftwidth
    endif

    let s = match(prevline, '\<rewrite\>')
    if s > 0
      return s + &shiftwidth
    endif
  endif

  if prevline !~ '\<else\>'
    let s = match(prevline, '\<if\>.*\&.*\zs\<then\>')
    if s > 0
      return s
    endif

    let s = match(prevline, '\<if\>')
    if s > 0
      return s + &shiftwidth
    endif
  endif

  if prevline =~ '\(=\|[{([]\)\s*$'
    return match(prevline, '\S') + &shiftwidth
  endif

  let line = getline(v:lnum)

  if (line =~ '^\s*}\s*' && prevline !~ '^\s*;')
    return match(prevline, '\S') - &shiftwidth
  endif

  if prevline =~ '^\S'
      return &shiftwidth
  endif

  if prevline =~ '^\s*$'
      return 0
  endif

  return match(prevline, '\S')
endfunction
