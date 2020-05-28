Docker definition file for caravan


# Includes

- node
- python3
- zsh + prezto
- neovim




# Build base image

```
docker build --build-arg INCUBATOR_VER=$(date +%s) -t space/dock .
```

Add --no-cache if you want to force-rebuild.




# Usage

## Install

```
git clone https://github.com/tincanbox/spacedock.git
cd spacedock
./control/build
```

This will take 10~20 mins to complete.


## Running from control script

Supported Commands are,

- build
- launch (run or restart)
- login


### Linux

```
./control/launch
```


### Windows (MINGW is recommended for all commands.)

```
cat .\control\launch | iex
```
