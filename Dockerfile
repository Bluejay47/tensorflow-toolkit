
# tensorflow/2.0.0-gpu-py3-jupyter
# 1.0.1

FROM tensorflow/tensorflow:latest-gpu-py3-jupyter
LABEL maintainer="Jerry Gamble <contact@jerrygamble.com>"
LABEL version="1.02"
LABEL description="tensorflow/tensorflow:2.0.0-gpu-py3-jupyter image with scikit-learn, pandas, scipy, matplotlib, and opencv-python."

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Chicago

RUN apt-get clean && \
    apt-get -yq update && \
    apt-get -yq upgrade && \
    apt-get -qy autoremove && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -yq tzdata

RUN apt-get install -yq python3-opencv

RUN pip3 install scikit-learn && \
    pip3 install scipy && \
    pip3 install jupyterlab && \
    pip3 install pandas && \
    pip3 install matplotlib

