#!/usr/bin/env sh

# 同步vim配置
curl https://raw.githubusercontent.com/hiber-niu/vim/master/.vimrc --output
~/.vimrc

# 同步zsh配置

sudo apt-get install fonts-powerline
sudo apt-get install 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "export ZSH=~/.oh-my-zsh" > ~/.zshrc
echo 'ZSH_THEME="angoster"' >> ~/.zshrc
echo "plugins=(" >> ~/.zshrc
echo "  git" >> ~/.zshrc
echo "  z" >> ~/.zshrc
echo "  autojump" >> ~/.zshrc
echo "  extract" >> ~/.zshrc
echo "  pip" >> ~/.zshrc
echo "  python" >> ~/.zshrc
echo "  zsh-syntax-highlighting" >> ~/.zshrc
echo "  zsh-history-substring-search" >> ~/.zshrc
echo "  zsh-autosuggestions" >> ~/.zshrc
echo "  vscode" >> ~/.zshrc
echo ")" >> ~/.zshrc
echo "" >> ~/.zshrc
echo "source $ZSH/oh-my-zsh.sh" >> ~/.zshrc
echo "bindkey -M emacs '^P' history-substring-search-up" >> ~/.zshrc
echo "bindkey -M emacs '^N' history-substring-search-down" >> ~/.zshrc
echo "bindkey ',' autosuggest-accept" >> ~/.zshrc
echo "setopt no_nomatch" >> ~/.zshrc


# 设置豆瓣源
mkdir -p ~/.pip
echo -e "[global]\ntimeout=60\nindex-url=https://pypi.doubanio.com/simple" > ~/.pip/pip.conf
