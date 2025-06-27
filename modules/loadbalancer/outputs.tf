output "alb_dns_name" {
  value       = aws_lb.web.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "alb_arn" {
  value       = aws_lb.web.arn
  description = "The ARN of the Application Load Balancer"
}

output "target_group_arn" {
  value       = aws_lb_target_group.web.arn
  description = "The ARN of the Target Group"
}