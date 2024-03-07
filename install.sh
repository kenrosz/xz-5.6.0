#!/usr/bin/env bash
set -e
prefix="$HOME/opt"
[[ -d "$prefix" ]] || mkdir -p "$prefix"
[[ -f xz.sums ]] || cat <<-EOF > xz.sums
    0f5c81f14171b74fcc9777d302304d964e63ffc2d7b634ef023a7249d9b5d875  xz-5.6.0.tar.gz
EOF
[[ -f xz-5.6.0.tar.gz ]] || curl -L --fail "https://github.com/tukaani-project/xz/releases/download/v5.6.0/xz-5.6.0.tar.gz" -o "./xz-5.6.0.tar.gz"
/usr/bin/shasum -a 256 -c xz.sums
tar -xvzf ./xz-5.6.0.tar.gz
cd xz-5.6.0
./configure --prefix="$prefix"
make check
make install
cd ..
rm -rf ./xz-5.6.0
