public_ips=$(terraform output -json public_ip)
echo "$public_ips" > host-inventory