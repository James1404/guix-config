system:
	sudo guix system reconfigure config.scm

init:
	cp channels.scm ~/.config/guix/
	guix pull
