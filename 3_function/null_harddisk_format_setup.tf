resource "null_resource" "hardisknull1" {

    provisioner "local-exec" {
    command = "echo 'hello'"
  }


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Swapnil Thomare/Downloads/new_jenkins.pem")
    host     = aws_instance.os1.public_ip
  }



provisioner "remote-exec" {
    inline = [
      "sudo mkfs.ext4 /dev/xvdh",
      "sudo mount /dev/xvdh  /var/www/html ",
      
    ]
  }

# meta arrguments
depends_on = [
  aws_volume_attachment.my_ebs_attach_ec2


]
  
}