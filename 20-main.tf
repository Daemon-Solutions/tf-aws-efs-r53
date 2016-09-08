resource "aws_efs_file_system" "fs" {
  performance_mode = "${var.efs_performance}"

  tags {

    Name = "${var.prefix}-${var.name}"

  }
}

resource "aws_efs_mount_target" "mount_a" {
  file_system_id  = "${aws_efs_file_system.fs.id}"
  subnet_id       = "${element(split(",",var.subnets),0)}"
  security_groups = ["${split(",", var.security_groups)}"]
}

resource "aws_efs_mount_target" "mount_b" {
  file_system_id  = "${aws_efs_file_system.fs.id}"
  subnet_id       = "${element(split(",",var.subnets),1)}"
  security_groups = ["${split(",", var.security_groups)}"]
}

resource "aws_efs_mount_target" "mount_c" {
  file_system_id  = "${aws_efs_file_system.fs.id}"
  subnet_id       = "${element(split(",",var.subnets),2)}"
  security_groups = ["${split(",", var.security_groups)}"]
}

resource "aws_route53_record" "cname_a" {
  count   = "${var.create_cnames}"
  zone_id = "${var.r53_zone_id}"
  name    = "efs-${var.name}-${element(split(",",var.availability_zones),0)}.${var.r53_domain}"
  type    = "CNAME"
  ttl     = "86400"
  records = [ "${aws_efs_mount_target.mount_a.dns_name}" ]
}

resource "aws_route53_record" "cname_b" {
  count   = "${var.create_cnames}"
  zone_id = "${var.r53_zone_id}"
  name    = "efs-${var.name}-${element(split(",",var.availability_zones),1)}.${var.r53_domain}"
  type    = "CNAME"
  ttl     = "86400"
  records = [ "${aws_efs_mount_target.mount_b.dns_name}" ]
}

resource "aws_route53_record" "cname_c" {
  count   = "${var.create_cnames}"
  zone_id = "${var.r53_zone_id}"
  name    = "efs-${var.name}-${element(split(",",var.availability_zones),2)}.${var.r53_domain}"
  type    = "CNAME"
  ttl     = "86400"
  records = [ "${aws_efs_mount_target.mount_c.dns_name}" ]
}
