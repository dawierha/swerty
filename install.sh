#!/bin/sh

# Files to modify
symbols="test/se" #"/usr/share/X11/xkb/symbols/se"
evdev_xml="test/evedv.xml" #"/usr/share/X11/xkb/rules/evdev.xml"
evdev_lst="test/evdev.lst" #"/usr/share/X11/xkb/rules/evdev.lst"

# Text to add
swerty_variant="        <variant>
          <configItem>
            <name>swerty</name>
            <description>Swerty</description>
          </configItem>
        </variant>"
swert_variant_lst="  swerty          se: Swerty"

#Check root priviligies
if [ "$USER" != "root" ]
then
    echo "This script needs root priviligies"
    exit 2
fi


# Append contents of se.txt to the end of $symbols
cat ./se.txt >> $symbols


# Add variant block to $evdev_xml
line_number=$(grep -n "<name>se</name>" "${evdev_xml}" | cut -d':' -f1)
insert_line=1
tail -n +$line_number "${evdev_xml}" | while IFS= read -r line; do
    echo "Processing line: $line"
    insert_line+=1
    if [ $line == "<variantList>" ]; then
        sed -i "${insert_line}i${swerty_variant}" "${evdev_xml}"
    fi
done


# Add swerty as a keyboard option to $evdev_lst
line_number_lst=$(grep -n "! variant" "${evdev_lst}" | cut -d':' -f1)
sed -i "${line_number_lst+1}i${swerty_variant_lst}" "${evdev_lst}"
