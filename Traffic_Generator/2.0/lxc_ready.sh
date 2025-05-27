#!/bin/sh

while [ $# -gt 0 ]; do
    case $1 in
    no_access_check)
        NO_ACCESS_CHECK=yes
        ;;
    legacy_ready_check)
        LEGACY_READY_CHECK=yes
        ;;
    *)
        echo "ERROR: unknown option \"$1\"" >&2
        ;;
    esac
    shift
done

if [ "${LEGACY_READY_CHECK}" = yes ]; then
    offline=true
    while $offline; do
    _STATUS="$(systemctl status multi-user.target -o json-pretty -n1)"
    echo "${NAME} ${_STATUS}"
    echo "${_STATUS}" | grep "RESULT" | grep -q done
    _IS_DONE=$?
    echo "${_STATUS}" | grep -q -e "Active:\s*active"
    _IS_ACTIVE=$?
    if [ ${_IS_DONE} -eq 0 ] && [ ${_IS_ACTIVE} -eq 0 ]; then
        echo "${NAME} system is ready for postinst"
        offline=false
    elif [ ${_IS_DONE} -ne 0 ] && [ ${_IS_ACTIVE} -eq 0 ]; then
        echo "${NAME} system is active but not ready"
    else
            echo $NAME + " is not ready for postinst"
            sleep 1m
    fi
    done
fi

if [ "${NO_ACCESS_CHECK}" != "yes" ]; then
    # Wait for internet access
    offline=true
    while $offline; do
    # ping 8.8.8.8 because for unknown reason, even when network
    # is up with a valid resolv.conf, ping fails to resolve while
    # in a new shell it succeed
    echo -n ${NAME} && ping -c 1 8.8.8.8 && offline=false || (echo $NAME + " No internet access" && sleep 1m)
    done
fi