FROM golang:1.6-alpine

# create directory for our code
RUN mkdir -p /go/src/app

# set the default working directory
WORKDIR /go/src/app

# add source to the image
COPY . /go/src/app

# pull dependencies
RUN go-wrapper download

# build and install binary
RUN go-wrapper install

# instruct docker that port 8080 is used
EXPOSE 8080

# add entrypoint script
COPY entrypoint.sh /entrypoint.sh

# add entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# add default command
CMD ["go-wrapper","run"]
