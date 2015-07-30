#!/bin/bash
rm -rvf build nagios-api*egg*
find . -name '*.pyc' -exec rm -vf '{}' \;
dpkg-buildpackage -us -uc
mkdir -p dist
mv -v ../nagios-api_* ./dist/
rm -rf *egg*
rm -rf build
