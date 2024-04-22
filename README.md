# Terraform Challenge Lab GSP345

## Step 2

These are the steps I took to complete step #2. Step #2 is about setup up terraform and then taking control of existing pre-configured project resources being two compute engine instances.

### Setup files and modules
touch main.tf
touch variables.tf
mkdir -p modules/instances
mkdir -p modules/storage
touch modules/instances/instances.tf
touch modules/instances/outputs.tf
touch modules/instances/variables.tf
touch modules/storage/storage.tf
touch modules/storage/outputs.tf
touch modules/storage/variables.tf

### Set region and zone
export REGION=<>
export ZONE=<>

### initialize terraform
terraform init

### Get information about the existing compute instances
gcloud compute instances list
gcloud compute instances describe tf-instance-1 --zone $ZONE
gcloud compute instances describe tf-instance-2 --zone $ZONE
gcloud compute disks describe tf-instance-1 --zone $ZONE
gcloud compute disks describe tf-instance-2 --zone $ZONE

### Import existing instances into my terraform config after updating variables.tf, main.tf and instances.tf 
terraform import module.instances.google_compute_instance.tf-instance-1 tf-instance-1
terraform import module.instances.google_compute_instance.tf-instance-2 tf-instance-2

### Run terraform plan and check for errors
terraform plan

### After errors are cleaned up, apply and take control over existing instances
terraform apply

### Other helper commands
gcloud compute images list > images.txt
