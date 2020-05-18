FROM golang:latest

RUN GO111MODULE=on go get github.com/hieuvp/gotemplate-fmt
RUN gotemplate-fmt
