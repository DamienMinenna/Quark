%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LaTeX class for Thesis
% By Damien Minenna
%
%
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Quark}[09/05/2021 v2.0 QuarkThesis class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax

\LoadClass[oneside,fleqn,openright]{book} 
% Load the book class
% oneside :
% fleqn: left-justified equations
% openany: do not put blankpage if a new chapter start on a odd page

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography 

\RequirePackage{natbib}

%% END Bibliography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Language and character encoding 

\RequirePackage[latin1,utf8]{inputenc} % Required for including letters with accents
\RequirePackage[T1]{fontenc} % Use 8-bit encoding that has 256 glyphs
\RequirePackage[english]{babel} % Modify the language used
\RequirePackage{textcomp}

%% END Language and character encoding  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figures 

\RequirePackage{graphicx}
\RequirePackage{wrapfig}
%\begin{wrapfigure}[15(nb lign used)]{r}{5.5cm} 
%\begin{center}
%\includegraphics[scale=1]{cat_face.png} 
%\end{center}
%\caption{Text}
%\end{wrapfigure}

\RequirePackage{floatrow} % Caption on the side

\newcommand{\figBesideLeft}[3]{%
%\hfuzz=100pt
\begin{figure}
\floatbox[{\capbeside\thisfloatsetup{capbesideposition={right,bottom},capbesidewidth=0.558\textwidth}}]{figure}[\FBwidth]
{\caption{#3}\label{#2}}
{\hspace{-12mm} \includegraphics[width=0.7\textwidth]{#1}}
\end{figure}}

\newcommand{\figBelow}[4]{%
\begin{figure}[t]
\hspace{-12mm}\includegraphics[scale=#2]{#1}
\centering
{\caption{#4}\label{#3}}
\end{figure}}

\newcommand{\figSmallLeft}[3]{%
%\hfuzz=100pt
\begin{figure}
\floatbox[{\capbeside\thisfloatsetup{capbesideposition={right,bottom},capbesidewidth=0.85\textwidth}}]{figure}[\FBwidth]
{\caption{#3}\label{#2}}
{\hspace{-12mm} \includegraphics[width=0.4\textwidth]{#1}}
\end{figure}}

\RequirePackage{caption}

\RequirePackage{float} %use the “float” package and then the [H] option for your figure.

%% END Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Maths

\RequirePackage{amsmath}  %Standard AMS packages
% A popular package from the American Mathematical Society that provides
% many useful and powerful commands for dealing with mathematics.
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

\RequirePackage{dsfont} % for symbols
\RequirePackage{upgreek} % Upright greek symbols

\RequirePackage[squaren,Gray,cdot]{SIunits} % For SI units

%% END Maths 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors 

\RequirePackage{color} % Add color
\definecolor{QuarkColor}{RGB}{21,81,149}

\newcommand{\QuarkColor}[1]{{\color{QuarkColor}{#1}}}

%% END Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Geometry 

% Regular A4 paper
% With large margins
\RequirePackage[
    a4paper,
    left=24.8mm,
    top=27.4mm,
    bottom=27.4mm,
    headsep=2\baselineskip,
    textwidth=141mm,
    marginparsep=2.2mm,
    marginparwidth=26.4mm,
    headheight=\baselineskip
]{geometry}


% Define some lenght
\newlength{\marginAll}
\setlength\marginAll {\marginparwidth}
\addtolength\marginAll{\marginparsep}

\newlength{\marginBiblio}
\setlength\marginBiblio {16.8mm}

\newenvironment{textinfullwidth}{\begin{adjustwidth}{-12mm}{-\marginAll}}{\end{adjustwidth}}

%% END Geometry 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fonts 

\RequirePackage{palatino} 
% Main font palatino

\newcommand*{\chapHeadFont}{\fontfamily{gfsdidot}\selectfont}
\newcommand*{\HelveticaFont}{\fontfamily{phv}\selectfont}

\usepackage{lmodern}

\RequirePackage{ragged2e} % align left
\setlength{\RaggedRightRightskip}{\z@ plus 0.08\hsize}
\setlength{\RaggedRightParindent}{1pc}

% Line height
\RequirePackage{setspace}
\renewcommand{\baselinestretch}{1.2} 

%% END Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Chapters 

\RequirePackage[kpfonts,grey]{quotchap}
%This package redefines the \chapter and \chapter* commands to create fancy chapter head pages with huge chapter numbers (possibly greyed) and provides commands for adding quotations in the upper left corner of these pages.
% Title font options available: avantgarde, beramono, berasans, beraserif, biolinum, bookman, charter, courier, helvetica, kpfonts, libertine, lmodern, newcentury, palatino, times, utopia
% You can choose any font for the chapter number by using the command \qsetcnfont before the start of the chapter.
%Thus it is strongly recommended to use the grey option (which is enabled by default and disabled by specifying nogrey) that improves the quality by printing the number in 60% grey.
%The color package is used to set the colour chaptergrey, redefining this colour may produce even more colourful effects.
% Please include the color package before the quotchap package.

\definecolor{chaptergrey}{RGB}{21,81,149}

%% END Chapters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Margin

% Counter
\newcounter{notecount}
\@addtoreset{notecount}{page}
\renewcommand\thenotecount{\textbf{\arabic{notecount}}}

% citenote command
\newcommand\citenote[1]{\refstepcounter{notecount}\textsuperscript{$\thenotecount$}\marginpar{\RaggedRight\noindent\textsuperscript{$\thenotecount$}\footnotesize{\citealt{#1}}}}

% note command
\newcommand\notenum[1]{\refstepcounter{notecount}\textsuperscript{$\thenotecount$}\marginpar{\RaggedRight\noindent\textsuperscript{$\thenotecount$}\footnotesize{#1}}}

\newcommand\note[1]{\marginpar{\RaggedRight\noindent\footnotesize{#1}}}

%% END Margin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Header customization

\RequirePackage{fancyhdr} % Headers and footers customization
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]%
{\markboth{{\thechapter.\ #1}}{}}
\renewcommand{\sectionmark}[1]%
{\markright{{\thesection.\ #1}}}
\renewcommand{\headrulewidth}{0.5pt}

%% Some new fonts
\newcommand{\helv}{%
\fontfamily{phv}\fontseries{b}\fontsize{9}{11}\selectfont}
\newcommand{\Bighelv}{%
\fontfamily{phv}\fontseries{b}\selectfont}
\newcommand{\smhelv}{%
\fontfamily{phv}\selectfont}
\newcommand{\utop}{%
\fontfamily{put}\fontsize{9}{11}\selectfont}

%% Style pageheading
\fancyhf{}

\newcommand{\leftfootname}{Univ.}
\newcommand{\middlefootname}{\it \today}
\newcommand{\rightfootname}{\sc Smith}

\renewcommand{\footrulewidth}{0.4pt}
\fancyfoot[LO]{\small  \leftfootname}
\fancyfoot[C]{\small \middlefootname}
\fancyfoot[RO]{\small \rightfootname}

\fancyheadoffset[LO]{12mm}
\fancyheadoffset[RO]{28.8mm}
\fancyfootoffset[LO]{12mm}
\fancyfootoffset[RO]{28.8mm}

\fancypagestyle{plain}{%

	\fancyhead[RO]{\checkoddpage
\ifoddpage
\thepage
\else
\leftmark
\fi
}
\fancyhead[LO]{\checkoddpage
\ifoddpage
\leftmark
\else
\thepage
\fi
}
	\fancyhf{}
	\renewcommand{\footrulewidth}{0.4pt}
	\fancyfoot[LO]{\small  \leftfootname}
	\fancyfoot[C]{\small \middlefootname}
	\fancyfoot[RO]{\small \rightfootname}

	\fancyheadoffset[LO]{12mm}
	\fancyheadoffset[RO]{28.8mm}
	\fancyfootoffset[LO]{12mm}
	\fancyfootoffset[RO]{28.8mm}
}

%% END Header customization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter, section 

%%% Changement mise en forme de Chapter, section, ...
\RequirePackage{titlesec}
\titleformat{\section}{\Large}{}{0em}{\QuarkColor{\thesection \\ \vspace{-0.3cm} {------} \\ }}
\titleformat{\subsection}{\large}{}{1em}{\QuarkColor{\thesubsection}\; }
\titleformat{\subsubsection}{\Large}{}{2em}{}
\titleformat{\paragraph}{\large}{}{0em}{\quad}

% Section number in the margin
\makeatletter
\renewcommand{\@seccntformat}[1]{\llap{\textcolor{QuarkColor}{\csname the#1\endcsname}\hspace{1em}}} 
\renewcommand{\section}{\@startsection{section}{1}{\z@}
{-4ex \@plus -1ex \@minus -.4ex}
{1ex \@plus.2ex }
{\Large\bfseries}}
\renewcommand{\subsection}{\@startsection {subsection}{2}{\z@}
{-3ex \@plus -0.1ex \@minus -.4ex}
{0.5ex \@plus.2ex }
{\large\bfseries}}
\renewcommand{\subsubsection}{\@startsection {subsubsection}{3}{\z@}
{-2ex \@plus -0.1ex \@minus -.2ex}
{.2ex \@plus.2ex }
{\bfseries}}                        
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
{-2ex \@plus-.2ex \@minus .2ex}
{.1ex}
{\normalfont\small\bfseries}}
%% END Chapter, section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyperref 

\RequirePackage{hyperref}
\PassOptionsToPackage{hyphens}{url}
\hypersetup{
    colorlinks=true,
    linkcolor=QuarkColor,
    filecolor=QuarkColor,      
    urlcolor=QuarkColor,
    citecolor=QuarkColor
}
 
\urlstyle{same}

%% END Hyperref
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Others

\RequirePackage{lipsum} % Dummy text \lipsum[2] or \lipsum

\RequirePackage{enumitem}% http://ctan.org/pkg/enumitem

\RequirePackage{changepage}
\strictpagecheck

\fancyhead[RO]{\checkoddpage
\ifoddpage
\thepage
\else
\leftmark
\fi
}
\fancyhead[LO]{\checkoddpage
\ifoddpage
\leftmark
\else
\thepage
\fi
}

% itemize
\renewcommand{\labelitemi}{\textcolor{QuarkColor}{$\diamond$}}

%\RequirePackage{showframe}% to show the page layout

\RequirePackage{manfnt}

\RequirePackage{multirow} % for tables

% avoid widows and orphans as far as possible
\widowpenalty10000
\clubpenalty10000

%% Others
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load files

% If there is a `macro.tex' file, load it up.
\IfFileExists{macro.tex}
  {\input{macro.tex}}
  {}

%% END Load files 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% END .cls
%%%
%%
%