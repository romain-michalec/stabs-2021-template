\LoadClass[a4paper,12pt,headings=small]{scrartcl}

\usepackage[names]{xcolor}
\usepackage[pdfborder={0 0 0},
  colorlinks=true,
  citecolor=blue,
  linkcolor=blue,
  urlcolor=blue]{hyperref}
\urlstyle{rm}
\usepackage{times}
\usepackage{multicol}
\setlength{\columnsep}{8mm}
\usepackage[left=2cm,right=2cm,top=3.2cm,bottom=2cm,headheight=2cm]{geometry}
\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage{parskip}
\setlength{\parindent}{6mm}
\setlength{\parskip}{2mm}
\usepackage[hang,flushmargin]{footmisc}
\usepackage{dblfnote}
\DFNalwaysdouble
\renewcommand\footnoterule{\kern-3\p@\hrule\@width5cm\kern2.6\p@}

\addtokomafont{disposition}{\rmfamily}

\pagestyle{fancy}
\rhead{\begin{minipage}[b]{12cm}\centering\footnotesize  Proceedings of the 1st International Conference on the Stability and Safety\\
of Ships and Ocean Vehicles, 7-11 June 2021, Glasgow, Scotland, UK\\[1ex]\ 
\end{minipage}\begin{minipage}[b]{5mm}\thepage\\[1ex]\ \end{minipage}}
\lhead{\includegraphics[width=4.5cm]{stab-logo.jpg}}
\cfoot{}

\renewcommand*{\sectionformat}{\thesection.\quad}
\renewcommand*{\subsectionformat}{\thesubsection\autodot\qquad}
\newcommand{\ulparagraph}[1]{}
\let\ulparagraph=\paragraph
\renewcommand{\paragraph}[1]{\ulparagraph{\hspace*{6mm}\underline{\normalfont #1}}}

\addtokomafont{section}{\MakeUppercase}

\renewenvironment{abstract}{%
  \noindent\textbf{\footnotesize ABSTRACT}\\[1em]\hspace*{6mm}}{}

\newcommand{\keywords}[1]{\vspace{1ex}%
  {\noindent\footnotesize \textbf{Keywords:} \textit{#1}}}
