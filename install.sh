# software-properties-common contains "add-apt-repository" command for PPA conf
sudo apt-get update && apt-get install -y software-properties-common python-software-properties libxml2-dev libxslt1-dev python-dev build-essential python-lxml python-pip libffi-dev net-tools nmap python-numpy python-scipy gfortran libopenblas-dev liblapack-dev git libssl-dev 

# Add the package verification key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

pip install \
	pymongo \
	scrapy \
	scrapyd \
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

pip install numpy --upgrade
pip install scipy --upgrade
pip install scikit-learn

git clone https://github.com/TeamHG-Memex/memex-scrapy-utils.git /memex-scrapy-utils
cd /memex-scrapy-utils
python setup.py install

cd /
git clone https://github.com/TeamHG-Memex/tldextract.git /tldextract
cd /tldextract
python setup.py install

cd /
git clone https://github.com/scrapinghub/crawl-frontier.git /crawl-frontier
cd /crawl-frontier
git checkout development
python setup.py install

mkdir /memex-pinterest
cp -r . /memex-pinterest
