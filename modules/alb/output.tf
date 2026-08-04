
# DNS name declaration
output "alb_dns_name" {
  value = aws_lb.alb.dns_name
}

# AWS ARN 
output "alb_arn" {
  value = aws_lb.alb.arn
}