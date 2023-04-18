variable "x" {

    default = 5
  
}

output "your_answer_1_is" {

  value = "hi"
  
}

output "your_answer_2_is" {

  value = var.x
  
}

output "your_answer_3_is" {
## string interpolation
  value = "hello number  ${var.x} lest go"
  
}

