BASE_DIR := .

.PHONY: fmt
.DEFAULT_GOAL := fmt

ifeq ($(OS),Windows_NT)
DIRS := $(patsubst $(shell CHDIR )\\%,%,$(shell DIR /A:D /B /S $(BASE_DIR)))
else
DIRS := $(shell find $(BASE_DIR) -type d -not -path '*/\.*')
endif

fmt:
	for d in ${DIRS}; do terraform fmt $$d ; done

init:
	terraform init -input=false
	#terraform init -input=false -backend-config=environment/dev/state.tfvars

plan: init fmt
	terraform plan -input=false -var-file=environments/dev/variables.tfvars

apply: plan
	terraform apply -auto-approve -parallelism=1 -input=false -var-file=environment/dev/variables.tfvars