#!/bin/sh

docker pull wpilib/toolchain-builder:18.04 \
 && docker run -v ${PWD}:/artifacts wpilib/toolchain-builder:18.04 bash -c "\
  cp /artifacts/download.sh /artifacts/repack.sh /artifacts/versions.sh . \
  && cp -R /artifacts/deb /artifacts/tools /artifacts/windows . \
  && zsh download.sh \
  && zsh repack.sh \
  && cd windows \
  && make sysroot binutils gcc gdb tree zip \
  && cp *.zip /artifacts/"
