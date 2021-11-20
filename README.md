# Brownie Template

A simple brownie framework template to learn building smart contract with solidity and python.

![Example](https://i.imgur.com/pYE36eP.gif)

## Installation

- Install the brownie via pip:
  ```sh
  pip install eth-brownie
  ```
- Clone this repo
- Add a new account
  ```
  brownie accounts new test
  ```
- Run tests (`./test/test_example.py`)
  ```
  brownie test
  ```
- Run the deploy script for check if it works
  ```
  brownie run ./scripts/deploy.py
  ```
- Deploy to the Testnet / Mainnet with [Infura](https://infura.io/)
  - Create a new account in Infura and go to the dashboard
  - Click "New Project" ![Infura1](https://i.imgur.com/teiGXjx.png)
  - Select ethereum and give your project a name ![Infura2](https://i.imgur.com/aVlwjLU.png)
  - Copy your project id and paste to the `.env` file ![Infura3](https://i.imgur.com/ixsJCeW.png) ![Infura4](https://i.imgur.com/iImNHWb.png)
  - Deploy the project with
    ```
    brownie run ./scripts/deploy.py --network <network>
    ```