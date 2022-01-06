env = "dev"
vpc_cidr       =  "10.11.0.0/16"
subn_private   = ["10.11.1.0/24", "10.11.2.0/24"]
subn_public    = ["10.11.101.0/24", "10.11.102.0/24"]
cluster_version=  "1.17" 
target_port = "80"
port1 = "8080"
desired_capacity = 2
max_size  = 2
min_size = 2
instance_types = "t2.micro"
##Prueba2
container_name = "containertachira"
service_name = "service-tachira"
type_service = "LoadBalancer"
image = "nginx:1.7.9"
namespace = "side1"
node_group_name = "ng_name"
default_components = ["source-controller", "kustomize-controller", "notification-controller"]
target_path = "/overlays"
github_owner = "catd87"
repo_provider = "github"


##test12222322ss22www