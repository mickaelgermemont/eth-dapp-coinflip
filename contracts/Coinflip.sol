pragma solidity ^0.4.22;

contract Coinflip {
    address public manager;
    address[] public playersHeads;
    address[] public playersTails;

    constructor () public {
        manager = msg.sender;
    }

    function enter(bool heads) public payable {
        require(msg.value > .01 ether);
        if(heads){
            playersHeads.push(msg.sender);
        } else {
            playersTails.push(msg.sender);
        }
    }

    function computeReward(uint numberOfWinners, uint _balance) private pure returns (uint) {
        // balance is a wei amount
        uint reward = uint(_balance / numberOfWinners);
        return reward;
    }

    function randomHeadsOrTails() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, now, playersHeads.length, playersTails.length))) % 2;
    }

    function pickWinner() public restricted {
        require( (playersHeads.length + playersTails.length) > 0 );
        
        bool heads = randomHeadsOrTails() == 0;

        address[] memory winners;
        if(heads){
            winners = playersHeads;
        } else {
            winners = playersTails;
        }

        uint reward = computeReward(winners.length, address(this).balance);

        for (uint i=0; i<winners.length; i++) {
            winners[i].transfer(reward);
        }

        // reset
        playersHeads = new address[](0);
        playersTails = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getPlayersTails() public restricted view returns (address[]) {
        return playersTails;
    }

    function getPlayersHeads() public restricted view returns (address[]) {
        return playersHeads;
    }

    function getRewardStack() public view returns (uint) {
        return address(this).balance;
    }
}
