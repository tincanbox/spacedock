# Spacedock

This package includes minimum dev environment with node, python, zsh for `me`.

After all requisities installation (includes vim-plugins),  
launched container takes about `1.62GB` from your disk.
Maybe you want enough:8~10GB disk-space with the working instance.

Total estimated installation time is 20-30 minutes or so.
(even with `slow` 2Mb/download environment)



## Requisities

- docker
- docker-compose


## Includes

- node (with `n stable` version: v12 now 2020-06)
- python3 (vanilla)
- zsh + prezto
- neovim (with `pynvim`)

  
  

# Usage


## Default Info

Default user is `pilot` and is added to sudoer group.  
If you want wheel group, do it yourself after login.

    DEFAULT_GROUP= crew
    DEFAULT_GID= 5000
    DEFAULT_USER= pilot
    DEFAULT_UID= 5050
    DEFAULT_PASSWORD= "password"

## Install

At first, pull the repo.
(your ~ dir is recommended)

    git clone https://github.com/tincanbox/spacedock.git
    cd spacedock

After cloning, prepare your .env file

    cp .env.default .env
    vim .env (Just edit your .env)


Then build your image. (...linux teminal or MINGW is recommended.)

    docker-compose build


This will take 10~20 mins to complete. *up to your internets connection speed.
  
After installation is completed, enter your zsh environment.  
Or if you have Docker GUI app, Just login to CLI interface and hit `zsh`.

At first access of `zsh` shell, nvim setup will be started immediately.
This will take few minutes.

    docker-compose exec zsh


Also, you may need to setup neovim plugins manually (like YCM)

## Build base image manually.

```
docker build --no-cache --build-arg INCUBATOR_VER=$(date +%s) -t space/dock .
```

Add --no-cache if you want to force-rebuild.


