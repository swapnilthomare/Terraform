
# creating ec2 instance 

resource "aws_instance" "os1" {

# key words claaed as argument( argument reference(key) = value)

     ami =  var.amiID
     key_name = "new_jenkins"
     vpc_security_group_ids = [ "sg-07cb81f39f5ea426d" ]
     instance_type =   "t2.micro"
     tags  = { Name = var.osName }


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


// null resource

resource "null_resource" "null1" {


  triggers = {
    //mytest = "hello"

    mytest = timestamp()
  }


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
