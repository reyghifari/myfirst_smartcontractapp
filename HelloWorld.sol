// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;

    // Constructor: dijalankan sekali saat contract pertama kali di-deploy
    constructor() {
        message = "Hello, World!";
    }

        // Fungsi untuk membaca pesan (otomatis sudah ada dari string public)
    function getMessage() public view returns (string memory) {
        return message;
    }

    // Fungsi untuk mengubah pesan
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }

}