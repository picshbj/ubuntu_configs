# Step 1
Install following componnts:
zsh
oh-my-zsh
spaceship
fzf
tmux
mosh
colorls
(Optional) Nerd Fonts

# Step 2
Download this files

# Step 3
move files
init.vim -> ~/.config/nvim/init.vim
.tmux.conf -> ~/.tmux.conf
.zshrc -> ~/.zshrc

# Step 4-1
Install plugins for oh-my-zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zdharma/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/wbingli/zsh-wakatime.git

# Step 4-2
Install plugins for neovim
:PlugInstall




