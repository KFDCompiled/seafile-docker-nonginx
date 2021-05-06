server_version=8.0.3
maintainer?=kfdcompiled
image_prefix?=

pro_seafile_8.0_image=$(maintainer)/$(image_prefix)seafile-pro:$(server_version)

all:
	@echo
	@echo Please use '"make seafile-pro-8"'.
	@echo

seafile-pro-8:
	cd pro_seafile_8.0 && docker build -t $(pro_seafile_8.0_image) .
	docker tag $(pro_seafile_8.0_image_squashed) $(pro_seafile_8.0_image)
	docker rmi `docker images --filter "dangling=true" -q --no-trunc`

.PHONY: seafile-pro-8
