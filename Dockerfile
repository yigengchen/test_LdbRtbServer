FROM centos:7
#FROM gcc:4.8

RUN sleep 3600 && yum -y install openssl openssl-devel automake autoconf libtool make cmake automake autoconf gcc gcc-c++ && yum clean all
RUN mkdir -p /src/myapp
ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone
COPY . /src/myapp
WORKDIR /src/myapp
RUN make clean && make
EXPOSE 8088
CMD ./start.sh
