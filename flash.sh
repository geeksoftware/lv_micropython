#!/usr/bin/env bash

function do_work() {
    cd ports/esp32
    SERIAL_PORT=`ls /dev/cu.usbmodem* 2>/dev/null`
    if [[ -z "$SERIAL_PORT" ]]; then
        echo "No esp32 serial port detected, exit.";
        return;
    else
        echo "Detected serial port : $SERIAL_PORT"
    fi

    # esptool.py --chip esp32s3 --port ${SERIAL_PORT} erase_flash
    esptool.py -p ${SERIAL_PORT} -b 460800 --before default_reset --after hard_reset --chip esp32s3 write_flash --flash_mode dio --flash_size detect --flash_freq 80m 0x0 build-GENERIC_S3_SPIRAM_OCT/bootloader/bootloader.bin 0x8000 build-GENERIC_S3_SPIRAM_OCT/partition_table/partition-table.bin 0x10000 build-GENERIC_S3_SPIRAM_OCT/micropython.bin
    cd -
}

do_work
