# Root outputs. I HTTP-only-varianten (utan Route53) är ALB:ns DNS-namn
# adressen du använder för att nå Gatus i webbläsaren.
output "alb-dns-name" {
  description = "Public DNS name of the ALB — open this in your browser (http://)"
  value       = module.alb.alb-dns-name
}