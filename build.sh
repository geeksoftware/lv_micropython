#!/usr/bin/env bash

make -C ports/esp32 LV_CFLAGS="-DLV_COLOR_DEPTH=16" BOARD=GENERIC_S3_SPIRAM_OCT
