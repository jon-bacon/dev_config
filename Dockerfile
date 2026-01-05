FROM archlinux:base

RUN pacman -Suy --noconfirm && \
    pacman -S --noconfirm \
           ast-grep \
           clang \
           fd \
           fzf \
           git \
           lazygit \
           luarocks \
           neovim \
           openssh \
           patch \
           python \
           python-pip \
           ripgrep \
           tmux \
           tree-sitter-cli \
           tree-sitter-vim \
           vim \
           wget

RUN touch /.jb_dev_container

