# Certificate commands

Show cert dates:

```bash
openssl x509 -in cert.pem -noout -subject -issuer -dates
```

Show SANs:

```bash
openssl x509 -in cert.pem -noout -text | sed -n '/Subject Alternative Name/,+1p'
```

Check remote TLS cert:

```bash
openssl s_client -connect example.com:443 -servername example.com </dev/null 2>/dev/null \
  | openssl x509 -noout -subject -issuer -dates
```
