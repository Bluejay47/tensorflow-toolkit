
# tensorflow/2.0.0-gpu-py3-jupyter
# 0.0.1

FROM tensorflow/tensorflow:2.0.0-gpu-py3-jupyter
LABEL maintainer="Jerry Gamble <contact@jerrygamble.com>"
LABEL version="1.0"
LABEL description="tensorflow/tensorflow:2.0.0-gpu-py3-jupyter image with scikit-learn, pandas, scipy, matplotlib, and opencv-python."

RUN apt-get clean
RUN apt-get -y update

RUN pip3 install scikit-learn
RUN pip3 install scipy
RUN pip3 install auto-sklearn
RUN pip3 install pandas
RUN pip3 install matplotlib

#install opencv
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN apt-get install -y python3-opencv

#clean up
RUN apt-get -qy autoremove
