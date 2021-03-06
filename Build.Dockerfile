FROM golang:1.6-alpine

MAINTAINER Alexei Ledenev <alexei.led@gmail.com>

# install Git apk
RUN apk --update add git bash \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

# install glide package manager
RUN curl -Ls https://github.com/Masterminds/glide/releases/download/0.10.1/glide-0.10.1-linux-amd64.tar.gz | tar xz -C /tmp \
 && mv /tmp/linux-amd64/glide /usr/bin/

# gox - Go cross compile tool
# ghr - Github Release and upload artifacts
# goveralls - Go integration for Coveralls.io
# cover - Go code coverage tool
# go-junit-report - convert Go test into junit.xml format
RUN go get github.com/mitchellh/gox \
    && go get github.com/tcnksm/ghr \
    && go get github.com/mattn/goveralls \
    && go get golang.org/x/tools/cmd/cover \
    && go get github.com/jstemmer/go-junit-report

CMD ["script/go_build.sh"]
