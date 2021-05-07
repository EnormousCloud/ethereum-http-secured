# ethereum-http-secured

Terraform plan for ethereum node with Basic Auth RPC protection

### Healthcheck

```
curl --user eth:eth -H"Content-Type: application/json" http://localhost/ --data '{"jsonrpc":"2.0","method":"net_version","params": [],"id":66}'
```

### License
MIT