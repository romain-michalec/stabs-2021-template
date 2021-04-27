% -*- coding: utf-8-unix; mode: latex -*-

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stabs2021}[2021/04/26]

% Base class is the KOMA-Script article class
\LoadClass[twocolumn=true,fontsize=12pt,headings=small,abstract=true]{scrartcl}

% Font and font encoding
\RequirePackage[T1]{fontenc} % www.texfaq.org/FAQ-why-inp-font
\RequirePackage{times}
\RequirePackage{microtype}

% Page layout (add option showframe to package geometry for debugging purposes)
\setlength{\columnsep}{8mm}
\RequirePackage[top=3.2cm,bottom=2cm,left=2cm,right=2cm,headheight=2.4cm]{geometry}

% Text layout
\RequirePackage[skip,indent=6mm]{parskip} % Set \parskip to 0.5\baselineskip
\RequirePackage{indentfirst}              % Indent first paragraph of sections

% Pictures
\RequirePackage{graphicx}

% Citations and references
\RequirePackage{natbib,har2nat}
\bibliographystyle{dcu}                    % A Harvard bibliography style
\setcitestyle{aysep={,}}                   % Default semicolon in dcu style
\setlength{\bibhang}{6mm}                  % Default 1em in natbib
\renewcommand{\harvardyearleft}{\unskip, } % Replace (yyyy) with , yyyy.
\renewcommand{\harvardyearright}[1]{.}     % tex.stackexchange.com/a/20204
\renewcommand{\bf}{\normalfont\bfseries}   % Replace deprecated \bf command
\renewcommand{\harvardurl}{\url}           % Replace obsolete \harvardurl command

% Header
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\rhead{\begin{minipage}[b]{12cm}\centering\footnotesize  Proceedings of the 1st International Conference on the Stability and Safety\\
of Ships and Ocean Vehicles, 7-11 June 2021, Glasgow, Scotland, UK\\[1ex]\ 
\end{minipage}}
\lhead{\includegraphics[width=4.5cm]{stabslogo.jpg}}
\cfoot{}

% Footnotes
\RequirePackage[hang,flushmargin]{footmisc}
\renewcommand\footnoterule{\kern-3\p@\hrule\@width5cm\kern2.6\p@}

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
\RequirePackage{letltxmacro}           % tex.stackexchange.com/a/47372
\LetLtxMacro{\stabs@komatitle}{\title} % tex.stackexchange.com/q/82850
\renewcommand*{\title}[1]{\stabs@komatitle{\vspace{-17mm}\LARGE #1}}
\renewcommand{\titlepagestyle}{fancy}  % Default plain

% Authors
\setkomafont{author}{%          % Abuse \setkomafont to increase vertical
  \renewcommand{\and}{\\[3mm]}% % spacing between the authors. The scrartcl
  \normalsize}                  % class typesets the authors in a centered,
\date{}                         % single-column tabular environment.

% Keywords
\newcommand*{\keywords}[1]{\par
  \noindent{\footnotesize\textbf{Keywords:} \textit{#1}}\par
  \vspace{2\parskip}}

% Front matter
\newlength{\stabs@parskip}               % \twocolumn (used below) resets
\setlength{\stabs@parskip}{\parskip}     % these lengths in its optional
\newlength{\stabs@parindent}             % one-column argument, so we
\setlength{\stabs@parindent}{\parindent} % memorize them here...
\RequirePackage{environ}
\NewEnviron{frontmatter}{
  % Switch to two-column mode
  \twocolumn[
    % With some preceding one-column content
    \setlength{\parskip}{\stabs@parskip}     % ...and restore them here
    \setlength{\parindent}{\stabs@parindent}
    % Abstract title
    \LetLtxMacro{\stabs@komaabstractname}{\abstractname}
    \renewcommand{\abstractname}{\footnotesize\stabs@komaabstractname}
    % Input the collected body of the frontmatter environment
    \BODY
  ]
}