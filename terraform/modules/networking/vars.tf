
#VPC Variables
variable "vpc_cidr_block" {default = "192.168.0.0/16"}
variable "instance_tenancy" {default = "default"}
variable "env" {default = "dev"}

#Availability Zones
variable "az_1" {default = "us-east-1a"}
variable "az_2" {default = "us-east-1b"}

#Subnets Variables
variable "cidr_public_subnet_1" {default = "192.168.0.0/18"}
variable "cidr_public_subnet_2" {default = "192.168.64.0/18"}
variable "cidr_private_subnet_1" {default = "192.168.128.0/18"}
variable "cidr_private_subnet_2" {default = "192.168.192.0/18"}

#Route Table
variable "open_cidr" {default = "0.0.0.0/0"}