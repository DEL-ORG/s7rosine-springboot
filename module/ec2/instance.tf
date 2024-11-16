

# EC2 Instances
resource "aws_instance" "jenkins_sonarqube_ec2" {
  count = 2
  ami   = var.ami_id
  key_name = var.key_name

# Attach the existing security group
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

# Set instance type based on count.index
  instance_type = count.index == 0 ? "t2.medium" : "t2.micro"

  # Associate instance with specific subnet
  subnet_id = data.aws_subnet.subnet_01.id


# Reference scripts for user data based on instance index
 user_data = <<-EOF
               #!/bin/bash
               ${
                 count.index == 0 ? 
                 "${file("${path.module}/script/jenkins-master.sh")}\n${file("${path.module}/script/docker-sonarqube.sh")}" :
                 file("${path.module}/script/jenkins-slave.sh")
               }
   EOF


  # Tags
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-ec2", var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"])
#     },
#   )
# }
  })
}