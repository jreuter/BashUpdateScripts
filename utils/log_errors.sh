#!/bin/bash

log_err() {
    echo "Error on line $1."
}

trap 'log_err $LINENO' ERR

