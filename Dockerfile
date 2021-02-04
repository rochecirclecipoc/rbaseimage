FROM rocker/verse:3.6.3

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libsodium-dev \
    && sed -i "s|CipherString = DEFAULT@SECLEVEL=2||g" /etc/ssl/openssl.cnf

COPY *.R /installation/
RUN Rscript /installation/install_pkgs.R \
    && rm -rf /installation
