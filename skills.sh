#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <Programming Languages> <Technologies/Tools>"
  exit 1
fi

# Extract input arguments
programming_languages=$1
technologies_tools=$2

# Define the skills content
skills_content="\textbf{Programming Languages}{: $programming_languages} \\
\textbf{Technologies/Tools}{: $technologies_tools}"

# Insert the skills content into the LaTeX document
sed -i "/%-----------PROGRAMMING SKILLS-----------/,/% \-------------------------------------------/c\\
%-----------PROGRAMMING SKILLS-----------\\
\section{Technical Skills}\
 \begin{itemize}[leftmargin=0.15in, label={}]\
    \small{\item{\
     $skills_content \\
    }}\
 \end{itemize}\\
%-------------------------------------------/" your_resume.tex

echo "Skills have been updated in the LaTeX document."
exec pdflatex resume.tex
