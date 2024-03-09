W_BIN=$WRK_BIN
if [ LOAD_CLIENT = "wrk2" ]; then
    W_BIN=$WRK2_BIN
fi
LOAD_TARGET=${LOAD_TARGET:=https://127.0.0.1:13333/}

taskset -c $LOAD_CPU_SET $W_BIN -t $LOAD_CONCURRENCY -c $LOAD_CONNECTIONS -d ${LOAD_DURATION}s --latency --timeout 10s -H "Connection: close" $LOAD_TARGET > ${BASE_DIR}/wrk.result

