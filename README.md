# eth-dapp-coinflip

* define a schedule when the contract will flip the coin. every hour or based on block number. every 30bocks (30 * 20sec = 600sec = roughly 5min)
* enter the coinflip drawing - each player decides HEADS or TAILS
* player pays some fee to enter, there is a minimum and no maximum
* player stake in the game determines how much he can win (winning ETH proportional to ETH stake) 

* send all my funds to Contract 0x3d63f568d937d7a40be9da2b784f2f72d4cd555b  i kept losing

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
    
    function() payable {
        // i accept free money you send my way
    }
}
