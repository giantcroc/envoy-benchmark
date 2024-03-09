SUITE_DIR=./aes_boringssl_test
RESULT_BASE_DIR=$SUITE_DIR/results3

export ENVOY_CONFIG=./envoy-http-with-tls.yaml

#export LOAD_CPU_SET=44-49
#export LOAD_CONNECTIONS=1
#export LOAD_REQUEST_BODY_SIZE=4096000000
#export LOAD_REQUEST_METHOD=POST
#export LOAD_RPS=1
#export LOAD_DURATION=120
#export LOAD_CONCURRENCY=1
#export LOAD_MAX_REQUEST_PER_CONNECTION=1


export ENVOY_BIN=/home/sdp/aes_boringssl/envoy-static-origin
export LOAD_RPS=1000
export LOAD_DURATION=60
export LOAD_MAX_REQUEST_PER_CONNECTION=100
export ENVOY_CPU_SET=190 #46
export BACKEND_CPU_SET=35-42 #35-42
export LOAD_CPU_SET=24-31 #24-31
export ENVOY_CONCURRENCY=1

export BASE_DIR=$RESULT_BASE_DIR/origin
echo "Begin to test $rps rps"
bash ./benchmark-envoy.sh

#for rps in `seq 500 100 2500`; do
#    export LOAD_RPS=$rps
#    export BASE_DIR=$RESULT_BASE_DIR/${rps}_rps
#    echo "Begin to test $rps rps"
#    bash ./benchmark-envoy.sh
#done