\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{manuscript}[2019/04/26 v0.1.1 the Future Family]

\def\manuscript@baseclass{extarticle}

\newif\ifusempar\usemparfalse
\DeclareOption{mpar}{\usempartrue}

\newif\ifcn\cnfalse
\DeclareOption{cn}{\cntrue}

\newif\ifcentertitle\centertitlefalse
\newcommand\CenteringTheTitle{\centertitletrue}
\DeclareOption{centertitle}{\centertitletrue}

\newif\ifpublish\publishfalse
\DeclareOption{publish}{\publishtrue}

\newif\ifonlyformal\onlyformalfalse
\DeclareOption{formal}{\onlyformaltrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\manuscript@baseclass}}
\ProcessOptions\relax

\LoadClass{\manuscript@baseclass}

%% Geometry
%--------------------------------------------------------------------------
\RequirePackage{geometry} 
\ifusempar
  \geometry{top=1in,bottom=1in,outer=2in,inner=1in,marginparwidth=1.5in,marginparsep=0.2in}
\else
  \geometry{top=1in,bottom=1in,outer=1in,inner=1in,marginparwidth=0.7in,marginparsep=0.2in}
\fi

%% Colors
%--------------------------------------------------------------------------
\RequirePackage{xcolor,colortbl}

\definecolor{hand}{RGB}{160,32,240}
\definecolor{handformal}{RGB}{243,102,25}
\definecolor{module}{RGB}{137,207,240}
\definecolor{submodule}{RGB}{251,255,242}
\definecolor{lstbackground}{RGB}{255,255,255}

\definecolor{skyblue}{RGB}{60,120,234}
\definecolor{steelblue}{RGB}{70,130,180}
\definecolor{forestgreen}{RGB}{21,122,81}
\definecolor{lightorange}{RGB}{255,185,88}

%% Useful packages
%--------------------------------------------------------------------------
\RequirePackage{ifthen}

\RequirePackage{hyperref}
\hypersetup{hidelinks,linktoc=all,backref,pagebackref,hyperindex,colorlinks=false,breaklinks,urlcolor=blue,bookmarks,bookmarksopen=false,unicode}

\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{titlesec}
\RequirePackage{titletoc}

\RequirePackage{mdwlist}
\RequirePackage{enumitem}

