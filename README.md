# selfsigner
Create self signed certs with CN and SANs set

## Sample call

This will create a **2048** bit RSA cert for the domain **example.com** which is valid for **365 days**

```docker run --rm -it -v `pwd`:/out pmjohann/selfsigner example.com 2048 365```
