#!/bin/bash
set -euo pipefail

declare -a A=(
	"1928/C"
	"1928/D"
	"1931/F"
	"1928/C"
	"1924/A"
	"1922/E"
	"1921/E"
	"1920/C"
	"1917/C"
	"1916/D"
	"1915/G"
	"1915/F"
	"1912/K"
	"1910/D"
)

[[ -d "$1" ]] || ( echo "Directory does not exist: $1" && exit 1 )

for a in "${A[@]}"; do
	wkhtmltopdf --quiet "https://codeforces.com/problemset/problem/$a" \
		"$1/$( echo $a | tr '/' '_').pdf"
done
