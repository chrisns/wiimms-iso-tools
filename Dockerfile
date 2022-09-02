FROM ubuntu@sha256:86181188d631f0699afaefb177631b21a6d692629679443197472a3df6355012 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:86181188d631f0699afaefb177631b21a6d692629679443197472a3df6355012
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/