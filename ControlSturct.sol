// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error AfterHours(uint timeProvided);

contract ControlStructures {

    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } 
        else if (_number % 3 == 0) {
            return "Fizz";
        } 
        else if (_number % 5 == 0) {
            return "Buzz";
        } 
        else {
            return "Splat";
        }
    }

    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Jika _time >= 2400, trigger panic (internal error)
        if (_time >= 2400) {
            assert(_time < 2400); 
        }

        // Jika _time > 2200 atau < 800, revert dengan custom error
        if (_time > 2200 || _time < 800) {
            revert AfterHours({ timeProvided: _time });
        }
        
        // Jika _time di antara 1200 dan 1259, revert dengan pesan
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        
        // Cek kondisi waktu lainnya
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }
        
        // Ini adalah fallback jika tidak ada kondisi yang terpenuhi,
        // meskipun logika di atas seharusnya sudah mencakup semua kemungkinan.
        return "";
    }
}