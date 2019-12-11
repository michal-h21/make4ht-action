FROM debian:unstable-slim

LABEL "maintainer"="Michal Hoftich <michal.h21@gmail.com>"
LABEL "repository"="https://github.com/michal-h21/make4ht"
LABEL "homepage"="https://github.com/michal-h21/make4ht"

LABEL "com.github.actions.name"="LaTeX to XML"
LABEL "com.github.actions.description"="Convert LaTeX documents to XML with make4ht."
LABEL "com.github.actions.icon"="code"
LABEL "com.github.actions.color"="blue"


# Install all TeX and LaTeX dependencies
RUN apt-get update && \
    apt-get install --yes --no-install-recommends \
    make luatex texlive-base texlive-luatex texlive-latex-extra \
    tidy texlive-extra-utils python3-pygments python3-setuptools dvisvgm \
    texlive-plain-generic texlive-generic-recommended \
    pandoc latexmk lmodern fonts-lmodern tex-gyre fonts-texgyre \
    texlive-lang-english && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DEBIAN_FRONTEND noninteractive
ENV filename "sample.tex"
# extra packages installes using apt-get
ENV extra_packages ""
# output directory for the HTML files
ENV output_dir "./"
# make4ht command to be executed
ENV command "make4ht -ulm draft -d $output_dir $filename"

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT "/entrypoint.sh"
