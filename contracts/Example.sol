// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Example {
    // User struct
    struct User {
        string name;
        uint8 age;
    }

    // Initialize contract owner
    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    // Simple modifier to check if function executed by owner
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    // This variable contains all of the users
    User[] public users;

    // Add a new user
    function addUser(string memory n, uint8 a) public onlyOwner {
        users.push(User(n, a));
    }

    // Delete an user by name
    function deleteUser(string memory n) public onlyOwner returns (bool) {
        int256 userIndex = findUserIndex(n);

        if (userIndex != -1) {
            delete users[uint256(userIndex)];
            return true;
        }

        return false;
    }

    // Update an user's age by name
    function updateUserAge(string memory n, uint8 newa) public {
        int256 userIndex = findUserIndex(n);

        if (userIndex != -1) {
            users[uint256(userIndex)].age = newa;
        }
    }

    // Update an user's name by old name
    function updateUserName(string memory n, string memory newn) public {
        int256 userIndex = findUserIndex(n);

        if (userIndex != -1) {
            users[uint256(userIndex)].name = newn;
        }
    }

    // Check if contains the user by name
    function hasUser(string memory n) public view returns (bool) {
        return findUserIndex(n) != -1;
    }

    // Find the user's index by name
    function findUserIndex(string memory n) public view returns (int256) {
        for (uint256 i = 0; i < users.length; i++) {
            if (
                keccak256(abi.encodePacked(users[i].name)) ==
                keccak256(abi.encodePacked(n))
            ) {
                return int256(i);
            }
        }

        return -1;
    }

    // Get user's age by name
    function getUserAge(string memory n) public view returns (uint8) {
        int256 userIndex = findUserIndex(n);

        if (userIndex != -1) {
            return users[uint256(userIndex)].age;
        }

        return 0;
    }

    // Reset the user list
    function resetUsers() public onlyOwner {
        delete users;
    }
}
