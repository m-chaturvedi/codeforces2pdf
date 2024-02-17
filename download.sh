#!/bin/bash
set -euo pipefail

declare -a A=(
	"1928_C"
	"1928_D"
	"1931_F"
	"1928_C"
	"1924_A"
	"1922_E"
	"1921_E"
	"1920_C"
	"1917_C"
	"1916_D"
	"1915_G"
	"1915_F"
	"1912_K"
	"1910_D"
)

[[ -d "$1" ]] || ( echo "Directory does not exist: $1" && exit 1 )

for a in "${A[@]}"; do
	wkhtmltopdf --quiet "https://codeforces.com/problemset/problem/$( echo $a | tr '_' '/')" \
		"$1/$a"
done

CURRENT_DIR=$PWD
pushd "$1"
	pdftk ${A[@]} cat output ${CURRENT_DIR}/concatenated_1.pdf
popd
