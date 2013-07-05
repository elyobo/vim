# Installation

```
# Go home
cd ~
# Backup old .vim
mv .vim .vim-old
mv .vimrc .vimrc-old
# Install new .vim
git clone https://github.com/elyobo/vim.git .vim
ln -s ~/.vim/vimrc ~/.vimrc
cd .vim
git submodule update --init
```

# Plugins

Plugins are managed with Pathogen.  It's recommended to use git submodules, but you can check out the plugin git source into ~/.vim/bundles, open vim and run :Helpfiles to build all docs.

# Structure

* bundle/   - Plugins
* colors/   - Additional colour schemes
* ftplugin/ - Any custom configuration by detected file type, just add <filetype>.vim and it's loaded.
* syntax/   - Additional syntax files
