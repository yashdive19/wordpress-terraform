output "wordpress_url" {
  value = "http://${aws_instance.wp.public_ip}/wordpress"
}
