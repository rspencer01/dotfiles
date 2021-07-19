let g:startify_bookmarks = [ { 'r': '~/.vimrc' } ]
let g:startify_fortune_use_unicode = 1

let g:startify_files_number = 5



if has('nvim')
    let g:startify_ascii = [
                \ "      .            .",
                \ "    .,;'           :,.",
                \ "  .,;;;,,.         ccc;.",
                \ ".;c::::,,,'        ccccc:",
                \ ".::cc::,,,,,.      cccccc.",
                \ ".cccccc;;;;;;'     llllll.",
                \ ".cccccc.,;;;;;;.   llllll.",
                \ ".cccccc  ';;;;;;'  oooooo.",
                \ "'lllllc   .;;;;;;;.oooooo'",
                \ "'lllllc     ,::::::looooo'",
                \ "'llllll      .:::::lloddd'",
                \ ".looool       .;::coooodo.",
                \ "  .cool         'ccoooc.",
                \ "    .co          .:o:.",
                \ "      .           .'",
                \]
else
    let g:startify_ascii = [
                \ '     ________ ;;     ________',
                \ '    /********\;;;;  /********\',
                \ '    \********/;;;;;;\********/',
                \ '     |******|;;;;;;;;/*****/',
                \ '     |******|;;;;;;/*****/''',
                \ '    ;|******|;;;;/*****/'';',
                \ '  ;;;|******|;;/*****/'';;;;;',
                \ ';;;;;|******|/*****/'';;;;;;;;;',
                \ '  ;;;|***********/'';;;;;;;;;',
                \ '    ;|*********/'';;;;;;;;;',
                \ '     |*******/'';;;;;;;;;',
                \ '     |*****/'';;;;;;;;;',
                \ '     |***/'';;;;;;;;;',
                \ '     |*/''   ;;;;;;',
                \ '              ;;',
                \]
endif

let g:startify_custom_header = map(g:startify_ascii, '"     ".v:val')
let g:startify_padding_left=5
