FROM rocker/geospatial

RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         libboost-all-dev \
         libqt4-dev \
         libqwt-dev \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf var/lib/apt/lists/*

ENV PATH $PATH:/build/zig4

RUN    git clone https://github.com/cbig/zonation-core \
    && mkdir build \
    && cd build \
    && cmake ../zonation-core \
    && make \
    && cd .. \
    && rm -rf zonation-core

COPY   finzone finzone
RUN    R -e "remotes::install_local('finzone')" \
RUN    R -e "remotes::install_github(c('wkmor1/rzonation', 'wkmor1/finbif@dev'))" \
    && echo "\noptions(shiny.port = 3838, shiny.host = '0.0.0.0') \
       \n" >> /usr/local/lib/R/etc/Rprofile.site \
    && rm -rf finzone

EXPOSE 3838

CMD ["R", "-e", "finzone::run()"]
