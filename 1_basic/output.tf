output "o1" {
     
     value = "hi"
}


output "instance_type_print1" {

value = aws_instance.os1.instance_type

  
}


output "instance_IP_print2" {

value = aws_instance.os1.public_ip

  
}


output "Instance_state_print3" {

value = aws_instance.os1.instance_state

  
}

output "instance_type_print4" {

value = aws_instance.os1.instance_type

  
}


output "instance_IP_print5" {

value = aws_instance.os1.public_ip

  
}


output "Instance_state_print6" {

value = aws_instance.os1.instance_state

  
}


output "Public_url" {
     value = "http://${aws_instance.os1.public_ip}/index.html"
  
}
