#!/bin/bash

# Find the line number where G6 is defined as USB-Audio
LINE=$(grep -n "\[G6" /proc/asound/cards | grep "USB-Audio" | cut -d: -f1)

if [ -n "$LINE" ]; then
    # Directly extract the card number from the matching line
    CARD_ID=$(sed -n "${LINE}p" /proc/asound/cards | awk '{print $1}')

    echo "Sound BlasterX G6 found on card $CARD_ID"
    amixer -c "$CARD_ID" sset 'PCM Capture Source' 'External Mic'
else
    echo "Sound BlasterX G6 not found!"
fi