#!/bin/bash -x

# Generate and store a wallet password
if [ ! -f ~/.accountpassword ]; then
    echo `date +%s | sha256sum | base64 | head -c 32` > ~/.accountpassword
fi

if [ ! -f ~/.primaryaccount ]; then
    geth --testnet --password ~/.accountpassword account new > ~/.primaryaccount
fi

geth --rpc --datadir "/root" --rpcaddr "0.0.0.0" --rpccorsdomain "*" --testnet --unlock 0 --password ~/.accountpassword --mine --minerthreads 1 --extradata "Kunstmaan"
