resource "aws_instance" "jenkins-server" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"

  tags = {
    Name = "JenkinsServer"
  }
}
