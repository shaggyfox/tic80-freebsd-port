# Created by: basti@kummer-post.de
# $FreeBSD$

PORTNAME=	TIC-80
PORTVERSION=	v0.70.1
CATEGORIES=     games emulators
MASTER_SITES=	github
DIST_SUBDIR=    ${PORTNAME}

MAINTAINER=	basti@kummer-post.de
COMMENT=	Fantasy computer for making, playing and sharing tiny games

LICENSE= 	MIT

USE_GITHUB= 	yes
GH_ACCOUNT=	nesbox
GH_PROJECT=	TIC-80
GH_TAGNAME=	${PORTVERSION}
GH_TUPLE=	nesbox:3rd-party:23f0352:foo/3rd-party

uses=gmake python

do-configure:
	cd ${WRKSRC}/3rd-party/wren-0.1.0 && ${GMAKE} static

do-install:
	${INSTALL} ${WRKSRC}/bin/tic80 ${STAGEDIR}${PREFIX}/bin

ALL_TARGET= linux-pro
MAKE_ARGS= OPT="-O3 -Wall -std=gnu99 -DTIC80_PRO -DGLEW_STATIC -DSDL_GPU_DISABLE_GLES"
.include <bsd.port.mk>
