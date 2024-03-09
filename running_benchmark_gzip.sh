SUITE_DIR=./cert_compression
RESULT_BASE_DIR=$SUITE_DIR/results64

export ENVOY_CONFIG=./envoy-http-tls-gzip-cert-compression.yaml

#export LOAD_CPU_SET=44-49
#export LOAD_CONNECTIONS=1
#export LOAD_REQUEST_BODY_SIZE=4096000000
#export LOAD_REQUEST_METHOD=POST
#export LOAD_RPS=1
#export LOAD_DURATION=120
#export LOAD_CONCURRENCY=1
#export LOAD_MAX_REQUEST_PER_CONNECTION=1

export WRK_BIN=/home/sdp/wrk/wrk-gzip
export ENVOY_BIN=/home/sdp/cert_compression/envoy-static-all-compressor
export LOAD_CLIENT="wrk"
export LOAD_CONCURRENCY=8
export LOAD_CONNECTIONS=64
export LOAD_DURATION=60
export ENVOY_CPU_SET=190 #46
export BACKEND_CPU_SET=35-42 #35-42
export LOAD_CPU_SET=24-31 #24-31
export ENVOY_CONCURRENCY=1

export BASE_DIR=$RESULT_BASE_DIR/gzip
echo "Begin to test $rps rps"
bash ./benchmark-envoy.sh

#for rps in `seq 500 100 2500`; do
#    export LOAD_RPS=$rps
#    export BASE_DIR=$RESULT_BASE_DIR/${rps}_rps
#    echo "Begin to test $rps rps"
#    bash ./benchmark-envoy.sh
#done