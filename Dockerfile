FROM archlinux:base

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm \
           patch \
           tmux \
           git \
           vim \
           neovim \
           lazygit \
           tree-sitter-cli \
           tree-sitter-vim \
           fzf \
           ripgrep \
           fd \
           luarocks \
           ast-grep

RUN touch /.jb_dev_container

