terraform {

required_version = "~>1.4.4"

  required_providers {
    myawscloud = {
      source  = "hashicorp/aws"
      version = "~> 4.61.0"
    }
  }
}

# Configure the AWS Provider

provider "myawscloud" {
  region     = "ap-south-1"
 
  profile = "default"  
  //access_key = "AKIAXBAVDE4KL5EXP3SL"
  //secret_key = "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"
}
#variable


variable "amiID" {
  default = "ami-0376ec8eacdf70aae"
}

variable "osName" {
  default = "next"
}

# creating ec2 instance 

resource "aws_instance" "os1" {

# key words claaed as argument( argument reference(key) = value)

     ami =  var.amiID
     key_name = "new_jenkins"
     vpc_security_group_ids = [ "sg-07cb81f39f5ea426d" ]
     instance_type =   "t2.micro"
     tags  = { Name = var.osName }


connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Swapnil Thomare/Downloads/new_jenkins.pem")
    host     = aws_instance.os1.public_ip
  }



provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo touch /var/www/html/index.html",
      "sudo systemctl enable httpd --now"
    ]
  }


}



output "o1" {
     
     value = "hi"
}


output "instance_type_print" {

value = aws_instance.os1.instance_type

  
}


output "instance_IP_print" {

value = aws_instance.os1.public_ip

  
}


output "Instance_state_print" {

value = aws_instance.os1.instance_state

  
}


resource "aws_ebs_volume" "myvol1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 1

  tags = {
    "Name" = "MYwebvol1"
  }
  
}

resource "aws_volume_attachment" "my_ebs_attach_ec2" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.myvol1.id
  instance_id =  aws_instance.os1.id
  
}

