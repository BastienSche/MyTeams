#!bin/sh

# pyConan=($(python3 -m pip list | grep conan))
# if [[ "${#pyConan}" == 0 ]]; then
#     echo "Waiting for Conan install.."
#     python3 -m pip install conan
#     conan config set general.revisions_enabled=1
#     conan remote add conancenter https://center.conan.io
#     conan remote add bincrafters https://bincrafters.jfrog.io/artifactory/api/conan/public-conan
# fi

# sudo rm -rf ./build

mkdir -p build
cd build

# if [[ "${#pyConan}" == 0 ]]; then
conan install .. --build missing
# fi

# echo "Run CMake and make binary"
# qtPath=($(sudo find /usr -name qt@6 | grep Cellar))
qtPath=($(sudo find /usr -name qt@6 | grep Cellar))
cmake .. -DCMAKE_PREFIX_PATH=${qtPath}/6.2.3

cd .. 