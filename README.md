![](./.github/banner.png)

<p align="center">
  Hydra wrapper for bruteforcing Microsoft Outlook Web Application.
  <br>
  <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/p0dalirius/owabrute">
  <a href="https://twitter.com/intent/follow?screen_name=podalirius_" title="Follow"><img src="https://img.shields.io/twitter/follow/podalirius_?label=Podalirius&style=social"></a>
  <a href="https://www.youtube.com/c/Podalirius_?sub_confirmation=1" title="Subscribe"><img alt="YouTube Channel Subscribers" src="https://img.shields.io/youtube/channel/subscribers/UCF_x5O7CSfr82AfNVTKOv_A?style=social"></a>
  <br>
</p>

## Dependencies

This script is based on `hydra`. You can install it with :

```
apt install hydra
```

## Usage

```
bash$ ./owabrute.sh -h
Usage : ./owabrute.sh
      -d DOMAIN    : Target domain. Example : remote.targethost.co.uk
      -u USERSLIST : Path to wordlist of users to test
      -p PASSLIST  : Path to wordlist of passwords to test
```

## Examples

Usage example against a test domain `test.domain.net` with `./users.txt` and `./passwords.txt` wordlists :

```
./owabrute.sh -d test.domain.net -u ./users.txt -p ./passwords.txt
```

If the files cannot be accessed, you will have a message indicating `Could not access ressource` :

```
bash$ ./owabrute.sh -d test.domain.net -u ./users.txt -p ./passwords.txt

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
