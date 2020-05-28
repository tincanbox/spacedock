Designed for `caravan`, portable my dotfiles.


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




# Running

## First run

### Basic initiation

```
docker run -itd --name spacedock space/dock
```

### running as ssh server (Do NOT use with an image with SSH key included)

```
docker run --privileged -itd -p 2222:22 --name spacedock space/dock
```


## Running from control script

Supported Commands

- build
- run
- login

Windows

```
cat .\control\launch | iex
```

Linux

```
./control/launch
```

## Reusing containers

```
docker restart spacedock
```
