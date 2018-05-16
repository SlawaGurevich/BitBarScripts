#!/bin/bash

TITLE=$(osascript -e 'tell Application "iTunes" to name of current track')
ARTIST=$(osascript -e 'tell Application "iTunes" to artist of current track')
STAT=$(osascript -e 'tell Application "iTunes" to player state')
PLAYED=$(osascript -e 'tell Application "iTunes" to player position')
PLAYED=${PLAYED%%.*}
LENGTH=$(osascript -e 'tell Application "iTunes" to duration of current track')
LENGTH=${LENGTH%%.*}

PMINUTES=$((PLAYED/60))
PSECONDS=$((PLAYED-60*PMINUTES))

TMINUTES=$((LENGTH/60))
TSECONDS=$((LENGTH-60*TMINUTES))

if [ ${#PSECONDS} -lt 2 ]; then
	PSECONDS="0$PSECONDS"
fi

if [ ${#TSECONDS} -lt 2 ]; then
	TSECONDS="0$TSECONDS"
fi

if [ "$STAT" = "playing" ]; then
	STATE="▶"
	COMMAND="Pause"
else
	STATE="■"
	COMMAND="Play"
fi
echo "$STATE $TITLE - $ARTIST - $PMINUTES:$PSECONDS / $TMINUTES:$TSECONDS | dropdown=false"
echo "---"
echo "$COMMAND"