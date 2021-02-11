<h1 align="center"> Mersenne Prime Blocks</h1>  
Let's celebrate the longevity of the blockchain technology with mathematically crafted collectible cards inspired by a rare class of prime numbers called [Mersenne](https://www.mersenne.org/) primes.
Mersenne primes are in the form of **M = 2 <sup>P</sup> - 1** where the P is itself a prime number. There are only 51 Mersenne primes in existence with the first few ones being:  3, 7, 31, 127, ... .  

## wen |\\/|
The idea is to peg the `P` value of the Mersenne prime formula to the block numbers of the Binance smart chain(testnet though) and let the users collect any card whose `P` is >= most recent block mined. As an example, One can claim the first Mersenne prime block card once the block number `2` is mined. The cards are rare both in space and in time. Only 51 cards are available, with the last card being available to claim at late May, 2028(once block `82,589,933`is mined).  

## Attributes  
The cards have got the attributes:  
- The hardware used to find the Mersenne prime  
- Discovered by whom?
- The year the number is discovered
<p align="center">

[![Watch the demo](https://img.youtube.com/vi/j3546bj08Vk/maxresdefault.jpg)](https://www.youtube.com/watch?v=j3546bj08Vk)
</p> 

## Build  
- Contracts
  `cd contracts`  
  `npx truffle migrate --network testnet`  
- UI  
  `cd ui`  
  `yarn build` for prod or `yarn dev` for local testing  

## Acknoledgements
Powered by Binance and Gitcoin.

## Licenense
MIT
