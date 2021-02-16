" Copyright 2017 Michał Kaliński

if !exists('g:lightline_tagbar#format')
	let lightline_tagbar#format = '%s'
endif

if !exists('g:lightline_tagbar#flags')
	let lightline_tagbar#flags = ''
endif


function lightline_tagbar#component() abort
	return tagbar#currenttag(
	\	g:lightline_tagbar#format,
	\	'',
	\	g:lightline_tagbar#flags,
	\)
endfunction

