FROM amazonlinux:2.0.20191217.0

ENV PATH="${PATH}:/~/.asdf/shims:/~/.asdf/bin"
RUN yum update -y && \
    yum install -y git && \
    git clone "https://github.com/asdf-vm/asdf.git" "~/.asdf" && \
    cd "~/.asdf" && \
    git checkout "$(git describe --abbrev=0 --tags)"

RUN asdf plugin-add elixir && \
    yum install -y unzip

RUN asdf plugin-add elm

RUN asdf plugin-add erlang && \
    yum groupinstall -y 'Development Tools' && \
    yum install -y autoconf ncurses-devel openssl-devel *openjdk-devel unixODBC unixODBC-devel libxslt fop procps

RUN asdf plugin-add nodejs && \
    bash /~/.asdf/plugins/nodejs/bin/import-release-team-keyring && \
    yum install -y tar
