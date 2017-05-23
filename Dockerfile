############################################################ 
# Dockerfile to build subread-1.5.1 container images 
# Based on Ubuntu ############################################################ 
# Set the base image to Ubuntu 

FROM r-base:3.3.2 

# Install compiler 

RUN apt-get update \
    && apt-get install -y \
        build-essential \
        gcc-multilib \
        apt-utils \
        zlib1g-dev \
        libxml2-dev \
        curl \
        libncurses5-dev
        
      
# Install subread 
WORKDIR /usr/local/ 
RUN wget http://heanet.dl.sourceforge.net/project/subread/subread-1.5.1/subread-1.5.1-source.tar.gz 
RUN tar xzf subread-1.5.1-source.tar.gz 
WORKDIR /usr/local/subread-1.5.1-source/src 
RUN make -f Makefile.Linux 
RUN ln -s /usr/local/subread-1.5.1-source/bin/* /usr/local/bin


# Cleanup
RUN apt-get clean

# Default command to execute at startup of the container
CMD cd /home/
