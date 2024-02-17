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

declare -a B=(
	1910_C
	1910_B
	1907_F
	1907_E
	1906_M
	1904_D2
	1904_D1
	1903_D1
	1901_D
	1899_F
	1898_C
	1898_B
	1896_D
	1893_B
	1891_C
)

declare -a C=(
	1889_B
	1886_C
	1884_C
	1883_E
	1883_D
	1882_C
	1881_F
	1881_E
	1879_D
	1878_D
	1876_B
	1875_D
	1873_H
	1873_G
	1872_F
)

declare -a D=(
	1872_E
	1870_D
	1868_B1
	1867_D
	1864_D
	1862_F
	1862_E
	1861_D
	1861_C
	1859_D
	1858_B
	1857_F
	1857_E
	1856_E1
	1856_C
)

declare -a E=(
	1852_B
	1852_A
	1851_F
	1851_E
	1850_H
	1850_G
	1849_D
	1849_C
	1848_C
	1846_F
	1846_E2
	1845_D
	1843_F1
	1843_E
	1842_C
)

declare -a F=(
	1841_C
	1840_E
	1835_A
	1833_G
	1833_F
	1833_E
	1829_H
	1829_G
	1826_D
	1824_B1
	1822_G1
	1822_F
	1822_E
	1817_A
	1814_C
)

declare -a G=(
	1814_B
	1811_E
	1811_D
	1810_D
	1809_D
	1809_C
	1807_F
	1806_C
	1805_D
	1804_C
	1801_B
	1801_A
	1800_E2
)

[[ -d "$1" ]] || (echo "Directory does not exist: $1" && exit 1)

for a in "${A[@]}"; do
	wkhtmltopdf --quiet "https://codeforces.com/problemset/problem/$(echo $a | tr '_' '/')" \
		"$1/$a"
done

CURRENT_DIR=$PWD
pushd "$1"
pdftk ${A[@]} cat output ${CURRENT_DIR}/concatenated_1.pdf
popd
