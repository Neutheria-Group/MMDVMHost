FROM debian 

RUN apt update && apt install -y \
    libi2c-dev \
    cmake \
    make \
    g++ \
    git \
  && rm -rf /var/cache/apk/*

ADD ./ /MMDVMHost
WORKDIR /MMDVMHost
RUN make \
&& cp MMDVMHost /usr/local/bin

VOLUME /MMDVMHost
WORKDIR /MMDVMHost

CMD ["MMDVMHost", "/MMDVMHost/MMDVM.ini"]

