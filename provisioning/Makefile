help:
	@cat Makefile

default: help

prerun:
	brew install ansible

run:
	HOMEBREW_CASK_OPTS="--appdir=/Applications" \
	ansible-playbook -i hosts -vv provisioning.yml \
	--ask-become-pass