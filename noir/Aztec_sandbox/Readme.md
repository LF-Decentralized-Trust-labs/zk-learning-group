# Zero knowledge learning (ZK) group

## A learning group dedicated to zero knowledge (ZK) and SNARK application development

## Aztec sandbox environment

https://docs.aztec.network/developers/getting_started

# Install sandbox (docker): 
bash -i <(curl -s https://install.aztec.network)

# add /home/dsz/.aztec/bin to the path if missing

export PATH="/home/dsz/.aztec/bin:$PATH"

# start sandbox

aztec start --sandbox

# import test account

aztec-wallet import-test-accounts

# create an account

aztec-wallet create-account -a my-wallet --payment method=fee_juice,feePayer=test0

# deploy contract

aztec-wallet deploy TokenContractArtifact --from accounts:test0 --args accounts:test0 TestToken TST 18 -a testtoken

# mint public tokens

aztec-wallet send mint_to_public --from accounts:test0 --contract-address contracts:testtoken --args accounts:test0 100

# check balance

aztec-wallet simulate balance_of_public --from test0 --contract-address testtoken --args accounts:test0

# move tokens from private to public state

aztec-wallet send transfer_to_private --from accounts:test0 --contract-address testtoken --args accounts:test0 25

# check balance

aztec-wallet simulate balance_of_public --from test0 --contract-address testtoken --args accounts:test0

# check private

aztec-wallet simulate balance_of_private --from test0 --contract-address testtoken --args accounts:test0















