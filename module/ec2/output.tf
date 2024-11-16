output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = aws_instance.jenkins_sonarqube_ec2[*].id
}


output "security_group_id" {
  description = "The ID of the attached security group"
  value       = data.aws_security_group.existing_sg.id
}
