pragma solidity ^0.4.22;

contract Coinflip {
    address private manager;

    // GAS LIMIT default
    // GAS PRICE default 1 GWEI
    // value 0 eth
    constructor () public {
        manager = msg.sender;
    }

    //  GAS LIMIT default gas must be > 23368. 24000 worked. now suggested 33121 worked. 
    //  GAS PRICE default 1 GWEI
    // value 0.1 eth
    function enter(bool playerGuessHeads) public payable {
        require(address(this).balance >= .02 ether);
        require(msg.value >= .01 ether);
        
        bool coinflipResults = randomHeadsOrTails() == 0;
        //bool coinflipResults = true;
        
        if(playerGuessHeads == coinflipResults){
            //msg.sender.transfer(address(this).balance);
            msg.sender.transfer(.02 ether);
        }
    }

    function randomHeadsOrTails() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, now, address(this).balance))) % 2;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function() public payable {
        // i accept free money you send my way
    }
}
