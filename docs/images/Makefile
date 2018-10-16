#! make

all: build favicon.ico clean

build: png2ico/png2ico

png2ico/png2ico:
	wget http://www.winterdrache.de/freeware/png2ico/data/png2ico-src-2002-12-08.tar.gz
	gunzip png2ico-src-2002-12-08.tar.gz
	tar xvf png2ico-src-2002-12-08.tar
	make -C png2ico
	rm png2ico-src-2002-12-08.tar

favicon.ico: build
	convert images/logo.png -resize 16x16^ favicon-16.png
	convert images/logo.png -resize 32x32^ favicon-32.png
	convert images/logo.png -resize 64x64^ favicon-64.png
	png2ico/png2ico favicon.ico favicon-16.png favicon-32.png favicon-64.png

clean:
	rm favicon-*.png
	rm -rf png2ico


