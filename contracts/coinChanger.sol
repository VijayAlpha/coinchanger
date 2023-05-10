//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract CoinChanger {
    uint constant QUARTER = 25;
    uint constant DIME = 10;
    uint constant NICKEL = 5;
    uint constant PENNY = 1;

    function changeReturn(
        uint amountDue,
        uint amountPaid
    ) public pure returns (uint[] memory) {
        require(
            amountDue <= amountPaid,
            "Amount paid must be greater or equal to amount due."
        );

        uint changeDue = amountPaid - amountDue;
        uint[] memory coinsNeeded = new uint[](4);

        coinsNeeded[0] = changeDue / QUARTER;
        changeDue = changeDue % QUARTER;

        coinsNeeded[1] = changeDue / DIME;
        changeDue = changeDue % DIME;

        coinsNeeded[2] = changeDue / NICKEL;
        changeDue = changeDue % NICKEL;

        coinsNeeded[3] = changeDue / PENNY;

        return coinsNeeded;
    }
}
