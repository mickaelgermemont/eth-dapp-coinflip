# eth-dapp-coinflip

# initial discution we had on July 9th 

* multiplayer
* define a schedule when the contract will flip the coin. every hour or based on block number. every 30bocks (30 * 20sec = 600sec = roughly 5min)
* player enter the coinflip drawing and decides HEADS or TAILS and sends a minimum 0.01 ETH (no maximum)
* player stake in the game determines how much he can win (winning ETH proportional to ETH stake) (implement MAYBE later v2)

# my current solution v0.1

* one player calls enter function and contract defines right away if the player wins
* i faced the following challenge: infinite loop when i want to send funds to the winners

## v0.1 TESTS on Rinkeby

* i mostly always pick heads = true
* i sent 1.8 eth on rinkeby to Contract 0x3d63f568d937d7a40be9da2b784f2f72d4cd555b  i kept losing
* current contract balance is 900,000,000,000,000,000 wei == 0.9 eth