\RequirePackage{listings}
\lstset
{
  numbers=left,
  numberstyle=\scriptsize\color{gray},
  backgroundcolor=\color{lstbackground},
  breaklines=true,
  frame=L,
  basicstyle=\small\ttfamily,
  escapeinside={\#}{\#}
}

\RequirePackage[normalem]{ulem}
\RequirePackage[many]{tcolorbox}
\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{float}
\RequirePackage{tikz}
\RequirePackage{calc}

\RequirePackage{booktabs}
\RequirePackage{multirow}

\RequirePackage{changepage}
\RequirePackage{perpage}
\strictpagecheck

\RequirePackage{bxtexlogo}

%% Maths
%--------------------------------------------------------------------------
\RequirePackage{mathtools}
\allowdisplaybreaks[1] % 0~4
\RequirePackage{amsfonts,amsthm,amssymb,bm}
\RequirePackage{savesym}
\savesymbol{iint}
\savesymbol{iiint}
\savesymbol{iiiint}
\RequirePackage{esint}
\restoresymbol{ES}{iint}
\restoresymbol{ES}{iiint}
\restoresymbol{ES}{iiiint}
\RequirePackage{mathrsfs}

\newcommand*{\dif}{\mathop{}\!\mathrm{d}}

%% Title setting
%--------------------------------------------------------------------------
\renewcommand*{\title}[2][]{\gdef\shorttitle{#1}\gdef\@title{\bfseries #2}}
\renewcommand*{\author}[2][]{\gdef\shortauthor{#1}\gdef\@author{\small #2}}
\renewcommand*{\date}[1]{\gdef\@date{\small #1}}
\newcommand{\address}[1]{\@ifnotempty{#1}{\AtEndDocument{\par\textsc{#1}\par}}}
\newcommand{\email}[1]{\@ifnotempty{#1}{\AtEndDocument{\par\textit{\emailaddr}\ttfamily #1\par}}}

%% Page setting
%--------------------------------------------------------------------------
\setlength{\droptitle}{-1in}

\pagestyle{fancy}
\fancyhf{}

\renewcommand{\subsectionmark}[1]{\markright{\thesubsection~ #1}}

\makeatletter
\if@twoside
  \fancyfoot[LE,RO]{\bfseries \itshape -\,\thepage\,-}
  \fancyhead[LE,RO]{\bfseries \nouppercase{\rightmark}} 
\else
  \fancyfoot[R]{\bfseries \itshape -\,\thepage\,-}
  \fancyhead[R]{\bfseries \nouppercase{\rightmark}} 
\fi
\makeatother

\makeatletter
\fancypagestyle{plain}
{
  \fancyhf{}
  \if@twoside
    \fancyfoot[LE,RO]{\bfseries \itshape -\,\thepage\,-}
  \else
    \fancyfoot[R]{\bfseries \itshape -\,\thepage\,-}
  \fi
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\makeatother

%% Bibliography
%--------------------------------------------------------------------------
\RequirePackage[square,comma,sort&compress,numbers]{natbib}
\setlength{\bibsep}{1pt}
\renewcommand{\bibfont}{\small}

%% URL wrap
%--------------------------------------------------------------------------
\RequirePackage{url}
\def\UrlBreaks{\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J
\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V
\do\W\do\X\do\Y\do\Z\do\[\do\\\do\]\do\^\do\_\do\`\do\a\do\b
\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n
\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
\do\.\do\@\do\\\do\/\do\!\do\_\do\|\do\;\do\>\do\]\do\)\do\,
\do\?\do\'\do+\do\=\do\#}

%% Pictures
%--------------------------------------------------------------------------
\newcommand{\ideabulb}[2][0.15]{
  \scalebox{#1}{
  \begin{tikzpicture}
    \filldraw[draw=#2,fill=#2] (0,0) circle [radius=1cm];
    \filldraw[draw=white,fill=white,rounded corners=0.8pt]
        [rotate=20] (-0.26,-0.66) rectangle (-0.06,-0.6)
        [xshift=-0.4mm,yshift=1mm] (-0.26,-0.66) rectangle (0.02,-0.6)
        [xshift=0.4mm,yshift=1mm] (-0.26,-0.66) rectangle (-0.06,-0.6);
    \draw[draw=white,line width=0.7mm] (-0.18,-0.46) 
        .. controls (-0.18,-0.28) and (-0.28,-0.12) ..(-0.4,0.1)
        .. controls (-0.55,0.4) and (-0.3,0.64) ..(0,0.64)
        .. controls (0.3,0.64) and (0.55,0.4) ..(0.4,0.1)
        .. controls (0.28,-0.12) and (0.18,-0.28) ..(0.18,-0.46);
  \end{tikzpicture}}}

\newcommand{\questionmark}[2][0.15]{
  \scalebox{#1}{
  \begin{tikzpicture}
    \filldraw[draw=#2,fill=#2] (0,0) circle [radius=1cm];
      [xshift=0.4mm,yshift=1mm] (-0.26,-0.66) rectangle (-0.06,-0.6);
    \draw[draw=white,line width=1.5mm,yshift=0.5mm,scale=0.8] (-0.4,0.1)
        .. controls (-0.55,0.4) and (-0.3,0.64) ..(0,0.64)
        .. controls (0.3,0.64) and (0.55,0.4) ..(0.4,0.1)
        .. controls (0.28,-0.12) and (0.05,-0.28) ..(0.05,-0.3)
        .. controls (0,-0.36) and (0.0,-0.45) ..(0.0,-0.5);
        \filldraw[draw=white,fill=white,rounded corners=0.4mm] (-0.1,-0.7) rectangle (0.1,-0.5);
  \end{tikzpicture}}}

%% Marginnotes setting
%--------------------------------------------------------------------------
\RequirePackage{marginnote}
\newcommand{\mparadjust}[1]{\renewcommand*{\marginnotevadjust}{#1}}

\makeatletter
\if@twoside
  \tcbset{marginnotestyle/.style={% 
    skin=enhancedmiddle jigsaw,breakable,
    boxrule=0mm,if odd page={leftrule=1mm,rightrule=0.01mm,left=1mm,right=1mm}{leftrule=0.01mm,rightrule=1mm,left=0mm,right=1mm},boxsep=0mm,top=1mm,bottom=1mm}}
\else
  \tcbset{marginnotestyle/.style={% 
    skin=enhancedmiddle jigsaw,breakable,
    boxrule=0mm,leftrule=1mm,rightrule=0.01mm,left=1mm,right=1mm,boxsep=0mm,top=1mm,bottom=1mm}}
\fi
\makeatother

\newtcolorbox{skyblue}{marginnotestyle,colback=skyblue!5!white,colframe=skyblue!80}
\newtcolorbox{hand}{marginnotestyle,colback=hand!3!white,colframe=hand!80}
\newtcolorbox{handformal}{marginnotestyle,colback=handformal!3!white,colframe=handformal!75!yellow}

% mpar
\newcounter{mparcnt}
\renewcommand\themparcnt{\small{$^{\color{skyblue}{\mathbf{\arabic{mparcnt}}}}$}}
\newcommand\mpar[2][0]{
  \refstepcounter{mparcnt}{\hspace{-0.8ex}$^{\color{skyblue}{\mathbf{\arabic{mparcnt}}}}$}% 
  \mparadjust{#1\baselineskip}%  %This should be linked with font size.
  \marginnote{\vskip-\mparliftupfactor\baselineskip\begin{skyblue}% 
    \linespread{0.0}\themparcnt
    \scriptsize\color{skyblue!70!black} #2
  \end{skyblue}}}

% mparhand
\newcommand\mparhand[2][0]{% 
  {\mparadjust{#1\baselineskip}% 
  \marginnote{\vskip-\mparliftupfactor\baselineskip\begin{hand}% 
    \linespread{0.0}% 
    \handwriting\scriptsize\color{hand!70!black} #2% 
  \end{hand}}}}

% mparhandnum
\newcounter{mparhandformal}
\renewcommand\themparhandformal{\small{$^{\color{handformal}\mathbf{\roman{mparhandformal}}}$}}
\newcommand\mparhandnum[2][0]{
  \refstepcounter{mparhandformal}{\hspace{-0.8ex}$^{\color{handformal}{\mathbf{\roman{mparhandformal}}}}$}%  %This should be linked with font size.
  \mparadjust{#1\baselineskip}% 
  \marginnote{\vskip-\mparliftupfactor\baselineskip\begin{handformal}% 
    \linespread{0.0}\themparhandformal
    \handwriting\scriptsize\color{handformal!70!black} #2
  \end{handformal}}}

% marginal figure
\newlength{\fixfactor}
\newlength{\temp}
\makeatletter
  \setlength{\fixfactor}{\f@size\baselineskip} %This should be linked with font size.
  \setlength{\temp}{0.1\fixfactor}
  \addtolength{\temp}{-1.2\baselineskip}
  \setlength{\fixfactor}{\temp}

\newcommand\mparfig[2][0]{
  \if@twoside\else\reversemarginpar\fi
  \setlength{\temp}{#1\baselineskip+\fixfactor}\mparadjust{\temp}
  \marginnote{\!\!\!\!\!\!#2\!\!\!\!}\vspace{0pt} %This should be linked with font size.
  \if@twoside\else\normalmarginpar\fi
  }
\makeatother

%% Module, Separation line
%--------------------------------------------------------------------------
\newcounter{module}[subsection]
\tcbset{sepline/.style={% 
  sharp corners,rounded corners=all,oversize,
  boxrule=0mm,leftrule=1mm,rightrule=1mm,left=1mm,right=1mm,boxsep=0mm,top=-0.5mm,bottom=2.5mm,borderline={1.6pt}{0pt}{module!30}}}
\newtcolorbox{sltop}{sepline,skin=emptyfirst,toprule=0.6mm,bottomrule=0mm}
\newtcolorbox{slbottom}{sepline,skin=emptylast,toprule=0mm,bottomrule=0.6mm}

\makeatletter
\if@twoside
  \def\seplinetop{\vspace{-\seplineshrink\baselineskip}\begin{sltop}\stepcounter{module}\scriptsize\color{module!90!black!80} \checkoddpage
  \ifoddpage
    \raggedright\hspace{-10ex}\arabic{section}.\ifthenelse{\equal{\arabic{subsection}}{0}}{}{\arabic{subsection}.}\alph{module} %This should be linked with font size.
  \else
    \raggedleft\arabic{section}.\ifthenelse{\equal{\arabic{subsection}}{0}}{}{\arabic{subsection}.}\alph{module}\hspace{-11ex} %This should be linked with font size.
  \fi \vspace{-1ex}\end{sltop}\vspace{-1\baselineskip}} %This should be linked with font size.
\else
  \def\seplinetop{\vspace{-\seplineshrink\baselineskip}\begin{sltop}\stepcounter{module}\scriptsize\color{module!90!black!80} \raggedright\hspace{-10ex}\arabic{section}.\ifthenelse{\equal{\arabic{subsection}}{0}}{}{\arabic{subsection}.}\alph{module} \vspace{-1ex}\end{sltop}\vspace{-0.5\baselineskip}} %This should be linked with font size.
\fi
\makeatother
\def\seplinebottom{\vspace{-0.8\baselineskip}\begin{slbottom} \end{slbottom}\vspace{-\seplineshrink\baselineskip}} %This should be linked with font size.

\newenvironment{module}{\seplinetop}{\seplinebottom}

% submodule
\tcbset{subsepline/.style={% 
  sharp corners,rounded corners=all,oversize,
  boxrule=0mm,leftrule=0.4mm,rightrule=0.4mm,left=0.5mm,right=0.5mm,boxsep=0mm,top=0.5mm,bottom=1mm,borderline={1.5pt}{0pt}{submodule!90!black!45}}}
\newtcolorbox{subsltop}{subsepline,skin=emptyfirst,toprule=0.2mm,bottomrule=0mm}
\newtcolorbox{subslbottom}{subsepline,skin=emptylast,toprule=0mm,bottomrule=0.2mm}

\def\subseplinetop{\vspace{-\seplineshrink\baselineskip}\begin{subsltop}\end{subsltop}\vspace{-0.9\baselineskip}}
\def\subseplinebottom{\vspace{-1\baselineskip}\begin{subslbottom}\end{subslbottom}\vspace{-\seplineshrink\baselineskip}}

\newenvironment{submodule}{\subseplinetop}{\subseplinebottom}

%% Boxes for theorems
%--------------------------------------------------------------------------
\newenvironment{boxtheorem}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=black!3,colframe=orange]}
  {\end{tcolorbox}}

\newenvironment{boxcorollary}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=black!3,colframe=orange]}
  {\end{tcolorbox}}

\newenvironment{boxlemma}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=black!3,colframe=orange]}
  {\end{tcolorbox}}

\newenvironment{boxproposition}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=black!3,colframe=orange]}
  {\end{tcolorbox}}

\newenvironment{boxconjecture}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=purple!5,colframe=purple]}
  {\end{tcolorbox}}

\newenvironment{boxfact}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=black!3,colframe=orange]}
  {\end{tcolorbox}}


\ifdefined\pdfsavepos
  \RequirePackage{zref-savepos}

  \newlength{\deftop}
  \newlength{\defbot}
  \newlength{\defsep}
  \newlength{\defpage}
  \newlength{\currentpage}
  \newcounter{def}

  \newenvironment{boxdefinition}
    {\stepcounter{def}
    \zsavepos{def\arabic{def}1}
    \setlength{\global\deftop}{\dimexpr\paperheight - \zposy{def\arabic{def}1} sp}
    \setlength{\global\defsep}{\deftop-\defbot}
    \setlength{\global\currentpage}{\thepage pt}
    \ifthenelse{\lengthtest{\defpage = \currentpage}}
      {\ifthenelse{\lengthtest{\defsep < 3mm}}{\vspace{-3mm}}{}}{}\par
    \begin{tcolorbox}
    [enhanced jigsaw,pad at break*=1mm,breakable,
    colback=lightorange!10!white,boxrule=0pt,frame hidden,
    borderline west={1.5mm}{-1mm}{forestgreen}]}
    {\end{tcolorbox}
    \zsavepos{def\arabic{def}2}
    \setlength{\global\defbot}{\dimexpr\paperheight - \zposy{def\arabic{def}2} sp}
    \setlength{\global\defpage}{\thepage pt}}
\else
  \newenvironment{boxdefinition}
  {\vspace{-1mm}
  \begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=lightorange!10!white,boxrule=0pt,frame hidden,
  borderline west={1.5mm}{-1mm}{forestgreen}]}
  {\end{tcolorbox}
  \vspace{-2mm}}
\fi

\newenvironment{boxexercise}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=lightorange!20,boxrule=0pt,frame hidden]}
  {\end{tcolorbox}}

\newenvironment{boxproblem}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=yellow!25,boxrule=0pt,frame hidden]}
  {\end{tcolorbox}}

\newenvironment{boxexample}
  {\begin{tcolorbox}
  [enhanced jigsaw,pad at break*=1mm,breakable,
  colback=gray!10,boxrule=0pt,frame hidden]}
  {\end{tcolorbox}}

%% Styling of theorems
%--------------------------------------------------------------------------
\RequirePackage{amsthm}
\newtheoremstyle{styletheorem}
  {0pt}{0pt}{\theoremfont}{0pt}{\small\bf\sffamily\color{orange}}{\;}{0.25em}
  {\small\sffamily\color{orange}\thmname{#1}\!\!
  \nobreakspace\thmnumber{\textup{#2}}
  \thmnote{\sffamily\bfseries\color{black} (#3)}}

\newtheoremstyle{styleconjecture}
  {0pt}{0pt}{\theoremfont}{0pt}{\small\bf\sffamily\color{purple}}{\;}{0.25em}
  {\small\sffamily\color{purple}\thmname{#1}\!\!
  \nobreakspace\thmnumber{\textup{#2}}
  \thmnote{\sffamily\bfseries\color{purple} (#3)}}

\newtheoremstyle{styledefinition}
  {0pt}{0pt}{\theoremfont}{0pt}{\small\bf\sffamily\color{black}}{\;}{0.25em}
  {\small\sffamily\color{forestgreen}\thmname{#1}\!\!
  \nobreakspace\thmnumber{\textup{#2}}
  \thmnote{\sffamily\bfseries\color{black} (#3)}}

\newtheoremstyle{styleexercise}
  {0pt}{0pt}{\theoremfont}{0pt}{\small\bf\sffamily\color{black}}{\;}{0.25em}
  {\small\sffamily\color{black}\thmname{#1}\!\!
  \nobreakspace\thmnumber{\textup{#2}}
  \thmnote{\sffamily\bfseries\color{black} (#3)}}

\theoremstyle{styledefinition}
\newtheorem{envdefinition}{\definitiontitle}[section]
\newtheorem*{envdefinition*}{\definitiontitle}

\theoremstyle{styletheorem}
\newtheorem{envtheorem}{\theoremtitle}[section]
\newtheorem*{envtheorem*}{\theoremtitle}
\newtheorem{envcorollary}[envtheorem]{\corollarytitle}
\newtheorem*{envcorollary*}{\corollarytitle}
\newtheorem{envlemma}[envtheorem]{\lemmatitle}
\newtheorem*{envlemma*}{\lemmatitle}
\newtheorem{envproposition}[envtheorem]{\propositiontitle}
\newtheorem*{envproposition*}{\propositiontitle}
\newtheorem{envfact}[envtheorem]{\facttitle}
\newtheorem*{envfact*}{\facttitle}

\theoremstyle{styleconjecture}
\newtheorem{envconjecture}{\conjecturetitle}[section]
\newtheorem*{envconjecture*}{\conjecturetitle}

\theoremstyle{styleexercise}
\newtheorem{envexercise}{\exercisetitle}[section]
\newtheorem*{envexercise*}{\exercisetitle}
\newtheorem{envproblem}{\problemtitle}[section]
\newtheorem*{envproblem*}{\problemtitle}
\newtheorem{envexample}{\exampletitle}[section]
\newtheorem*{envexample*}{\exampletitle}

%% Environments for theorems
%--------------------------------------------------------------------------
\newenvironment{definition}
               {\begin{boxdefinition}\begin{envdefinition}}
               {\end{envdefinition}\end{boxdefinition}}

\newenvironment{definition*}
               {\begin{boxdefinition}\begin{envdefinition*}}
               {\end{envdefinition*}\end{boxdefinition}}

\newenvironment{theorem}
               {\begin{boxtheorem}\begin{envtheorem}}
               {\end{envtheorem}\end{boxtheorem}}

\newenvironment{theorem*}
               {\begin{boxtheorem}\begin{envtheorem*}}
               {\end{envtheorem*}\end{boxtheorem}}

\newenvironment{corollary}
               {\begin{boxcorollary}\begin{envcorollary}}
               {\end{envcorollary}\end{boxcorollary}}

\newenvironment{corollary*}
               {\begin{boxcorollary}\begin{envcorollary*}}
               {\end{envcorollary*}\end{boxcorollary}}

\newenvironment{lemma}
               {\begin{boxlemma}\begin{envlemma}}
               {\end{envlemma}\end{boxlemma}}

\newenvironment{lemma*}
               {\begin{boxlemma}\begin{envlemma*}}
               {\end{envlemma*}\end{boxlemma}}

\newenvironment{proposition}
               {\begin{boxproposition}\begin{envproposition}}
               {\end{envproposition}\end{boxproposition}}

\newenvironment{proposition*}
               {\begin{boxproposition}\begin{envproposition*}}
               {\end{envproposition*}\end{boxproposition}}

\newenvironment{conjecture}
               {\begin{boxconjecture}\mparfig[0.1]{\questionmark[0.33]{purple}}
                \begin{envconjecture}}
               {\end{envconjecture}\end{boxconjecture}}

\newenvironment{conjecture*}
               {\begin{boxconjecture}\begin{envconjecture*}}
               {\end{envconjecture*}\end{boxconjecture}}

\newenvironment{fact}
               {\begin{boxfact}\begin{envfact}}
               {\end{envfact}\end{boxfact}}

\newenvironment{fact*}
               {\begin{boxfact}\begin{envfact*}}
               {\end{envfact*}\end{boxfact}}

\newenvironment{exercise}
               {\begin{boxexercise}\begin{envexercise}}
               {\end{envexercise}\end{boxexercise}}

\newenvironment{exercise*}
               {\begin{boxexercise}\begin{envexercise*}}
               {\end{envexercise*}\end{boxexercise}}

\newenvironment{problem}
               {\begin{boxproblem}\begin{envproblem}}
               {\end{envproblem}\end{boxproblem}}

\newenvironment{problem*}
               {\begin{boxproblem}\begin{envproblem*}}
               {\end{envproblem*}\end{boxproblem}}

\newenvironment{example}
               {\begin{boxexample}\begin{envexample}}
               {\end{envexample}\end{boxexample}}

\newenvironment{example*}
               {\begin{boxexample}\begin{envexample*}}
               {\end{envexample*}\end{boxexample}}

\newenvironment{remark}
               {\par\noindent\itshape
                \mparfig{\ideabulb[0.33]{orange}}\hspace{-2.4ex}}%link this with font size!
               {\vspace{0.5\baselineskip}\par}

\newenvironment{remark*}
               {\begin{remark}}
               {\end{remark}}

%% Section title format
%--------------------------------------------------------------------------
\titleformat{\section}{\ifcentertitle\center\fi\large\bfseries}{\thesection.}{.5em}{}
\titleformat{\subsection}{\ifcentertitle\center\fi\normalsize\bfseries}{\thesubsection.}{.5em}{}
\titleformat{\subsubsection}{\ifcentertitle\center\fi\normalsize\bfseries}{\thesubsubsection}{.5em}{}

%% Enumerate numbering format
%--------------------------------------------------------------------------
\setlist[enumerate,1]{label=(\arabic*),font=\textup,
leftmargin=7mm,labelsep=1.5mm,topsep=0mm,itemsep=-0.8mm}
\setlist[enumerate,2]{label=(\alph*),font=\textup,leftmargin=7mm,labelsep=1.5mm,topsep=-0.8mm,itemsep=-0.8mm}

%% Subtitle
%--------------------------------------------------------------------------
\newcommand\subtitle[1]{
  \vspace{-1.75\baselineskip}\begin{flushright}\emph{\emph{------}#1}\end{flushright}\par}  %This should be linked with font size.

%% Language
%--------------------------------------------------------------------------
\RequirePackage{ifxetex}
\RequirePackage{ifplatform}

\RequirePackage[T1]{fontenc}
\RequirePackage{frcursive}

\newcommand{\emcolor}{}
\newcommand{\colorem}[1]{\renewcommand{\emcolor}{#1}}
\colorem{skyblue}

\newcommand\enhandwriting{\fontfamily{frc}\selectfont \bfseries \tiny}
\newcommand\theoremfont{\normalfont}
\newcommand\settheoremfont[1]{\renewcommand\theoremfont{#1}}

\ifcn
  \RequirePackage{indentfirst}

  \renewcommand{\address}[1]{}
  \renewcommand{\email}[1]{}

  \newcommand\mparliftupfactor{1.2} %This should be linked with font size.
  \newcommand\seplineshrink{0.3} %This should be linked with font size.

  \ifxetex
    \RequirePackage{ctex}

    \RequirePackage[T1]{fontenc}
    \RequirePackage{frcursive}

    \ifwindows
      \setCJKmainfont[ItalicFont={STKaiti}]{DengXian}
      \newCJKfontfamily\handwriting{FZShuTi}
    \else
      \setCJKmainfont[BoldFont={STHeiti},ItalicFont={STKaiti}]{STXihei}
      \newCJKfontfamily\handwriting{HanziPenSC-W5}
    \fi

    \makeatletter
    \def\pgfsys@hboxsynced#1{% fix marginnote position
    {%
      \pgfsys@beginscope%
      \setbox\pgf@hbox=\hbox{%
        \hskip\pgf@pt@x%
        \raise\pgf@pt@y\hbox{%
          \pgf@pt@x=0pt%
          \pgf@pt@y=0pt%
          \special{pdf: content q}%
          \pgflowlevelsynccm% 
          \pgfsys@invoke{q -1 0 0 -1 0 0 cm}%
          \special{pdf: content -1 0 0 -1 0 0 cm q}% translate to original coordinate system
          \pgfsys@invoke{0 J [] 0 d}% reset line cap and dash
          \wd#1=0pt%
          \ht#1=0pt%
          \dp#1=0pt%
          \box#1%
          \pgfsys@invoke{n Q Q Q}%
        }%
        \hss%
      }%
      \wd\pgf@hbox=0pt%
      \ht\pgf@hbox=0pt%
      \dp\pgf@hbox=0pt%
      \pgfsys@hbox\pgf@hbox%
      \pgfsys@endscope%
    }}
    \makeatother

    \def\theoremtitle{定理}
    \def\definitiontitle{定义}
    \def\prooftitle{证明}
    \def\lemmatitle{引理}
    \def\corollarytitle{推论}
    \def\propositiontitle{命题}
    \def\conjecturetitle{猜想}
    \def\exampletitle{例}
    \def\facttitle{事实}
    \def\problemtitle{问题}
    \def\questiontitle{小问题}
    \def\exercisetitle{练习}
    \renewcommand\refname{参考文献}
    \renewcommand\bibname{参考文献}

    \let\emph\relax
    \DeclareTextFontCommand{\emph}{\color{\emcolor}\em}

    \newcommand{\dnf}{{\color{forestgreen}\fbox{\bfseries 这里的内容尚未完成}}}

  \else
    \RequirePackage{CJKutf8}
    \RequirePackage{mparhack}

    \renewcommand{\baselinestretch}{1.2}%

    \AfterBeginDocument{\begin{CJK*}{UTF8}{gbsn}
      
      \def\theoremtitle{定理}
      \def\definitiontitle{定义}
      \def\prooftitle{\begin{CJK*}{UTF8}{gkai}证明\end{CJK*}}
      \def\lemmatitle{引理}
      \def\corollarytitle{推论}
      \def\propositiontitle{命题}
      \def\conjecturetitle{猜想}
      \def\exampletitle{例}
      \def\facttitle{事实}
      \def\problemtitle{问题}
      \def\questiontitle{小问题}
      \def\exercisetitle{练习}
      \renewcommand\proofname{\textit{证明}}
      \renewcommand\refname{参考文献}
      \renewcommand\bibname{参考文献}
      \renewcommand\indexname{索引} 
      \renewcommand\abstractname{摘要}
      \renewcommand\contentsname{目录} 
      \renewcommand\listfigurename{插图目录} 
      \renewcommand\listtablename{表格目录} 
      \renewcommand\figurename{图} 
      \renewcommand\tablename{表}
      \renewcommand\appendixname{附录}
      \renewcommand\today{\number\year 年\number\month 月\number\day 日}}
    \AtEndDocument{\end{CJK*}}

    \makeatletter
    \if@twoside
      \fancyhead[LE,RO]{\bfseries \nouppercase{\begin{CJK*}{UTF8}{gbsn}\rightmark\end{CJK*}}} 
    \else
      \fancyhead[R]{\bfseries \nouppercase{\begin{CJK*}{UTF8}{gbsn}\rightmark\end{CJK*}}} 
    \fi
    \makeatother

    \newcommand{\handwriting}{\color{gray}}
    \renewcommand{\emph}[1]{{\color{\emcolor} \begin{CJK}{UTF8}{gkai}\em #1\end{CJK}}}
    \renewcommand{\textit}[1]{{\begin{CJK*}{UTF8}{gkai}\itshape #1\end{CJK*}}}

    \renewenvironment{remark}
      {\par\vspace{0.3\baselineskip}\noindent\begin{CJK*}{UTF8}{gkai}\itshape
      \mparfig{\ideabulb[0.33]{orange}}\!\!\!\!}
      {\end{CJK*}\vspace{0.5\baselineskip}\par} %This should be linked with font size.

    \RequirePackage{silence}
    \WarningFilter{natbib}{Citation `}

    \newcommand{\dnf}{{\color{forestgreen}\fbox{\bfseries \begin{CJK*}{UTF8}{gbsn}这里的内容尚未完成\end{CJK*}}}}
  \fi

  %highlight
  \newcommand\highlight[2]{\bgroup\markoverwith
  {\textcolor{#1}{\rule[-0.6ex]{0.1pt}{3ex}}}\hspace{0.1ex}\ULon{#2}} %This should be linked with font size.

\else
  \RequirePackage{indentfirst}

  \newcommand\handwriting{\fontfamily{frc}\selectfont \bfseries \small}

  \def\theoremtitle{Theorem}
  \def\definitiontitle{Definition}
  \def\prooftitle{Proof}
  \def\lemmatitle{Lemma}
  \def\corollarytitle{Corollary}
  \def\propositiontitle{Proposition}
  \def\conjecturetitle{Conjecture}
  \def\exampletitle{Example}
  \def\facttitle{Fact}
  \def\problemtitle{Problem}
  \def\questiontitle{Question}
  \def\exercisetitle{Exercise}
  \def\emailaddr{Email address: }

  \newcommand\mparliftupfactor{1.4}  %This should be linked with font size.
  \newcommand\seplineshrink{0.1} %This should be linked with font size.

  \newcommand\highlight[1]{\bgroup\markoverwith
  {\textcolor{#1}{\rule[-.5ex]{2pt}{2.5ex}}}\ULon}

  \let\emph\relax
  \DeclareTextFontCommand{\emph}{\color{\emcolor}\em}

  \newcommand{\dnf}{{\color{forestgreen}\fbox{\bfseries To be finished here}}}
\fi

%% Publish form
%--------------------------------------------------------------------------
\ifpublish
  \renewcommand\handwriting{}
  \renewcommand\enhandwriting{}
  \renewcommand\mparhand[2][0]{}
  \renewcommand\mparhandnum[2][0]{}
\fi

%% Formal form
%--------------------------------------------------------------------------
\newcommand\informal[1]{\ifonlyformal\else#1\fi}
\newenvironment{informaltexts}
  {\ifonlyformal\setbox0\vbox\bgroup\fi}
  {\ifonlyformal\egroup\fi}

%% Badness adjust
%--------------------------------------------------------------------------
\hyphenpenalty=5000
\hbadness=1500
\tolerance=1500
