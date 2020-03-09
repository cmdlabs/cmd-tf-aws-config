RELEASE_VERSION = 0.3.0

ifdef CI
	PROFILE_REQUIRED=profile
endif

docs: .env
	docker-compose run --rm terraform-utils terraform-docs markdown document . > README.md
PHONY: docs

format: .env
	docker-compose run --rm terraform-utils terraform fmt -recursive .
PHONY: format

formatCheck: .env
	docker-compose run --rm terraform-utils terraform fmt -recursive -check -diff .
PHONY: formatCheck

lint: .env
	@echo "not implemented yet"
PHONY: lint

init: .env $(PROFILE_REQUIRED)
	docker-compose run --rm terraform-utils terraform init tests
PHONY: init

plan: .env $(PROFILE_REQUIRED) init
	docker-compose run --rm terraform-utils terraform plan tests
PHONY: plan

apply: .env $(PROFILE_REQUIRED) init
	docker-compose run --rm terraform-utils terraform apply -auto-approve tests
PHONY: apply

destroy: .env $(PROFILE_REQUIRED) init
	docker-compose run --rm terraform-utils terraform destroy -auto-approve tests
PHONY: destroy

tag:
	git tag $(RELEASE_VERSION)
	git push origin $(RELEASE_VERSION)
PHONY: tag

profile: .env
	docker-compose run --rm envvars ensure --tags profile
	docker-compose run --rm aws sh -c 'aws configure set credential_source Ec2InstanceMetadata --profile $${AWS_PROFILE_NAME}'
	docker-compose run --rm aws sh -c 'aws configure set role_arn arn:aws:iam::$${AWS_ACCOUNT_ID}:role/$${AWS_ROLE_NAME} --profile $${AWS_PROFILE_NAME}'
	docker-compose run --rm aws aws configure set credential_source Ec2InstanceMetadata --profile cmdlabtf-tfbackend
	docker-compose run --rm aws aws configure set role_arn arn:aws:iam::471871437096:role/gitlab_runner --profile cmdlabtf-tfbackend

.env:
	touch .env
	docker-compose run --rm envvars validate
	docker-compose run --rm envvars envfile --overwrite
