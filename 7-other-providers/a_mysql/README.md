# Note
* MySQL provider stuff doesn't work as it's  
  * Reason: It's declaration depends on another provider
  * Steps
    * Comment all part of the code related to the provider
    * `terraform plan` 
    * `terraform apply`
    * Uncomment
    * `terraform init`
* docker-compose.yml
  * Run docker image in case that ou don't have mysql