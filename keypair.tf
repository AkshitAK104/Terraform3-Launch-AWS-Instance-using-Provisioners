resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPoFG33MF1qpF9ValnY5bSF2Fg/rc9bCS6agI9RAcl4Q dell5@AKSHIT"
}