% Class declaration
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{preamble}[2020/06/25 Moritz's preamble class]

% Warns of deprecated LaTeX constructs
\RequirePackage[l2tabu, orthodox]{nag}

% ACS StyleGuide margins (default: disabled)
\newcommand{\acsgeometry}{}
\DeclareOption{geometry}{
	\renewcommand{\acsgeometry}{\RequirePackage[left=1.50cm, right=1.50cm, top=3.00cm, bottom=3.00cm]{geometry}}
}

% Colorlinks yes or no (default no)
\newcommand{\colorlinksenabled}{false}
\DeclareOption{colorlinks}{
	\renewcommand{\colorlinksenabled}{true}
}


% Based on scrbook class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass[
a4paper,
twoside,
cleardoublepage=empty,
titlepage=firstiscover,
toc=bibliography,
toc=listof,
]{scrbook}

% Fix too many alphabets error
\newcommand\hmmax{0}
\newcommand\bmmax{0}

% Numerical date format
\usepackage[yyyy-mm-dd]{datetime} 

% Add document information
\date{\today}
\author{Tristan Wiessalla\\geboren in Aachen}

%====================================================%
%================== Basic packages ==================%
% Packages that just should be there in any preamble %
%====================================================%
\RequirePackage[T1]{fontenc} 
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman,english]{babel}
\RequirePackage[
backend=biber,
doi=true,
url=false,
eprint=false,
style=numeric-comp, % Haven't decided on a style yet
citestyle=numeric-comp, 
sorting=nyt, % changed this; I like alphabetically sorted literature lists
autocite=inline, % Options: plain,inline,footnote,superscript,
hyperref=true
]{biblatex} % Biblatex, integrate with zotero using: https://github.com/retorquere/zotero-better-bibtex
\RequirePackage[final]{microtype} % Better font spacing and stuff. Final option provides that it is not disabled in draft mode
\RequirePackage[
pdfpagelabels=true, % Sets PDF page labels, so that PDF readers can detect different numbering styles (e.g. roman in \frontmatter)
plainpages=false, % Fixes errors caused by page numbering resets (as by \frontmatter, \mainmatter and \backmatter)
colorlinks=\colorlinksenabled, % Make links (as in TOC or references to figures) font red instead of drawing a red box around them. Colorlinks are also visible in print, boxes are not
bookmarks=true, % Make bookmarks
final, % Make links, no matter if draft mode or not
]{hyperref} 
\RequirePackage{csquotes} % Better quoting, but mainly here because it is recommended for babel and biblatex
\RequirePackage{cprotect} %Allow verbatim in captions, titles etc.


%========================%
% Styling packages %
%========================%
\RequirePackage{emptypage} % Ensures removed headers and footers on empty pages (like the one after the title)
%% \DeclarePrintbibliographyDefaults{title=References} % I don't get it to work properly
\RequirePackage{xspace} % In commands, \xspace makes a space after the command only if there is a word. In case of punctuation, it is omitted.
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{pdflscape} % Landscape pdf pages with \begin{landscape} ... \end{landscape}
\RequirePackage{underscore} % underscore behaves properly in text mode
\RequirePackage[draft=false]{scrlayer-scrpage} % Nice headers and footers
% \RequirePackage{ebgaramond-maths}
% \RequirePackage{lmodern}
\RequirePackage[largesmallcaps]{kpfonts}
\RequirePackage{algpseudocode} %To output pseudocode
\RequirePackage{algorithm}
\acsgeometry{}
\RequirePackage[
chapter, % Count codeblocks per chapter, not universally
mathescape=true, % Enable escape to math mode in code comments
newfloat=true, % Better support for KOMA documents
python3
]{minted} % Verbatim with syntax highlighting for code 


%=========%
% SIUnitx %
% =========%
\RequirePackage[
per-mode=symbol-or-fraction, % Format of units (fraction or reciprocal)
locale=US, % Set locale
range-units=single, % Don't repeat units in number ranges
list-units=single, % Don't repeat units in number lists
detect-all, % Apply same font settings to the number/unit as the surrounding text
% forbid-literal-units=true, % Only allow predefined units to enforce consistency
abbreviations=true, % Load abbreviations (\mg, \mmol, \ml etc.)
use-xspace=true, % Correct space after unit
]{siunitx} % Nice SI units, but also for number formatting/alignment in tables (with s and S column specifier)

