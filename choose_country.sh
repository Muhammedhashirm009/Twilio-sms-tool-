#!/bin/bash

choose_country() {
    echo "Select country code"
    echo "1. India"
    echo "2. USA"
    read -p "Enter option: " country_option
    case $country_option in
        1)
            country_code="+91"
            ;;
        2)
            country_code="+1"
            ;;
        *)
            echo "Invalid option"
            choose_country
            ;;
    esac
}
