BASE_DIR := .

.PHONY: fmt
.DEFAULT_GOAL := fmt

fmt:
	terraform validate
	terraform fmt -recursive -diff

init:
	terraform init -input=false
	#terraform init -input=false -backend-config=environment/dev/state.tfvars

plan: init fmt
	terraform plan -input=false -var-file=environments/dev/variables.tfvars

apply: plan
	terraform apply -auto-approve -parallelism=1 -input=false -var-file=environment/dev/variables.tfvars