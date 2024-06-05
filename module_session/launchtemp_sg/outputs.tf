output "sgid" {
    value = aws_security_group.tfsg.id  
}

output "lt_id" {
    value = aws_launch_template.lt.id
}

output "lt_version" {
    value = aws_launch_template.lt.latest_version
}