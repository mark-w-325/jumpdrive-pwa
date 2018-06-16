#!/usr/bin/env bash
set -e

if [ "$APP_STATE" -eq "99" ]; then
    if [ ! -d "${PWD}/frontend" ]; then
        expect auto_build_vue-cli.exp
    fi

    cd $PWD/frontend

    npm install && npm run dev
else
    cd $PWD/frontend
    npm install && npm run dev
fi
