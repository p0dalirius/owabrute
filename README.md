# Outlook Web Application credentials bruteforcer

Hydra wrapper for bruteforcing Microsoft Outlook Web Application.

## Dependencies

This script is based on `hydra`. You can install it with :

```
apt install hydra
```

## Usage

```
bash$ ./owabruter.sh -h
Usage : ./owabruter.sh
      -d DOMAIN    : Target domain. Example : remote.targethost.co.uk
      -u USERSLIST : Path to wordlist of users to test
      -p PASSLIST  : Path to wordlist of passwords to test
```

## Examples

Usage example against a test domain `test.domain.net` with `./users.txt` and `./passwords.txt` wordlists :

```
./owabruter.sh -d test.domain.net -u ./users.txt -p ./passwords.txt
```

If the files cannot be accessed, you will have a message indicating `Could not access ressource` :

```
bash$ ./owabruter.sh -d test.domain.net -u ./users.txt -p ./passwords.txt

 ██████╗ ██╗    ██╗ █████╗     ██████╗ ██████╗ ██╗   ██╗████████╗███████╗
██╔═══██╗██║    ██║██╔══██╗    ██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝
██║   ██║██║ █╗ ██║███████║    ██████╔╝██████╔╝██║   ██║   ██║   █████╗
██║   ██║██║███╗██║██╔══██║    ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝
╚██████╔╝╚███╔███╔╝██║  ██║    ██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗
 ╚═════╝  ╚══╝╚══╝ ╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝

Hydra wrapper for bruteforcing Microsoft OWA.

DOMAIN    : test.domain.net
USERSLIST : ./users.txt
PASSLIST  : ./passwords.txt (Could not access ressource)

[WARN] Some resources could not be accessed. Aborting...
```

## Additional references
 - https://stedotmartin.wordpress.com/2014/05/13/bruteforce-microsoft-exchange-2013-owa-with-hydra/
