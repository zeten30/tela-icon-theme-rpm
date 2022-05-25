# RPM Makefile
RELEASE=36

build:
	./create-sources.sh

srpm: build
	mock -r fedora-$(RELEASE)-x86_64 --spec tela-icon-theme.spec --sources rpmbuild/ --resultdir rpmbuild/ --buildsrpm

rpm: srpm
	mock -r fedora-$(RELEASE)-x86_64 --rebuild rpmbuild/tela-*.src.rpm --resultdir rpmbuild/

copr: srpm
	copr-cli build mzink/Utils rpmbuild/tela-*.src.rpm --nowait
