<h1 align="center"> Mersenne Prime Blocks</h1>  
Let's celebrate the longevity of the blockchain technology with collectible cards inspired by a class of rare prime numbers called Mersenne primes.
Mersenne primes are in the form of `M = 2 <sup>P</sup> - 1` where the `P` itself is a prime number. There are only 51 Mersenne primes in existence with the first few ones being:  3, 7, 31, 127, ... .  

## wen |\\/|
The idea is to peg the `P` value of the Mersenne prime formula to the block numbers of the Binance smart chain(testnet though) and let the users collect any card whose `P` is >= most recent block mined. As an example, One can claim the first Mersenne prime block card once the block number `2` is mined. The cards are rare both in space and in time. Only 51 cards are available, with the last card being available to claim at late May, 2028(once block `82,589,933`is mined).  
The price of each card is chosen as to make it available for everyone, so each card is available to claim for `P` szabos(1e12 wei units).  
The smart contract lives at address `0x802ee77358ff4dcc993d9d193d8dd511411362d1`.  

## Attributes  
The cards have got the following attributes:  
- The hardware used to find the Mersenne prime  
- Discovered by whom?
- The year the number is discovered

## Build  
- Contracts
  `cd contracts`  
  `npx truffle migrate --network testnet`  
- UI  
  `cd ui`  
  `yarn build` for prod or `yarn dev` for local testing  

## Demo
[Live demo](https://siasky.net/_A0KyWspY3dK9E-QiCM4S-v1uSJZ22en7cvvb6Vbi4hG5g/)  

Video:  
<p align="center">

[![Watch the demo](https://img.youtube.com/vi/ap9jBFzb6nE/maxresdefault.jpg)](https://www.youtube.com/watch?v=ap9jBFzb6nE)
</p> 

## Acknoledgements
Powered by Binance and Gitcoin.

## Licenense
MIT
