FROM ubuntu@sha256:db6534670045ca4e47bcf76fe2c0a992c44b9f4d641c833f7cfac0377d702821 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:db6534670045ca4e47bcf76fe2c0a992c44b9f4d641c833f7cfac0377d702821
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/