#!/bin/sh

set -x
cd /tmp

# the tool is not yet in any release, and requires building.
git clone --recursive https://github.com/biojppm/rapidyaml

cmake --version
cmake -S rapidyaml -B rapidyaml/build -DRYML_BUILD_TOOLS=ON -DRYML_WITH_TAB_TOKENS=ON -DBUILD_SHARED_LIBS=OFF -DCMAKE_BUILD_TYPE=Debug
cmake --build rapidyaml/build -j --target ryml-yaml-events
file=$(find rapidyaml/build -name 'ryml-yaml-events*' -type f)
cp -fav $file /build/bin/ryml-yaml-events

rm -rf rapidyaml
