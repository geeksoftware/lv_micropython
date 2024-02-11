#!/usr/bin/env bash

IDF_PATH=$HOME/esp-idf-v4.4

. ${IDF_PATH}/export.sh

# -DMICROPY_RLOTTIE=1
make -C ports/esp32 LV_CFLAGS="-DLV_COLOR_DEPTH=16" BOARD=GENERIC_S3_SPIRAM_OCT
