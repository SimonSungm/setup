# Setup
Setup my Ubuntu from scratch.

## Usage
### Note
You may need to setup your own proxy before running the script.
The script has being tested on Azure with Linux (Ubuntu 20.04).

### Docker
```bash
git clone https://github.com/SimonSungm/setup.git
cd setup
sudo docker build -t my-ubuntu .

# After build finish
sudo docker run -it my-ubuntu
su cliff
zsh
```

### Host
```bash
git clone https://github.com/SimonSungm/setup.git
cd setup/build
./setup.sh

# After build finish, a user named cliff 
# with root privilege would be created with
# everything being set up.
```

## Feature
1. create a new user with root privilege
2. set up tools include: [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh), [LunarVim](https://github.com/LunarVim/LunarVim)


