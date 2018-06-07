#!/usr/bin/env bash
set -e

if [ ! -d "${PWD}/frontend" ]; then
    expect auto_build_vue-cli.exp
fi

cd $PWD/frontend