%=====================%
% Chemistry and maths %
%=====================%
\RequirePackage{chemformula} % Stuff like \ch{MgCl2}
\RequirePackage{chemmacros} % Extension of chemformula, most notably contains \iupac{}, very useful for long IUPAC names containing heteroatoms, stereochemistry, greek letters and stuff. Also allows line breaking
\RequirePackage{mathtools} % Math stuff
\RequirePackage{amsfonts} % Math stuff (continued)
\RequirePackage{amssymb} % Math stuff (continued)
% \RequirePackage{chemfig} % Structural formulas drawn with tikz. Not so easy to use, but looks very nice. Still looking for an easier alternative

%=========================%
% Floats, figures, images %
%=========================%
\RequirePackage[section]{placeins} % Floats can not be printed behind the next section.
\RequirePackage[labelfont={bf,sc,small}]{caption} % Better captions, more customisable
\RequirePackage{subcaption} % Subfigures, subcaptions
\RequirePackage{tikz} % Figures you can draw on (text, lines, braces, stuff)
\RequirePackage{xcolor} % Allow colored text

%=============%
% Table stuff %
%=============%
\RequirePackage{multirow} % \multicolumn{num_of_columns}{X}{Content} and \multirow{num_of_rows}{X}{Content}
\RequirePackage{multirow,bigdelim} % Braces spanning multiple rows
\RequirePackage{xltabular} % A combination of longtable and tabularx. Useful for multi-page tables
\RequirePackage{csvsimple} % Read csv files as tables
\RequirePackage{booktabs} % \toprule, \midrule, \bottomrule, nicer tables (must have!)

%===============%
% Miscellaneous %
% ===============%
% I do my todo list in separate org files
%% \RequirePackage[obeyFinal]{todonotes} % Allows TODO notes in the text with \todo{note}, then can make a \listoftodos
%% \AtBeginDocument{\listoftodos}


% =======================%
% Reference styling
% =======================%
\usepackage{caption}%allows for verbatim in captions
\newenvironment{code}{\captionsetup{type=listing}}{}
\renewcommand{\listingname}{\textsc{~Function}}% Listings of source code are labelled 'Function'
\renewcommand{\tableautorefname}{\textsc{~Table}}
\renewcommand{\figureautorefname}{\textsc{~Figure}}
\renewcommand{\partautorefname}{\textsc{~Part}}
\renewcommand{\chapterautorefname}{\textsc{~Chapter}}
\renewcommand{\sectionautorefname}{\textsc{~Section}}
\renewcommand{\subsectionautorefname}{\textsc{~Subsection}}
\renewcommand{\appendixautorefname}{\textsc{~Appendix}}
\renewcommand{\equationautorefname}{\textsc{~Equation}}
\renewcommand{\algorithmautorefname}{\textsc{~Algorithm}}

