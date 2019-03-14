Ansible-Managed Dotfiles
========================

Your dotfiles make your shell your home, and everybody should have a dotfiles repo. This one is mine: it's powered by Ansible and it's public-- as I've picked up many tricks and tips from other dotfiles repos, hopefully I'll contribute something back.

## Features
- [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- gitconfig & global gitignore
- tmux config
- vim config & [vundle](https://github.com/VundleVim/Vundle.vim) plugins
- [pyenv](https://github.com/pyenv/pyenv) & [pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv) plugin
- gpg key import
- ssh config

## Quickstart Guide

#### Requirements
Since this project uses Ansible to do the heavy lifting, Python and Ansible are required. There is a `Makefile` for convenience, so you'll need GNU Make to take advantage of that. With the exception of Ansible, everything you need should ship on *most* \*nix distros. This project has been significantly tested only in Arch Linux, Ubuntu, and MacOS.


Use your distro's package manager to install Python if you do not have it. Then use `pip` (or `easy_install`) [to install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), and you're ready to run.


#### Cloning this Repository

If you are cloning this project and making it your own, there is one additional step you'll need to take before you use this for the first time. This project uses Ansible vault to store things that you don't want the internet to see (like your email address), so you'll need to replace the vault with one keyed to your password.

```shell
rm -f group_vars/vault.yml
ansible-vault create group_vars/vault.yml
```


#### Using this Repository

If you've made it this far, congratulations! You've completed the only two steps you need to complete manually. If you'd like to install the full suite of dotfiles in your home folder, run the following:

```shell
make local
```

To install to a remote host:
```shell
make server
>> Enter remote host to deploy server dotfiles to:
[username@]domain.com[:<ssh_port>]
```

Obviously the dotfiles installed would be mine at this point, and might not suit your needs. Read on into the **Extended Guide** for details on the philosophy of this repo, project layout, and making it your own.


## Extended Guide

#### Design Philosophy
My dotfiles repo was created with a couple of constants in mind:

1. I want to be able to take my dotfiles with me wherever I go, not just my personal computers.
2. I don't want my full development toolchain with me on hosts that are not my own.
3. I don't want to maintain two sets of dotfiles for "development" hosts and "server" hosts.
4. I don't want a bunch of tooling on remote hosts just to manage dotfiles. I should be able to have my dotfiles without needing to install things.

With this in mind, I have set this repo up with two types of hosts: **local** and **remote**, and two types of roles: **dev** and **server**.

To divide certain files (and tasks) between **dev** and **server** hosts, tasks are marked with labels, as appropriate. This allows me to hold certain files back from a full **dev** deployment like pyenv, while still installing tmux configuration.


#### Project Layout
The general directory structure of this project is as follows:
```shell
.
├── files
│   ├── tmuxinator
│   └── zshrc.d
├── group_vars
│   ├── all.yml
│   └── vault.yml
├── roles
│   ├── git
│   ├── pyenv
│   ├── tmux
│   ├── vim
│   └── zsh
└── site.yml
```
I'll call your attention to a few important directories:

| Path | Details
|------|--------
| `files/` | All dotfiles and dotfile templates are stored here for ease of access. There are some subdirectories by purpose, but in general, if it lives directly in `$HOME`, it lives in the top level of `files`
| `files/zshrc.d/` | The `.zshrc` file has been broken into files by section. These files are selectivley copied to `.zshrc.d` on the target host. All files in the `.zshrc.d` directory on the host are loaded when the shell starts.
| `group_vars/all.yml` | Variables used in templates can be defined here, and they will override any defaults that have been set in `roles`.
| `group_vars/private.yml` | This is the location of the Ansible vault, which is effectively an encrypted Yaml file used to supplement `group_vars/all.yml` when the playbook executes.
| `roles/` | The Ansible tasks used to set up a host are stored here, divided by their general purpose, or what program they set up.


#### The Makefile
As mentioned, a `Makefile` is included to make common repetitive tasks easier. I encourage you to look at the makefile and understand what each target does before using it.

At the time of writing, the `Makefile` contains the following targets. An up-to-date version can be retrieved with `make help`.

```makefile
Usage: make COMMAND

Ansible-Managed Dotfiles Makefile

Commands:
  local             Apply 'dev' dotfiles to localhost as current user
  server            Apply 'server' dotfiles to a remote host
  dev               Apply 'dev' dotfiles to a remote host

  vault-open        Open the Ansible vault for editing in 'vim'
  vault-decrypt     Decrypt the Ansible Vault in-place
  vault-encrypt     Re-encrypt the Ansible Vault
```


## License
The content of this project itself is licensed under the [MIT License](LICENSE).

I've borrowed bits and pieces of my dotfiles from various projects that I've found helpful over the years. All included code carries it's original license, and my gratitude to the creators for their contribution to the open-source communitiy.
