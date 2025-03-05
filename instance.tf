resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = "deployer-key"
  vpc_security_group_ids = [aws_security_group.dov-sg.id]
  availability_zone      = var.zone1

  tags = {
    Name    = "dove-web"
    project = "dove"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  connection {
    type        = "ssh"
    user        = var.webuser
    private_key = file("deployer-key")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]

  }
}
resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state       = "running"

}