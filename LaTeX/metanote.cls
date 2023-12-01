\ProvidesClass{metanote}

\LoadClass{report}

\usepackage{metanote}

\usepackage[bf, raggedright, pagestyles]{titlesec}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

\SetupKeyvalOptions{family=METANOTE,prefix=METANOTE@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{METANOTE}{#1}}

\DeclareStringOption[cn]{lang}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{en}{\ekv{lang=en}}

\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\DeclareVoidOption{nofont}{\ekv{chinesefont=nofont}}

\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article}
 }
\ProcessKeyvalOptions*\relax


\RequirePackage{iftex}

\ifdefstring{\METANOTE@lang}{cn}{
	\ifXeTeX
		\ifdefstring{\METANOTE@chinesefont}{founder}{
		\RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}
		\usepackage{zhnumber}

		\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
		\setCJKsansfont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZHei-B01}
		\setCJKmonofont[BoldFont={FZHei-B01},ItalicFont={FZHei-B01}]{FZFangSong-Z02}
		\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
		\setCJKfamilyfont{zhhei}{FZHei-B01}
		\setCJKfamilyfont{zhkai}{FZKai-Z03}
		\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
		\newcommand*{\songti}{\CJKfamily{zhsong}}
		\newcommand*{\heiti}{\CJKfamily{zhhei}}
		\newcommand*{\kaishu}{\CJKfamily{zhkai}}
		\newcommand*{\fangsong}{\CJKfamily{zhfs}}}{\relax}

		\ifdefstring{\METANOTE@chinesefont}{nofont}{
		\RequirePackage[UTF8,scheme=plain,fontset=none]{ctex}}{\relax}

		\ifdefstring{\METANOTE@chinesefont}{ctexfont}{
		\RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
	\else
		\ifdefstring{\METANOTE@chinesefont}{ctexfont}{
		\RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
	\fi
	\AfterEndPreamble{
		\setlength\parindent{2\ccwd}}
  }{\relax}


\ifcsname kaishu\endcsname
	\newcommand{\citshape}{\kaishu}
\else
	\newcommand{\citshape}{\itshape}
\fi
\ifcsname kaishu\endcsname
	\newcommand{\cnormal}{\kaishu}
\else
	\newcommand{\cnormal}{\normalfont}
\fi
\ifcsname fangsong\endcsname
	\newcommand{\cfs}{\fangsong}
\else
	\newcommand{\cfs}{\normalfont}
\fi



\ifdefstring{\METANOTE@lang}{cn}{
    \newcommand{\tocchaptername}[1]{\Large\sc\bfseries 第\zhnumber{#1} 章}
    \renewcommand{\contentsname}{目\quad 录}
    \titleformat{\chapter}[hang]{\Huge\bfseries}{第\zhnumber{\thechapter} 章}{1em}{}

	\newcommand{\boxtitlefont}{\bfseries\sffamily}
	\newcommand{\theoremname}{定理}
	\newcommand{\corollaryname}{推论}
	\newcommand{\lemmaname}{引理}
	\newcommand{\propositionname}{命题}
	\renewcommand{\proofname}{证明}
	\newcommand{\claimname}{断言}
	\newcommand{\examplename}{例}
	\newcommand{\definitionname}{定义}
	\newcommand{\questionname}{问题}
	\newcommand{\exercisename}{习题}
	\newcommand{\notename}{注意}
	\newcommand{\solutionname}{解}
}{\relax}

\ifdefstring{\METANOTE@lang}{en}{
    \newcommand{\tocchaptername}[1]{\Large\sc\bfseries Chapter\ \thecontentslabel}

	\newcommand{\boxtitlefont}{\bfseries\sffamily}
	\newcommand{\theoremname}{Theorem}
    \newcommand{\corollaryname}{Corollary}
	\newcommand{\lemmaname}{Lemma}
	\newcommand{\propositionname}{Proposition}
	\renewcommand{\proofname}{Proof}
	\newcommand{\claimname}{Claim}
	\newcommand{\examplename}{Example}
	\newcommand{\definitionname}{Definition}
	\newcommand{\questionname}{Question}
	\newcommand{\exercisename}{Exercise}
	\newcommand{\notename}{Note}
	\newcommand{\solutionname}{Solution}
}{\relax}
