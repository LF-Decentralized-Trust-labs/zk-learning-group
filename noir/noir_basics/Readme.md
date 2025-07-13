# Simple Noir example

### Install Noir

# installation guide: 
https://noir-lang.org/docs/getting_started/quick_start

# install Noir

curl -L https://raw.githubusercontent.com/noir-lang/noirup/refs/heads/main/install | bash
noirup

# install backend / bartenberg proover

curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/master/barretenberg/bbup/install | bash
bbup

# new nargo project

nargo new noir_basics

# create inputs in the Prover.toml file

cd noir_basics
nargo check

# create witness

nargo execute

# prove with Bartenberg

# Generate proof and save proof and public_inputs to ./target
bb prove -b ./target/noir_basics.json -w ./target/noir_basics.gz -o ./target




