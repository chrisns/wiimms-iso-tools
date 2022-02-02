FROM ubuntu@sha256:fa16ff8fe65bbacb710cd2b32048724801bcd039a0de2797aef043a91d6cc667 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:fa16ff8fe65bbacb710cd2b32048724801bcd039a0de2797aef043a91d6cc667
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/