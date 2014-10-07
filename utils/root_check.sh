#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo "Error: You must be root." >&2
    exit 1
fi

