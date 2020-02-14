FROM alpine:latest

RUN apk update
RUN apk add bash build-base curl file git gzip libc6-compat ncurses ruby ruby-dbm ruby-etc ruby-irb ruby-json sudo

RUN adduser -D -s /bin/bash linuxbrew
RUN echo 'linuxbrew ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
RUN su -l linuxbrew

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
RUN PATH=$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH

CMD tail -f /dev/null