\let\orgautoref\autoref % Matching in-text formatting of links
\renewcommand{\autoref}[1]
{
  \def\tableautorefname{\textsc{Table}}%
  \def\figureautorefname{\textsc{Figure}}%
  \def\partautorefname{\textsc{Part}}%
  \def\chapterautorefname{\textsc{Chapter}}%
  \def\sectionautorefname{\textsc{Section}}%
  \def\subsectionautorefname{\textsc{Subsection}}%
  \def\appendixautorefname{\textsc{Appendix}}%
  \def\equationautorefname{\textsc{Equation}}%
  \def\algorithmautorefname{\textsc{Algorithm}}%
  \orgautoref{#1}%
}
%============================================%
% Unicode characters (mostly the greek ones) %
%============================================%
\DeclareUnicodeCharacter{0391}{\chemAlpha} % Α Greek Capital Letter Alpha
\DeclareUnicodeCharacter{0392}{\chemBeta} % Β Greek Capital Letter Beta
\DeclareUnicodeCharacter{0393}{\chemGamma} % Γ Greek Capital Letter Gamma
\DeclareUnicodeCharacter{0394}{\chemDelta} % Δ Greek Capital Letter Delta
\DeclareUnicodeCharacter{0395}{\chemEpsilon} % Ε Greek Capital Letter Epsilon
\DeclareUnicodeCharacter{0396}{\chemZeta} % Ζ Greek Capital Letter Zeta
\DeclareUnicodeCharacter{0397}{\chemEta} % Η Greek Capital Letter Eta
\DeclareUnicodeCharacter{0398}{\chemTheta} % Θ Greek Capital Letter Theta
\DeclareUnicodeCharacter{0399}{\chemIota} % Ι Greek Capital Letter Iota
\DeclareUnicodeCharacter{039A}{\chemKappa} % Κ Greek Capital Letter Kappa
\DeclareUnicodeCharacter{039B}{\chemLambda} % Λ Greek Capital Letter Lambda
\DeclareUnicodeCharacter{039C}{\chemMu} % Μ Greek Capital Letter Mu
\DeclareUnicodeCharacter{039D}{\chemNu} % Ν Greek Capital Letter Nu
\DeclareUnicodeCharacter{039E}{\chemXi} % Ξ Greek Capital Letter Xi
\DeclareUnicodeCharacter{039F}{\chemOmicron} % Ο Greek Capital Letter Omicron
\DeclareUnicodeCharacter{03A0}{\chemPi} % Π Greek Capital Letter Pi
\DeclareUnicodeCharacter{03A1}{\chemRho} % Ρ Greek Capital Letter Rho
\DeclareUnicodeCharacter{03A3}{\chemSigma} % Σ Greek Capital Letter Sigma
\DeclareUnicodeCharacter{03A4}{\chemTau} % Τ Greek Capital Letter Tau
\DeclareUnicodeCharacter{03A5}{\chemUpsilon} % Υ Greek Capital Letter Upsilon
\DeclareUnicodeCharacter{03A6}{\chemPhi} % Φ Greek Capital Letter Phi
\DeclareUnicodeCharacter{03A7}{\chemChi} % Χ Greek Capital Letter Chi
\DeclareUnicodeCharacter{03A8}{\chemPsi} % Ψ Greek Capital Letter Psi
\DeclareUnicodeCharacter{03A9}{\chemOmega} % Ω Greek Capital Letters Omega
\DeclareUnicodeCharacter{03B1}{\chemalpha} % α Greek Small Letter Alpha
\DeclareUnicodeCharacter{03B2}{\chembeta} % β Greek Small Letter Beta
\DeclareUnicodeCharacter{03B3}{\chemgamma} % γ Greek Small Letter Gamma
\DeclareUnicodeCharacter{03B4}{\chemdelta} % δ Greek Small Letter Delta
\DeclareUnicodeCharacter{03B5}{\chemepsilon} % ε Greek Small Letter Epsilon
\DeclareUnicodeCharacter{03B6}{\chemzeta} % ζ Greek Small Letter Zeta
\DeclareUnicodeCharacter{03B7}{\chemeta} % η Greek Small Letter Eta
\DeclareUnicodeCharacter{03B8}{\chemtheta} % θ Greek Small Letter Theta
\DeclareUnicodeCharacter{03B9}{\chemiota} % ι Greek Small Letter Iota
\DeclareUnicodeCharacter{03BA}{\chemkappa} % κ Greek Small Letter Kappa
\DeclareUnicodeCharacter{03BB}{\chemlambda} % λ Greek Small Letter Lambda
\DeclareUnicodeCharacter{03BC}{\chemmu} % μ Greek Small Letter Mu
\DeclareUnicodeCharacter{03BD}{\chemnu} % ν Greek Small Letter Nu
\DeclareUnicodeCharacter{03BE}{\chemxi} % ξ Greek Small Letter Xi
\DeclareUnicodeCharacter{03BF}{\chemomicron} % ο Greek Small Letter Omicron
\DeclareUnicodeCharacter{03C0}{\chempi} % π Greek Small Letter Pi
\DeclareUnicodeCharacter{03C1}{\chemrho} % ρ Greek Small Letter Rho
\DeclareUnicodeCharacter{03C3}{\chemsigma} % σ Greek Small Letter Sigma
\DeclareUnicodeCharacter{03C4}{\chemtau} % τ Greek Small Letter Tau
\DeclareUnicodeCharacter{03C5}{\chemupsilon} % υ Greek Small Letter Upsilon
\DeclareUnicodeCharacter{03C6}{\chemphi} % φ Greek Small Letter Phi
\DeclareUnicodeCharacter{03C7}{\chemchi} % χ Greek Small Letter Chi
\DeclareUnicodeCharacter{03C8}{\chempsi} % ψ Greek Small Letter Psi
\DeclareUnicodeCharacter{03C9}{\chemomega} % ω Greek Small Letter Omega
\endinput

% ============================================================================%
% ================= Fix booktabs - xltabular incompatibility =================%
% https://tex.stackexchange.com/questions/522920/xltabular-breaking-booktabs %
% ============================================================================%
\makeatletter
\def\@BTrule[#1]{%
  \ifx\longtable\undefined
  \let\@BTswitch\@BTnormal
  \else\ifx\hline\LT@hline
  \nobreak
  \let\@BTswitch\@BLTrule
  \else
  \let\@BTswitch\@BTnormal
  \fi\fi
  \global\@thisrulewidth=#1\relax
  \ifnum\@thisruleclass=\tw@\vskip\@aboverulesep\else
  \ifnum\@lastruleclass=\z@\vskip\@aboverulesep\else
  \ifnum\@lastruleclass=\@ne\vskip\doublerulesep\fi\fi\fi
  \@BTswitch}
\makeatother
