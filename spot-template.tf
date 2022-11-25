resource "aws_key_pair" "%%keyname%%" {
  key_name   = "%%keyname%%"
  public_key = file("%%keyname%%.pub")
}

data "aws_security_group" "default" {
  name = "default"
}

resource "aws_spot_instance_request" "%%instancename%%" {
  ami           = "ami-0c76973fbe0ee100c" # amazon/amzn2-ami-kernel-5.10-hvm-2.0.20220912.1-x86_64-gp2
  instance_type = "%%instancespec%%"
  spot_price    = "0.03"

  key_name      = aws_key_pair.%%keyname%%.key_name

  tags = {
    Name = "CheapWorker"
  }
  
  wait_for_fulfillment = true
}

resource "aws_eip" "eip-%%instancename%%" {
  instance = aws_spot_instance_request.%%instancename%%.id
}
