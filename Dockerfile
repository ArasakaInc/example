FROM docker.zhubby.com/library/golang:1.21 as build
WORKDIR /go
ADD . .
RUN unset GOPATH  && go build -mod=vendor -o main
FROM docker.zhubby.com/library/golang:1.21
COPY --from=build /go/main ./main
ENTRYPOINT ["./main"]