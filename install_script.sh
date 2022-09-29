git clone https://github.com/dtk9289/dotfiles.git ~/.config

sudo add-apt-repository ppa:neovim-ppa/unstable -y

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

sudo apt update
sudo apt install neovim fish nodejs npm yarn build-essential

cp ~/.config/.bashrc ~/.config/.tmux.conf ~/.config/.tmux.conf.local ~/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=~/.local/share/omf --config=~/.config/omf

sudo npm install -g @fsouza/prettierd corepack eslint ls_emmet tree-sitter-cli typescript-language-server typescript vscode-langservers-extracted
