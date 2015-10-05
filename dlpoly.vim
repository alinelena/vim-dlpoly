" Vim syntax file
" Language: dlpoly input files
" Maintainer: Alin M Elena
" Latest Revision: 30th of May 2015

if exists("b:current_syntax")
  finish
endif

"syn case ignore
syn match dlpolyTitle "\%1l.*" 

"----------------------------------------------------------------/
"       dlpoly predefined constants
"----------------------------------------------------------------/
syn match dlpolyUnits "\<seconds\>" 
syn match dlpolyUnits "\<angstrom\>" 
syn match dlpolyUnits "\<Angstroms\>" 
syn match dlpolyUnits "\<steps\>" 
syn match dlpolyUnits "\<kT/A\>" 
syn match dlpolyUnits "\< K\>" 
syn match dlpolyUnits "\<katm\>" 
syn match dlpolyUnits "\<deep\>" 
syn match dlpolyUnits "\<ps\>" 


"----------------------------------------------------------------/
"       dlpoly keywords
"----------------------------------------------------------------/
syn match dlpolyKeyword "^\s*\<steps\>" nextgroup=dlpolyAttribute 
syn match dlpolyKeyword "^\s*\<no\s\+elec\>" nextgroup=dlpolyAttribute 
syn match dlpolyKeyword "^\s*\<no\s\+electrostatics\>" nextgroup=dlpolyAttribute 
syn keyword dlpolyKeyword temperature pressure finish ensemble timestep print stats stack nextgroup=dlpolyAttribute 
syn keyword dlpolyKeyword elec cutoff equilibration job collect close nextgroup=dlpolyAttribute  
syn keyword dlpolyKeyword  units molecules nummols atoms vdw rvdw rpad restart multiple ewald nextgroup=dlpolyAttribute 
syn keyword dlpolyKeyword  shifted shake trajectory quaternion primary reaction eps cap nextgroup=dlpolyAttribute 
syn keyword dlpolyKeyword  integration integrator traj nextgroup=dlpolyAttribute 
syn match dlpolyKeyword "^\s*\<rdf\>" nextgroup=dlpolyAttribute
syn match dlpolyKeyword "^\s*\<scale\>" nextgroup=dlpolyAttribute 

"----------------------------------------------------------------/
"       dlpoly keywords deprecated
"----------------------------------------------------------------/
syn keyword dlpolyKeywordDep delr nextgroup=dlpolyAttribute

"----------------------------------------------------------------/
"       dlpoly keywords alias
"----------------------------------------------------------------/
syn keyword dlpolyKeywordAlias DL_POLY nextgroup=dlpolyAttribute

"----------------------------------------------------------------/
"       dlpoly keywords attributes
"----------------------------------------------------------------/
syn match dlpolyAttribute "\s\+\<rdf\>" 
"syn match dlpolyAttribute "\s\+\<rdf\>\s\+" nextgroup=dlpolyConstants 
syn match dlpolyAttribute "\s\+\<scale\>" 
syn keyword dlpolyAttribute every time precision nve npt nvt nst electrostatics tolerance field constant  
syn keyword dlpolyAttribute pmf width velocity step leapfrog

"----------------------------------------------------------------/
"       dlpoly keywords constants
"----------------------------------------------------------------/
syn keyword dlpolyConstants hoover kj lj berendsen verlet

"----------------------------------------------------------------/
"       dlpoly numbers used in blocks
"----------------------------------------------------------------/
"   Regular int like number with - + or nothing in front
"       e.g. 918, or -49

syn match dlpolyNumber '\d\+'
syn match dlpolyNumber '[-+]\d\+'

"   Floating point number with decimal no E or e (+,-)
"       e.g. 0.198781, .19 or -3.141592

syn match dlpolyNumber '\d*\.\d*'
syn match dlpolyNumber '\d\+\.\d*'
syn match dlpolyNumber '[-+]\d\+\.\d*'

"   Floating point like number with E and no decimal point (+,-)
"       e.g.    3E+9, 3e+09, or -3e+02

syn match dlpolyNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match dlpolyNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match dlpolyNumber '[-+]\=\d[[:digit:]]*[dD][\-+]\=\d\+'
syn match dlpolyNumber '\d[[:digit:]]*[dD][\-+]\=\d\+'

"   Floating point like number with E and decimal point (+,-)
"       e.g.    -3.9188e+09, or 0.9188E-93

syn match dlpolyNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match dlpolyNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match dlpolyNumber '[-+]\=\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'
syn match dlpolyNumber '\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'

syn keyword dlpolyBool true false T F yes 
syn match dlpolyBool "\w\+\<no\>" 


syntax match dlpolyOperator "\:"

"-----------------------------------------------------------------/
"   DL_POLY comments
"-----------------------------------------------------------------/
syn keyword dlpolyTodo TODO FIXME NOTE REMARK
syn match dlpolyComment "#.*$" contains=dlpolyTodo
syn match dlpolyComment "!.*$" contains=dlpolyTodo
"syn region dlpolyTitle start="^"  end="$" oneline contains=dlpolyOperator


"----------------------------------------------------------------------------/
"   Final setup
"----------------------------------------------------------------------------/

let b:current_syntax = "dlpoly"
set fdm=syntax
set foldlevel=3
"----------------------------------------------------------------------------/
"   dlpoly keyword highlighting rules
"----------------------------------------------------------------------------/

hi def link dlpolyComment Comment 
hi def link dlpolyTodo Todo
hi def link dlpolyBool Boolean
hi def link dlpolyNumber Float
hi def link dlpolyKeyword Keyword
hi def link dlpolyKeywordAlias Keyword
hi def link dlpolyKeywordDep Todo
hi def link dlpolyUnits Identifier 
hi def link dlpolyOperator Operator
hi def link dlpolyString String
hi def link dlpolyTitle Special
hi def link dlpolyAttribute Type
hi def link dlpolyConstants Constant
"hi def link dlpolyPreProc PreProc
