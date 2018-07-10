# eth-dapp-coinflip

## initial discution we had on July 9th 

* multiplayer
* define a schedule when the contract will flip the coin. every hour or based on block number. every 30bocks (30 * 20sec = 600sec = roughly 5min)
* player enter the coinflip drawing and decides HEADS or TAILS and sends a minimum 0.01 ETH (no maximum)
* player stake in the game determines how much he can win (winning ETH proportional to ETH stake) (implement MAYBE later v2)

## my current solution v0.1

* i faced the following challenge: infinite loop when i want to send funds to the winners
* i faced the following challenge: the contract cannot schedule itself and draw the winner after some block, it has to be triggered by a method call
* i faced the following challenge: the contract after deployment has no funds to send to a winner. the contract should be able to receive funds
* one player calls enter function in order to play and gives as parameter true=heads or false=tails and sends at least 0.01 eth AND THEN the contract will define right away if the player wins (you can check the contract balance or your own balance) IF the player wins he will receive 0.02 eth

### v0.1 TESTS on Rinkeby

* i mostly always pick heads = true
* i sent 1.8 eth on rinkeby to Contract 0x3d63f568d937d7a40be9da2b784f2f72d4cd555b  i kept losing
* current contract balance is 900,000,000,000,000,000 wei == 0.9 eth
