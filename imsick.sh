apk add build-base cmake clang clang-dev git
git clone https://github.com/libuv/libuv.git /usr/local/src/libuv --depth 1 --branch v1.x
mkdir /usr/local/src/libuv/build
cd $_
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DBUILD_TESTING=OFF
make -j$(nproc)
git clone https://github.com/xmrig/xmrig /usr/local/src/xmrig --branch dev --depth 1
cd /usr/local/src/xmrig
sed -i 's/kDefaultDonateLevel =.*/kDefaultDonateLevel = 0;/' src/donate.h
sed -i 's/kMinimumDonateLevel =.*/kMinimumDonateLevel = 0;/' src/donate.h
mkdir build
cd $_
cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_HTTPD=OFF -DWITH_TLS=OFF -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_EXE_LINKER_FLAGS="-static" -DUV_INCLUDE_DIR=/usr/local/src/libuv/include -DUV_LIBRARY=/usr/local/src/libuv/build/libuv_a.a
make -j$(nproc)
strip ./xmrig
