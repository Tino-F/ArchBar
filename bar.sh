#!/bin/bash

BACKGROUND=#161616
FOREGROUND=#FFFFFF

Clock() {
	DATETIME=$(date "+%a %b %d, %T")

	echo -n "$DATETIME "
}

Battery() {
	BATPERC="$(acpi | cut -d, -f2 | sed 's/.\{1\}$//' | sed 's/^.\{,1\}//')"
	LINE=$(acpi -a)
	PIC="\uF244"

	if [ "$LINE" = "Adapter 0: on-line" ]; then
		PIC="\uF240"
	else
		if [[ "$BATPERC" -gt 15 ]]; then
			PIC="\uF243"
		fi

		if [[ "$BATPERC" -gt 35 ]]; then
			PIC="\uF242"
		fi

		if [[ "$BATPERC" -gt 65 ]]; then
			PIC="\uF241"
		fi

		if [[ "$BATPERC" -gt 80 ]]; then
			PIC="\uF240"
		fi
	fi

	echo -e " $PIC $BATPERC %"
}

Focus() {
	TITLE=$(xtitle)

	echo "$TITLE"
}

Firefox() {
	echo -e "%{A:firefox:} \uF269 %{A}"
}

Chrome() {
	echo -e "%{A:chromium:} \uF268 %{A}"
}

Electrum() {
	echo -e "%{A:electrum:} \uF15A %{A}"
}


Blender() {
	echo -e "%{A:blender:} \uF1B2 %{A}"
}

Atom() {
	echo -e "%{A:atom:} \uF121 %{A}"
}

Terminal() {
	echo -e "%{A:urxvt:} \uF120 %{A}"
}

PhotoEditor() {
	echo -e "%{A:krita:} \uF1FC %{A}"
}
	
while true; do
	echo "%{B$BACKGROUND} %{F$FOREGROUND} %{l} $(Terminal) $(Atom) $(Firefox) $(Chrome) $(Electrum) $(PhotoEditor) $(Blender) %{c} $(Focus) %{r} $(Clock) $(Battery) %{F-}%{B-}"
	sleep 1
done
