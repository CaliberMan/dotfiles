# Functions
function run() {
    autoreconf --install && ./configure && make check
}

function debug() {
    make clean && make debug
}

function pp() { 
    ~/scripts/ppush.sh "$1" "$2"
}

function enter() {
    mkdir "$1" && cd "$1"
}

function untar() {
    tar -xf "$1" && rm -rf "$1"
}

function connect() {
    num=1
    while [ "$num" -ne 0 ]; do
        nmcli device wifi connect 'Galaxy A52s 5G5925' password dtbq4516
        num=$?
    done
}
