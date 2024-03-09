#!/bin/bash
set -e
set -x

BASE_DIR=${BASE_DIR:=./}
LOAD_CPU_SET=${LOAD_CPU_SET:=0-47}
LOAD_CONNECTIONS=${LOAD_CONNECTIONS:=64}
LOAD_DURATION=${LOAD_DURATION:=60}
LOAD_CONCURRENCY=${LOAD_CONCURRENCY:=8}
LOAD_TARGET=${LOAD_TARGET:=https://127.0.0.1:13333/}
LOAD_REQUEST_BODY_SIZE=${LOAD_REQUEST_BODY_SIZE:=0}
LOAD_REQUEST_METHOD=${LOAD_REQUEST_METHOD:=GET}
LOAD_MAX_REQUEST_PER_CONNECTION=${LOAD_MAX_REQUEST_PER_CONNECTION:=4294937295}

LOAD_TRANSPORT_OPT=${LOAD_TRANSPORT_OPT:=}
LOAD_OTHER_OPT=${LOAD_OTHER_OPT:=}

FORTIO_CLIENT=${FORTIO_CLIENT:=/home/xhj/go/bin/fortio}

# payload_sizes=(1 4 16 64 256 1024)
payload_sizes=(1 1)
for i in ${payload_sizes[*]};
do
  taskset -c $LOAD_CPU_SET $FORTIO_CLIENT load -httpbufferkb 102400 \
    -qps 0 -timeout 10s -c $LOAD_CONNECTIONS -gomaxprocs 192 -k -t ${LOAD_DURATION}s -keepalive=False -payload-file "./payloads/${i}k" $LOAD_OTHER_OPT $LOAD_TARGET 2> ${BASE_DIR}/fortio_result${i}k.result
done

#  taskset -c $LOAD_CPU_SET $FORTIO_CLIENT load -httpbufferkb 40960 \
#     -qps 0 -timeout 10s -c $LOAD_CONNECTIONS -k -t ${LOAD_DURATION}s $LOAD_OTHER_OPT $LOAD_TARGET 2> ${BASE_DIR}/fortio_result.result
