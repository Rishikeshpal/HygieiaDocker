#-------------------------------------------------
#Security Group
#-------------------------------------------------

resource "aws_security_group" "HygieiadevSG" {
  name = "Hygieiadev-SG"
  description = "security group for ec2 & Elb"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/8"]
  }
}

#------------------------------------------------
#Amazon linux2 machine
#------------------------------------------------

resource "aws_instance" "Hygieiadevamfam" {
  ami = "${var.ami}"
  availability_zone = "${var.availability_zone.primary}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.Hygieiadev-SG.name}"]
  user_data              = "${file("userdata.sh")}"
}

#-------------------------------------------------
#Hygieia ELB
#-------------------------------------------------

resource "aws_elb" "Hygieiadev" {
  name = "HygieiaDevElb"
  availability_zones = ["${var.availability_zone.primary}","${var.availability_zone.secondary}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
  instances = ["${aws_instance.Hygieiadevamfam.id}"]
}



#--------------------------------------------------
#Hygieia Route53 Type: A
#--------------------------------------------------

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name = "www.hygieiadev.example.org"
  type = "A"
  ttl = "300"
  records = ["${aws_elb.Hygieiadev.dns_name}"]
}


