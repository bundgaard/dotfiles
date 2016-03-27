LN=ln
LN_OPTS=-svf

.DEFAULT_TARGET: install

.PHONY: all
all: install

.PHONY: install
install:
	install -m 0664 ~/dotfiles/Vim/vimrc ~/.vimrc
	install -m 0664 ~/dotfiles/Shell/bashrc ~/.bashrc
	install -m 0644 ~/dotfiles/Git/gitconfig ~/.gitconfig
	install -m 0644 ~/dotfiles/Shell/Screenrc ~/.screenrc
	@test -d ~/.vim || mkdir -p ~/.vim/ \
	mkdir -p ~/.vim/autoload \
	mkdir -p ~/.vim/bundle
	@test -e ~/.vim/autoload/pathogen.vim || curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

.PHONY: vim
vim:
	@$(LN) $(LN_OPTS) ~/dotfiles/Vim/vimrc ~/.vimrc

.PHONY: bash
bash:
	@$(LN) $(LN_OPTS) ~/dotfiles/Shell/bashrc ~/.bashrc

.PHONY: git
git:
	@$(LN) $(LN_OPTS) ~/dotfiles/Git/gitconfig ~/.gitconfig
