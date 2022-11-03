#!/bin/bash
set -x
COUNTRIES_DIR="countries"
COUNTRIES="USA UK India"

if ![[ -d ${COUNTRIES_DIR} ]]; then
        mkdir ${COUNTRIES_DIR}
fi

for country in ${COUNTRIES}; do
        mkdir -p "${COUNTRIES_DIR}/${country}"
        if [[ ${country} == "USA" ]]; then
                echo "Washington, D.C" > ${COUNTRIES_DIR}/${country}/capital.txt
        elif [[ ${country} == "UK" ]]; then
                echo "London" > ${COUNTRIES_DIR}/${country}/capital.txt
        elif [[ ${country} == "India" ]]; then
                echo "New Delhi" > ${COUNTRIES_DIR}/${country}/capital.txt
        fi
done

#uptime
