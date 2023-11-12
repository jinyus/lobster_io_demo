lobster_bin=$(which lobster)

if [ -z "$lobster_bin" ]; then
    echo "Error: Lobster binary not found in PATH."
    exit 1
fi

lobster_git_dir=$(dirname "$(dirname "$lobster_bin")")

current_directory=$(pwd)

cp -T . "$lobster_git_dir/demo_temp" -r --force &&
    cd "$lobster_git_dir" &&
    lobster --cpp demo_temp/demo.lobster &&
    cd dev &&
    cmake -DCMAKE_BUILD_TYPE=Release -DLOBSTER_ENGINE=OFF -DLOBSTER_TOCPP=ON && make -j8 &&
    cd "$current_directory" &&
    compiled_lobster
