% -*- coding: utf-8-unix; mode: latex -*-

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stabs2021}[2021/04/29]

% Declare class options
\newif{\ifbiblatex}
\DeclareOption{bibtex}{\biblatexfalse}  % Typeset bibliography and citations
\DeclareOption{biblatex}{\biblatextrue} % with either BibTeX or BibLaTeX

\DeclareOption{pagenumbers}{\newcommand{\stabs@pagenumbers}{}} % Page in header

\DeclareOption*{
  \ClassWarning{stabs2021}{Unknown class option '\CurrentOption'}}

% Execute default class options
\ExecuteOptions{bibtex} % Default is BibTeX but using BibLaTeX is recommended

% Process class options
\ProcessOptions\relax

% Base class is the KOMA-Script article class
\LoadClass[twocolumn=true,fontsize=12pt,headings=small,abstract=true]{scrartcl}

% Font
\RequirePackage[english]{babel} % Should be loaded before newtxtext
\RequirePackage{newtxtext}      % Roman text font provided by a Times clone
\RequirePackage{newtxmath}      % Matching math font, also load amsmath and
                                % amssymb symbols tex.stackexchange.com/a/564079
% Font encoding
\RequirePackage[T1]{fontenc}    % www.texfaq.org/FAQ-why-inp-font

% Logo width and height
\RequirePackage{graphicx}
\newsavebox{\stabs@logo}
\savebox{\stabs@logo}{\includegraphics{stabslogo.png}}
\newlength{\stabs@logowidth}                          % Used in header
\settowidth{\stabs@logowidth}{\usebox{\stabs@logo}}   % composition
\newlength{\stabs@logoheight}                         % Used to set header
\settoheight{\stabs@logoheight}{\usebox{\stabs@logo}} % height just below

% Header height = logo height + some separation from header line
\newlength{\stabs@logosep}                            % Used in header
\setlength{\stabs@logosep}{2mm}                       % composition
\newlength{\stabs@headheight}
\setlength{\stabs@headheight}{\stabs@logoheight}
\addtolength{\stabs@headheight}{\stabs@logosep}

% Page layout (add option showframe to package geometry for debugging purposes)
\setlength{\columnsep}{8mm}
\RequirePackage[margin=2cm,top=3.2cm,headheight=\stabs@headheight]{geometry}

% Text layout
\RequirePackage[skip,indent=6mm]{parskip} % Set \parskip to 0.5\baselineskip
\RequirePackage{indentfirst}              % Indent first paragraph of sections
\RequirePackage{microtype}

% Header and footer with KOMA-Script scrlayer-scrpage class
\RequirePackage{pbox}
\RequirePackage[headsepline]{scrlayer-scrpage} % Apply scrheadings page style,
\pagestyle{scrheadings}                 % which becomes accessible as headings
\addtokomafont{pagehead}{\footnotesize\sffamily\slshape}
\cohead{%
  % Logo and proceedings title both vertically centered on the baseline
  % (wrap in \fbox with \setlength{\fboxsep}{0pt} for debugging purposes)
  \parbox[c]{\stabs@logowidth}{\usebox{\stabs@logo}}%
  \hfill
  \pbox[c]{\textwidth}{\relax\ifvmode\centering\fi
    Proceedings of the 1st International Conference on the Stability and Safety
    \\of Ships and Ocean Vehicles, 7-11 June 2021, Glasgow, Scotland, UK}%
  % Reserved space for page number in collected proceedings,
  % or actual page number if class option pagenumbers is active
  % (helpful when writing the article and to facilitate review)
  \@ifundefined{stabs@pagenumbers}{\hspace{15mm}}{\hfill\thepage}%
  % Some separation from header line
  \vspace{\stabs@logosep}
}
\cofoot{} % Clear page number in footer (default in scrheadings page style)

% Footnotes
\RequirePackage[hang,flushmargin]{footmisc}

% Tables
\RequirePackage{booktabs}

% Mathematics (amsmath is already loaded by newtxmath)
\renewcommand{\vec}{\mathbf} % Upright bold vectors (default small over-arrow)

