// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    string private data;
    string private name;
    string private message = "Hello World!!!!";

    function setData(string memory _data) public {
        data = _data;
    }

    function getData() public view returns (string memory) {
        return data;
    }

    function printHelloWorld()  public view returns (string memory) {
       return  message;
    }

    function setName(string memory _newName) public {
        name = _newName;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    
}
