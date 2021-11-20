# "Example" import is ./contracts/Example.sol file
from brownie import accounts, Example, network

# A helper function to get main account


def get_main_account():
    if network.show_active() == "development":
        return accounts[0]
    else:
        return accounts.load("test")


# Get main account to use
main_account = get_main_account()


def use_contract(contract):
    # Calling functions from solidity
    # Add a new user
    contract.addUser("aiocat", 16, {
        "from": main_account
    })

    # Check if user exists
    print(contract.hasUser("aiocat"))

    # Delete the user
    contract.deleteUser("aiocat", {
        "from": main_account
    })

    # Check if user exists
    print(contract.hasUser("aiocat"))


def main():
    # Deploy the contract
    example = Example.deploy({
        "from": main_account
    })

    # Use the contract
    use_contract(example)
