read -p "Comment out next line if you are sure you want to run this."
exit

# set system keyboard to Canadian English
# Download latest iterm2 from https://www.iterm2.com/downloads.html
# Download latest XCode (full install, not just command line tools)

sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# dot files
mkdir -p ~/projects
cd ~/projects
git clone https://github.com/lucaspolonio/dotfiles.git
cd ~
ln ~/projects/dotfiles/.* .

brew update

# install rbenv, latest MRI versions and bundler
brew install rbenv
rbenv install 2.4.1
rbenv install 2.4.1
rbenv install 2.5
gem install bundler

# python virtualenv
pip install virtualenv

# git, yarn, etc, etc
brew install git
brew install hub
brew install yarn
brew install tree
brew install fpp
brew install the_silver_searcher
brew install fzf
brew install slate
brew install readline
brew install wrk
brew install adr-tools
brew install fd
brew install bat

brew tap aykamko/tag-ag
brew install tag-ag

# mvim, vundle and vim plugins
brew install macvim --with-override-system-vim
brew link --overwrite macvim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# compile command-t
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin/ruby extconf.rb
make


# install slate
cd /Applications && curl http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz | tar -xz
# TODO: open slate.app

# High sierra workaround for cURL error `LibreSSL SSL_connect: SSL_ERROR_SYSCALL`
#https://github.com/libressl-portable/portable/issues/369#issuecomment-364188373
# brew install libressl
# brew install curl
# echo 'export PATH="/usr/local/opt/curl/bin:$PATH"' >> ~/.zshrc



# Go to iTerm Preferences → Profiles, select your profile, then the Keys tab. Click Load Preset... and choose Natural Text Editing.
# set color to solarized dark, “reuse previous session’s directory”
# set font to 14pt “Liberation Mono for Powerline”, anti-aliased

