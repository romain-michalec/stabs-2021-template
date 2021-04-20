% -*- coding: utf-8-unix; mode: latex; fill-column: 80 -*-

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{stabs21}[2021/04/20]

% Base class
\LoadClass[a4paper,12pt,headings=small]{scrartcl}

% Packages
\RequirePackage{times}
\RequirePackage{multicol}
\setlength{\columnsep}{8mm}
\RequirePackage[left=2cm,right=2cm,top=3.2cm,bottom=2cm,headheight=2.4cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{parskip}
\setlength{\parindent}{6mm}
\setlength{\parskip}{2mm}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}
\urlstyle{rm}
\RequirePackage[hang,flushmargin]{footmisc}
\RequirePackage{dblfnote}
\DFNalwaysdouble
\renewcommand\footnoterule{\kern-3\p@\hrule\@width5cm\kern2.6\p@}

\addtokomafont{disposition}{\rmfamily}

% Header
\pagestyle{fancy}
\rhead{\begin{minipage}[b]{12cm}\centering\footnotesize  Proceedings of the 1st International Conference on the Stability and Safety\\
of Ships and Ocean Vehicles, 7-11 June 2021, Glasgow, Scotland, UK\\[1ex]\ 
\end{minipage}\begin{minipage}[b]{5mm}\thepage\\[1ex]\ \end{minipage}}
\lhead{\includegraphics[width=4.5cm]{stab-logo.jpg}}
\cfoot{}

% Sectioning commands
\renewcommand*{\sectionformat}{\thesection.\quad}
\renewcommand*{\subsectionformat}{\thesubsection\autodot\qquad}
\newcommand{\ulparagraph}[1]{}
\let\ulparagraph=\paragraph
\renewcommand{\paragraph}[1]{\ulparagraph{\hspace*{6mm}\underline{\normalfont #1}}}

\addtokomafont{section}{\MakeUppercase}

% Special sections
\renewcommand{\maketitle}{%
\begin{center}
  {\LARGE\textbf{\@title}}\\\vspace{2em}
  \@author\vspace{1em}
\end{center}}

\renewenvironment{abstract}{%
  \noindent\textbf{\footnotesize ABSTRACT}\\[1em]\hspace*{6mm}}{}

\newcommand{\keywords}[1]{\vspace{1ex}%
  {\noindent\footnotesize \textbf{Keywords:} \textit{#1}}}
