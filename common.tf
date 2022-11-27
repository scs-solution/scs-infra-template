resource "aws_key_pair" "%%keyname%%" {
  key_name   = "%%keyname%%"
  public_key = file("%%keyname%%.pub")
}

data "aws_security_group" "default" {
  name = "default"
}
