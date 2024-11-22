#!/bin/bash

function formatBackupPath() {
	echo "$@" | tr / -
}
