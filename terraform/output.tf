output "HygieiadevSG_id" {
  value = "${aws_security_group_HygieiadevSG.id}"
}

output "Hygieiadevamfam_public_ip" {
  value = "${aws_instance.Hygieiadevamfam.public_ip}"
}

output "Hygieiadevamfam_public_dns" {
  value = "${aws_instance.Hygieiadevamfam.public_dns}"
}

output "Hygieiadev_elb" {
  value = "${aws_elb.Hygieiadev.dns_name}"
}

output "Hygieiadev

