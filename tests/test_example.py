# "Example" import is ./contracts/Example.sol file
from brownie import accounts, Example


def test_deploy():
    main_account = accounts[0]

    # Deploy the contract
    example = Example.deploy({
        "from": main_account
    })

    # Calling functions from solidity
    # Add a new user
    example.addUser("aiocat", 16, {
        "from": main_account
    })

    # Check if user exists
    assert example.hasUser("aiocat") == True


def test_owner():
    main_account = accounts[0]
    normal_account = accounts[1]

    # Deploy the contract
    example = Example.deploy({
        "from": main_account
    })

    # Calling functions from solidity
    # Try adding a new user with normal account
    try:
        example.addUser("aiocat", 16, {
            "from": normal_account
        })
    except Exception:
        # Check if user not exists
        assert example.hasUser("aiocat") == False
