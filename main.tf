resource "aws_instance" "jenkins-server" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t2.micro"

  tags = {
    Name = "JenkinsServer"
  }
}
