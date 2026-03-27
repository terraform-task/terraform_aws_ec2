module "ec2" {
    source = "./ec2"
    
    instance_type = "t3.micro"
    aws_region    = "ap-south-1"
    security_group_name = "my-security-group"
    ssh_cidr_blocks = ["0.0.0.0/0"]
    http_cidr_blocks = ["0.0.0.0/0"]
    key_name      = "terraformec2"
    vpc_cidr        = "10.0.0.0/16"
    public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
    cluster_name = "my-ec2"
    
}