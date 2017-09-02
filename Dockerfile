FROM ocaml/opam-dev:alpine-3.3_ocaml-4.05.0
RUN sudo sh -c 'sed -i -e 's/v3\.3/edge/g' /etc/apk/repositories'
RUN sudo sh -c 'echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories'
RUN sudo apk update
RUN sudo apk add m4 rlwrap
RUN opam repo add --set-default ocamlnat git+https://github.com/dbuenzli/opam-repo-ocamlnat.git
RUN opam update
RUN opam switch create 4.05.0+ocamlnat
ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]