%
% cicsletter.cls -- a document class based on Nesime Tatbul (tatbul@cs.brown.edu)'s Brown University LaTeX Template
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cicsletter}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{times}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[12pt,letterpaper]{letter}

\newcommand{\subjectname}{Subject}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{\subjectname: #1}}

\setlength{\textwidth}{6.875in}
\setlength{\textheight}{8.5in}
\setlength{\topskip}{0.0in}
\setlength{\footskip}{1in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\evensidemargin}{-0.25in}
\setlength{\topmargin}{-0.875in}

\DeclareFixedFont{\ixcmrmn}{OT1}{cmr}{m}{n}{9}

\newsavebox{\departmenthead}

\sbox{\departmenthead}{
    \parbox{6.875in}{
        \includegraphics[width=2.25in]{uni.png}%
        \hfill
        \includegraphics[width=2.25in]{dep.png}
    }
}

\renewcommand{\ps@firstpage}{
    \setlength{\headheight}{1in}
    \setlength{\headsep}{0.5in}
    \renewcommand{\@oddhead}{\usebox{\departmenthead}}
    \renewcommand{\@oddfoot}{}
}

% New commands for location and post-subject text
\providecommand{\@postsubject}{}
\newcommand{\postsubject}[1]{\renewcommand{\@postsubject}{#1}}

% Modify the opening command to remove location references
\renewcommand{\opening}[1]{\thispagestyle{firstpage}%
    \ifx\@empty\fromaddress
        {\raggedleft\@date\par}%
    \else  % home address
        {\raggedleft
            \begin{tabular}{l@{}}\ignorespaces
            \fromaddress \\ *[1\parskip]%
            \@date
            \end{tabular}\par
        }%
     \fi
     {\raggedright \toname \\ \toaddress \par}%
     \vspace{1\parskip}%

     \ifthenelse{\equal{\@subject}{}}{}{\@subject\\\@postsubject\par}
     \vspace{-1em}
     #1\par\nobreak
}

% we push closing to the right
\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
    \stopbreaks
    \noindent
    \hspace*{0.6\textwidth}\parbox{0.4\textwidth}{\raggedright
    \ignorespaces #1\\[2\medskipamount]%
    \ifx\@empty\fromsig
        \fromname
    \else \fromsig
    \fi\\[0.1in]%
    \includegraphics[height=0.5in]{signature.png}\strut}%
    \par
}
