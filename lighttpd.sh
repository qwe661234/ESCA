#!/bin/bash
libpath=$(find $(pwd) -type f -name "libshim.so" | sed 's_/_\\/_g')
webpath=$(readlink --canonicalize web | sed 's_/_\\/_g')
lightypath=$1

# modify nginx
sed -i "/^DL_LIB =/ s/$/ -Wl,-E ${libpath}/" ${lightypath}/src/Makefile
sed -i "s/server.document-root = .*/server.document-root = \"${webpath}\"/g" lighttpd.conf
