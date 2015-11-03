FROM ubuntu:15.10
ENV PATH /usr/games:$PATH
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y afnix              && apt-get clean && \
    apt-get install -y algol68g           && apt-get clean && \
    apt-get install -y aplus-fsf          && apt-get clean && \
    apt-get install -y asymptote          && apt-get clean && \
    apt-get install -y ats-lang-anairiats && apt-get clean && \
    apt-get install -y bash               && apt-get clean && \
    apt-get install -y bc                 && apt-get clean && \
    apt-get install -y bf                 && apt-get clean && \
    apt-get install -y bsdgames           && apt-get clean && \
    apt-get install -y cduce              && apt-get clean && \
    apt-get install -y clisp              && apt-get clean && \
    apt-get install -y clojure1.6         && apt-get clean && \
    apt-get install -y cmake              && apt-get clean && \
    apt-get install -y coffeescript       && apt-get clean && \
    apt-get install -y dc                 && apt-get clean && \
    apt-get install -y ecere-sdk          && apt-get clean && \
    apt-get install -y elixir             && apt-get clean && \
    apt-get install -y emacs24            && apt-get clean && \
    apt-get install -y erlang             && apt-get clean && \
    apt-get install -y f2c                && apt-get clean && \
    apt-get install -y fp-compiler        && apt-get clean && \
    apt-get install -y fsharp             && apt-get clean && \
    apt-get install -y g++                && apt-get clean && \
    apt-get install -y gambas3-script     && apt-get clean && \
    apt-get install -y gap                && apt-get clean && \
    apt-get install -y gauche             && apt-get clean && \
    apt-get install -y gawk               && apt-get clean && \
    apt-get install -y gcc                && apt-get clean && \
    apt-get install -y gdc                && apt-get clean && \
    apt-get install -y genius             && apt-get clean && \
    apt-get install -y gforth             && apt-get clean && \
    apt-get install -y gfortran           && apt-get clean && \
    apt-get install -y ghc                && apt-get clean && \
    apt-get install -y ghostscript        && apt-get clean && \
    apt-get install -y gnat               && apt-get clean && \
    apt-get install -y gnu-smalltalk      && apt-get clean && \
    apt-get install -y gnuplot            && apt-get clean && \
    apt-get install -y gobjc              && apt-get clean && \
    apt-get install -y golang             && apt-get clean && \
    apt-get install -y gpt                && apt-get clean && \
    apt-get install -y gri                && apt-get clean && \
    apt-get install -y groff              && apt-get clean && \
    apt-get install -y groovy             && apt-get clean && \
    apt-get install -y haxe               && apt-get clean && \
    apt-get install -y icont              && apt-get clean && \
    apt-get install -y iconx              && apt-get clean && \
    apt-get install -y intercal           && apt-get clean && \
    apt-get install -y iverilog           && apt-get clean && \
    apt-get install -y jasmin-sable       && apt-get clean && \
    apt-get install -y jq                 && apt-get clean && \
    apt-get install -y julia              && apt-get clean && \
    apt-get install -y libgd-dev          && apt-get clean && \
    apt-get install -y libpng12-dev       && apt-get clean && \
    apt-get install -y lisaac             && apt-get clean && \
    apt-get install -y llvm               && apt-get clean && \
    apt-get install -y lua5.3             && apt-get clean && \
    apt-get install -y make               && apt-get clean && \
    apt-get install -y maxima             && apt-get clean && \
    apt-get install -y mlton              && apt-get clean && \
    apt-get install -y mono-devel         && apt-get clean && \
    apt-get install -y mono-mcs           && apt-get clean && \
    apt-get install -y mono-vbnc          && apt-get clean && \
    apt-get install -y nasm               && apt-get clean && \
    apt-get install -y neko               && apt-get clean && \
    apt-get install -y nickle             && apt-get clean && \
    apt-get install -y nim                && apt-get clean && \
    apt-get install -y ocaml              && apt-get clean && \
    apt-get install -y octave             && apt-get clean && \
    apt-get install -y open-cobol         && apt-get clean && \
    apt-get install -y openjdk-6-jdk      && apt-get clean && \
    apt-get install -y pari-gp            && apt-get clean && \
    apt-get install -y parrot             && apt-get clean && \
    apt-get install -y perl               && apt-get clean && \
    apt-get install -y php5-cli           && apt-get clean && \
    apt-get install -y pike8.0            && apt-get clean && \
    apt-get install -y python             && apt-get clean && \
    apt-get install -y r-base             && apt-get clean && \
    apt-get install -y ratfor             && apt-get clean && \
    apt-get install -y regina-rexx        && apt-get clean && \
    apt-get install -y rhino              && apt-get clean && \
    apt-get install -y ruby2.1            && apt-get clean && \
    apt-get install -y scala              && apt-get clean && \
    apt-get install -y scilab             && apt-get clean && \
    apt-get install -y slsh               && apt-get clean && \
    apt-get install -y spl-core           && apt-get clean && \
    apt-get install -y swi-prolog         && apt-get clean && \
    apt-get install -y tcc                && apt-get clean && \
    apt-get install -y tcl                && apt-get clean && \
    apt-get install -y ucblogo            && apt-get clean && \
    apt-get install -y valac              && apt-get clean && \
    apt-get install -y xsltproc           && apt-get clean && \
    apt-get install -y yorick             && apt-get clean && \
    echo "apt-get install -y zoem" && sudo mount && echo && df -h && echo && sudo du -sm /* ; \
    apt-get install -y zoem               && \
    echo "apt-get clean" && df -h && echo && sudo du -sm /* ; \
    apt-get clean && \
    echo "apt-get finished" && df -h && echo && sudo du -sm /* ; echo "end"
ADD . /usr/local/share/quine-relay
WORKDIR /usr/local/share/quine-relay
RUN make -C vendor
CMD make CC=tcc check