% Citations and references
\ifbiblatex
  % Use BibLaTeX (and BibLaTeX-ext)
  \RequirePackage{csquotes}
  \RequirePackage[style=ext-authoryear-comp,natbib=true]{biblatex}
  % Number of names before a name list in a bib. entry is truncated w/ "et al."
  \ExecuteBibliographyOptions{maxbibnames=5} % Default 3
  % Abbreviate given names in bib. entries
  \ExecuteBibliographyOptions{giveninits=true} % Default false
  \ExecuteBibliographyOptions{uniquename=init} % Default full in authoryear-comp
  % Repeat identical name lists rather than replacing them with a dash
  \ExecuteBibliographyOptions{dashed=false} % Default true in authoryear
  % Don't sort multiple citations i.e. citations such as \cite{ref1, ref2, ...}
  \ExecuteBibliographyOptions{sortcites=false} % Default true in authoryear-comp
  % Write family names before given names in bib. entries
  \DeclareNameAlias{author}{family-given} % Default family-given/given-family
  \DeclareNameAlias{editor}{family-given} % e.g. "Doe, John and Jane Doe"
  % Vertical spacing between bib. entries
  \setlength{\bibitemsep}{\parskip} % Default \itemsep
  % Separator between name list and year in bib. entries
  \DeclareDelimFormat[bib]{nameyeardelim}{\addcomma\space} % Default space
  % Format of year in bib. entries (biblatex-ext specific command)
  \DeclareFieldFormat{biblabeldate}{#1} % Default (#1) i.e. (yyyy)
\else
  % Use BibTeX (and natbib)
  \RequirePackage{natbib,har2nat}
  \bibliographystyle{dcu} % A Harvard bibliography style
  % Separator between name list and year in citations
  \setcitestyle{aysep={,}} % Default semicolon in dcu style
  % Hanging indentation of bib. entries
  \setlength{\bibhang}{\parindent} % Default 1em in natbib
  % Format of year in bib. entries
  \renewcommand{\harvardyearleft}{\unskip, } % Replace " (yyyy)" with ", yyyy."
  \renewcommand{\harvardyearright}[1]{.}     % tex.stackexchange.com/a/20204
  % Handle deprecated commands in dcu style
  \renewcommand{\bf}{\normalfont\bfseries} % Replace deprecated \bf
  \renewcommand{\harvardurl}{\url}         % Replace obsolete \harvardurl
\fi

% Redaction capability to anonymize the output
\RequirePackage{censor}

% Hyperlinks
\RequirePackage[breaklinks=true,colorlinks=true,allcolors=blue]{hyperref}
\urlstyle{rm}

% Section numbers
\renewcommand{\sectionformat}{\thesection.\quad}
\renewcommand{\subsectionformat}{\thesubsection\qquad}

% Section titles
\addtokomafont{disposition}{\rmfamily}  % All sectioning commands
\addtokomafont{section}{\MakeUppercase} % Sections only
\setkomafont{paragraph}{\hspace{6mm}\normalfont\underline}

% Title
\RequirePackage{letltxmacro}             % tex.stackexchange.com/a/47372
\LetLtxMacro{\stabs@komatitle}{\title}   % tex.stackexchange.com/q/82850
\renewcommand*{\title}[1]{\stabs@komatitle{\vspace{-17mm}\LARGE #1}}
\renewcommand{\titlepagestyle}{headings} % Default plain for title page

% Authors
\setkomafont{author}{%          % Abuse \setkomafont to increase vertical
  \renewcommand{\and}{\\[3mm]}% % spacing between the authors. The scrartcl
  \normalsize}                  % class typesets the authors in a centered,
\date{}                         % single-column tabular environment.

% Store contents of stabsabstract environment in \@stabsabstract
\RequirePackage{environ}
\NewEnviron{stabsabstract}{\global\let\@stabsabstract\BODY}
\newcommand{\@stabsabstract}{%
  \@latex@warning@no@line{No \noexpand\stabsabstract given}}

% Store contents of \keywords in \@keywords
\newcommand{\keywords}[1]{\global\def\@keywords{#1}}
\newcommand{\@keywords}{\@latex@warning@no@line{No \noexpand\keywords given}}

% Front matter
\newlength{\stabs@parskip}               % \twocolumn (used below) resets
\setlength{\stabs@parskip}{\parskip}     % these lengths in its optional
\newlength{\stabs@parindent}             % one-column argument, so we
\setlength{\stabs@parindent}{\parindent} % memorize them here...
\newcommand{\makestabstitle}{
  % Switch to two-column mode
  \twocolumn[
    % With some preceding one-column content
    \setlength{\parskip}{\stabs@parskip}     % ...and restore them here
    \setlength{\parindent}{\stabs@parindent}
    % Title and authors
    \maketitle
    % Abstract title
    \LetLtxMacro{\stabs@komaabstractname}{\abstractname}
    \renewcommand{\abstractname}{\footnotesize\stabs@komaabstractname}
    % Abstract
    \begin{abstract}
      \@stabsabstract
    \end{abstract}
    \par
    % Keywords
    \noindent{\footnotesize\textbf{Keywords:} \textit{\@keywords}}\par
    \vspace{2\parskip}
    % Clear \@keywords and \keywords after use
    \global\let\@keywords\@empty
    \global\let\keywords\relax
  ]
}
