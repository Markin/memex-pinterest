FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

# software-properties-common contains "add-apt-repository" command for PPA conf
RUN apt-get update && apt-get install -y software-properties-common python-software-properties libxml2-dev libxslt1-dev python-dev build-essential python-lxml python-pip libffi-dev net-tools nmap python-numpy python-scipy gfortran libopenblas-dev liblapack-dev git libssl-dev 

# Add the package verification key
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

RUN pip install \
	pymongo \
	scrapy \
	scrapyd \
	scrapyd-client \
	python-scrapyd-api \
	lxml \
	service_identity \
	pytest \
	reppy \
	scrapy-inline-requests \
	flask \
	html2text \
	tqdm \
	gunicorn \
	six \
	w3lib \
	SQLAlchemy

RUN pip install numpy --upgrade
RUN pip install scipy --upgrade
RUN pip install scikit-learn

RUN git clone https://github.com/TeamHG-Memex/memex-scrapy-utils.git /memex-scrapy-utils
WORKDIR /memex-scrapy-utils
RUN python setup.py install

WORKDIR /
RUN git clone https://github.com/TeamHG-Memex/tldextract.git /tldextract
WORKDIR /tldextract
RUN python setup.py install

WORKDIR /
RUN git clone https://github.com/scrapinghub/frontera.git /crawl-frontier
WORKDIR /crawl-frontier
#RUN git checkout development
RUN python setup.py install

ADD . /memex-pinterest

EXPOSE 80
EXPOSE 6800

WORKDIR /memex-pinterest

CMD ["bash", "start_all_services.bash"]
