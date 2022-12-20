#!/usr/bin/bash
fission spec init
fission env create --spec --name env-get-brokerage-type --image nexus.sigame.com.br/fission-cx-env-3.8:0.0.3 --builder nexus.sigame.com.br/fission-cx-builder-3.8:0.0.3
fission fn create --spec --name fn-get-brokerage-type --env env-get-brokerage-type --src "./func/*" --entrypoint main.get_enums --executortype newdeploy
fission route create --spec --name rt-get-brokerage-type --method GET --url /enum/brokerage_type --function fn-get-brokerage-type
