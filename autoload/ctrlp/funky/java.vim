" Language: Java (java)
" Author: pydave
" License: The MIT License

function! ctrlp#funky#java#filters()
  " Java has a mostly standard format and style, so assume we've got
  " everything on one line (excluding annotations).
  let regex = '\v^\s+'                " preamble
  let regex .= '%(<\w+>\s+){0,3}'     " visibility, static, final
  let regex .= '%(\w|[<>[\]])+\s+'    " return type
  let regex .= '\w+\s*'               " method name
  let regex .= '\([^\)]*\)'           " method parameters
  let regex .= '%(\w|\s|\{)+$'        " postamble

  let filters = [
        \ { 'pattern': regex,
        \   'formatter': ['\v(^\s*)|(\s*\{.*\ze \t#)', '', 'g'] }
  \ ]
  return filters
endfunction
