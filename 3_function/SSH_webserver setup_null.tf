resource "null_resource" "null1" {


  triggers = {

    mytest = timestamp()
  }


  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("C:/Users/Swapnil Thomare/Downloads/new_jenkins.pem")
    host     = aws_instance.os1.public_ip
  }



provisioner "remote-exec" {
    on_failure = continue
    inline = [
      "sudo yum install httpd -y",
      "sudo sh -c 'echo welcometo lw  >   /var/www/html/index.html' ",
      "sudo systemctl enable httpd --now"
    ]
  }

# meta arrguments
depends_on = [
  aws_instance.os1

]
  
}