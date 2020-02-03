#!/bin/bash

rm -rf target
mkdir -p package

cp ./*.tf ./package/

pushd src

npm run build
zip -r ../package/lambda.zip *

popd
