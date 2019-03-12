#
# Ansible-Managed Dotfiles Makefile
# Winston Astrachan, 2019
#
SHELL=/bin/bash

.PHONY: help
help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo ""
	@echo "Ansible-Managed Dotfiles Makefile"
	@echo ""
	@echo "Commands:"
	@echo "  local             Apply 'dev' dotfiles to localhost as current user"
	@echo "  server            Apply 'server' dotfiles to a remote host"
	@echo "  dev               Apply 'dev' dotfiles to a remote host"
	@echo ""
	@echo "  vault             Open the Ansible vault for editing in '$$EDITOR'"
	@echo ""

.vault_password:
	@echo ""
	@echo "Creating .vault_password file."
	@echo ""
	@echo " Supply the password for the Ansible Vault,"
	@echo " it will be saved in this file, and used on repeated runs:"
	@read -s VAULTPASSWORD; \
	echo "$$VAULTPASSWORD" > .vault_password;
	@echo ""

.PHONY: local
local: .vault_password
	@ansible-playbook \
		--connection=local \
		--inventory=127.0.0.1, \
		--tags=dev, \
		site.yml

.PHONY: server
server: .vault_password
	@echo "Enter remote host to deploy server dotfiles to:"
	@read REMOTE_HOST; \
	ansible-playbook \
		--inventory=$$REMOTE_HOST, \
		--tags=server, \
		site.yml

.PHONY: dev
dev: .vault_password
	@echo "Enter remote host to deploy dev dotfiles to:"
	@read REMOTE_HOST; \
	ansible-playbook \
		--inventory=$$REMOTE_HOST, \
		--tags=dev, \
		site.yml

.PHONY: vault
vault: .vault_password
	@ansible-vault edit group_vars/vault.yml
