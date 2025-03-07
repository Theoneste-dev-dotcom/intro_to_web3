// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract SimpleStorage {
    struct User {
        string name;
        string secretCode;
        uint storedValue;
    }

    mapping(address => User) private users;
    string private message = "Hello World!!!!!";

    function setUser(string memory _name, string memory _secretCode) public {
        users[msg.sender] = User({
            name: _name,
            secretCode: _secretCode,
            storedValue: 0
        });
    }

    function getUser()
        public
        view
        returns (string memory, string memory, uint, address)
    {
        User memory user = users[msg.sender];
        return (user.name, user.secretCode, user.storedValue, msg.sender);
    }

    function printHelloWorld() public view returns (string memory) {
        return message;
    }

    function calculate(
        uint num1,
        uint num2,
        string memory operation
    ) public returns (uint) {
        User storage user = users[msg.sender];
        require(bytes(user.name).length > 0, "User not registered");

        if (keccak256(bytes(operation)) == keccak256(bytes("addition"))) {
            user.storedValue = num1 + num2;
        } else if (
            keccak256(bytes(operation)) == keccak256(bytes("multiplication"))
        ) {
            user.storedValue = num1 * num2;
        } else if (
            keccak256(bytes(operation)) == keccak256(bytes("subtraction"))
        ) {
            user.storedValue = num1 - num2;
        } else if (
            keccak256(bytes(operation)) == keccak256(bytes("division"))
        ) {
            require(num2 != 0, "Cannot devide by zero");
            user.storedValue = num1 / num2;
        } else {
            revert("Invalid Operation");
        }

        return user.storedValue;
    }
}
