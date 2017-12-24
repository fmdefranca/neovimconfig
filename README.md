# Nevim Config Notes

### Install vim-plug
Run in terminal
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
### Can also install powerline Fonts - to use NovaMono
```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
***
# need to add python and node must install files

### Installing zsh
```bash
sudo apt install zsh
chsh -s $(which zsh)
```
### Install oh-my-zsh using curl
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
