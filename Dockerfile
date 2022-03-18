FROM ubuntu@sha256:31af67112c3cf56861a0ec7074863f0e110b8eae088c1f095cf23d89b9df5aa9 as build
RUN apt-get update && \
  apt-get install -y \
  bash \
  build-essential \
  libncurses-dev
WORKDIR /build
COPY wiimms-iso-tools/project .
RUN make

FROM ubuntu@sha256:31af67112c3cf56861a0ec7074863f0e110b8eae088c1f095cf23d89b9df5aa9
USER 1000
COPY --from=build /build/bin/* /usr/local/bin/