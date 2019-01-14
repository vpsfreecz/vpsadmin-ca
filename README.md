# VpsAdmin CA
Tools for generating a certificate authority for vpsAdmin cluster and then
issue signed certificates for nodes.

## Usage
```bash
# See and optionally edit ./config

# Enter nix shell, which includes openssl and sources ./config
$ nix-shell

# Generate CA
$ ./setup.sh

# Generate and sign node certificates
$ ./add-node.sh node1.prg.vpsfree.cz
```
