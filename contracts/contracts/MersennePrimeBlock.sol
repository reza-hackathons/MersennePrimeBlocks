// contracts/MersennePrimeBlock.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

// Remix: replace 
//        "@openzeppelin/" with
//        "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.3.0/"
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MersennePrimeBlock is ERC721, Ownable {
  
  struct MersennePrimeMeta {   
    // The exponent for the mersenne prime: M = 2 ^ P - 1
    uint32 P; 
    // discovery date
    string yearDiscovered; 
    // "Who discovered?", comma separated names
    string discoveredBy; 
    // Hardware/toolset used by discoverer
    string toolset;
    // available?
    bool isClaimed;
  }
    
  uint8 public constant TotalMersennePrimeBlocks = 51;
  MersennePrimeMeta[] public primeMetae; 
  
  string internal constant nameNFT = "MersennePrimeBlocks";
  string internal constant symbolNFT = "|\\/|";

  constructor() public ERC721(nameNFT, symbolNFT) {
    primeMetae.push(
      MersennePrimeMeta({
        P: 2, 
        yearDiscovered: "500 BCE",
        discoveredBy: "Ancient Greek mathematicians",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 3, 
        yearDiscovered: "500 BCE",
        discoveredBy: "Ancient Greek mathematicians",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 5, 
        yearDiscovered: "275 BCE",
        discoveredBy: "Ancient Greek mathematicians",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 7, 
        yearDiscovered: "275 BCE",
        discoveredBy: "Ancient Greek mathematicians",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 13, 
        yearDiscovered: "1456",
        discoveredBy: "?",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 17, 
        yearDiscovered: "1588",
        discoveredBy: "Cataldi",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 19, 
        yearDiscovered: "1588",
        discoveredBy: "Cataldi",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 31, 
        yearDiscovered: "1750",
        discoveredBy: "Euler",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 61, 
        yearDiscovered: "1883",
        discoveredBy: "Pervouchine, Seelhoff",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 89, 
        yearDiscovered: "1911",
        discoveredBy: "Powers",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 107, 
        yearDiscovered: "1913",
        discoveredBy: "Powers",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 127, 
        yearDiscovered: "1876",
        discoveredBy: "Lucas",
        toolset: "Pen",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 521, 
        yearDiscovered: "1952",
        discoveredBy: "Robinson",
        toolset: "SWAC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 607, 
        yearDiscovered: "1952",
        discoveredBy: "Robinson",
        toolset: "SWAC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 1279, 
        yearDiscovered: "1952",
        discoveredBy: "Robinson",
        toolset: "SWAC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 2203, 
        yearDiscovered: "1952",
        discoveredBy: "Robinson",
        toolset: "SWAC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 2281, 
        yearDiscovered: "1952",
        discoveredBy: "Robinson",
        toolset: "SWAC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 3217, 
        yearDiscovered: "1957",
        discoveredBy: "Riesel",
        toolset: "BESC",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 4253, 
        yearDiscovered: "1961",
        discoveredBy: "Hurwitz",
        toolset: "IBM_7090",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 4423, 
        yearDiscovered: "1961",
        discoveredBy: "Hurwitz",
        toolset: "IBM_7090",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 9689, 
        yearDiscovered: "1963",
        discoveredBy: "Gillies",
        toolset: "ILLIAC_II",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 9941, 
        yearDiscovered: "1963",
        discoveredBy: "Gillies",
        toolset: "ILLIAC_II",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 11213, 
        yearDiscovered: "1963",
        discoveredBy: "Gillies",
        toolset: "ILLIAC_II",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 19937, 
        yearDiscovered: "1971",
        discoveredBy: "Tuckerman",
        toolset: "IBM_360_91",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 21701, 
        yearDiscovered: "1978",
        discoveredBy: "Noll, Nickel",
        toolset: "CDC_Cyber_174",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 23209, 
        yearDiscovered: "1979",
        discoveredBy: "Noll",
        toolset: "CDC_Cyber_174",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 44497, 
        yearDiscovered: "1979",
        discoveredBy: "Nelson, Slowinski",
        toolset: "Cray_1",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 86243, 
        yearDiscovered: "1982",
        discoveredBy: "Slowinski",
        toolset: "Cray_1",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 110530, 
        yearDiscovered: "1988",
        discoveredBy: "Colquitt, Welsh",
        toolset: "NEC_SX2",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 132049, 
        yearDiscovered: "1983",
        discoveredBy: "Slowinski",
        toolset: "Cray_X_MP",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 216091, 
        yearDiscovered: "1985",
        discoveredBy: "Slowinski",
        toolset: "Cray_X_MP_24",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 756839, 
        yearDiscovered: "1992",
        discoveredBy: "Slowinski, Gage",
        toolset: "Cray_2",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 859433, 
        yearDiscovered: "1994",
        discoveredBy: "Slowinski, Gage",
        toolset: "Cray_C90",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 1257787, 
        yearDiscovered: "1996",
        discoveredBy: "Slowinski, Gage",
        toolset: "Cray_T94",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 1398269, 
        yearDiscovered: "1996",
        discoveredBy: "Armengaud",
        toolset: "Pentium",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 2976221, 
        yearDiscovered: "1997",
        discoveredBy: "Spence",
        toolset: "Pentium",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 3021377, 
        yearDiscovered: "1998",
        discoveredBy: "Clarkson",
        toolset: "Pentium",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 6972593, 
        yearDiscovered: "1999",
        discoveredBy: "Hajratwala",
        toolset: "Pentium_II",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 13466917, 
        yearDiscovered: "2001",
        discoveredBy: "Cameron",
        toolset: "Athlon_Thunderbird",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 20996011, 
        yearDiscovered: "2003",
        discoveredBy: "Shafer",
        toolset: "Pentium",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 24036583, 
        yearDiscovered: "2004",
        discoveredBy: "Findley",
        toolset: "Pentium_IV",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 25964951, 
        yearDiscovered: "2005",
        discoveredBy: "Nowak",
        toolset: "Pentium_IV",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 30402457, 
        yearDiscovered: "2005",
        discoveredBy: "Cooper, Boone",
        toolset: "Pentium_IV",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 32582657, 
        yearDiscovered: "2006",
        discoveredBy: "Cooper, Boone",
        toolset: "Pentium_IV",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 37156667, 
        yearDiscovered: "2008",
        discoveredBy: "Elvenich",
        toolset: "Core_2_Duo_E6600",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 42643801, 
        yearDiscovered: "2009",
        discoveredBy: "Strindmo",
        toolset: "Core_2_Duo",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 43112609, 
        yearDiscovered: "2008",
        discoveredBy: "Smith",
        toolset: "Core_2_Duo",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 57885161, 
        yearDiscovered: "2013",
        discoveredBy: "Cooper",
        toolset: "Core_2_Duo_E8400",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 74207281, 
        yearDiscovered: "2016",
        discoveredBy: "Cooper",
        toolset: "Core_i7_4790",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 77232917, 
        yearDiscovered: "2017",
        discoveredBy: "Pace",
        toolset: "Core_i5_6600",
        isClaimed: false
      })
    );
    primeMetae.push(
      MersennePrimeMeta({
        P: 82589933, 
        yearDiscovered: "2018",
        discoveredBy: "Laroche",
        toolset: "Core_i5_4590T",
        isClaimed: false
      })
    );
  }

  receive() external payable {}
  fallback() external payable {}
  
  function getPrime(uint8 _primeId) public view returns(MersennePrimeMeta memory) {
    require(_primeId >= 1 && _primeId <= TotalMersennePrimeBlocks,
            "Invalid _primeId, must be between [1, 51].");
    MersennePrimeMeta memory prime = primeMetae[_primeId - 1];
    return prime;
  }

  function getAllPrimes() public view returns(MersennePrimeMeta[] memory) {
    return primeMetae;
  }

  event primeClaimed(address by, uint256 _primeId);

  function claimPrime(uint8 _primeId) public payable {
    require(_primeId >= 1 && _primeId <= TotalMersennePrimeBlocks,
            "Invalid _primeId, must be in [1, 51].");
    MersennePrimeMeta memory prime = primeMetae[_primeId - 1];
    require(prime.isClaimed == false,
            "Mersenne prime already claimed.");
    require(block.number >= prime.P,
            "Too early to claim that Mersenne prime.");
    require(msg.value >= prime.P * 1 szabo,
            "Not enough Ether provided, [EXPONENT szabo] units is the minumum amount.");
    primeMetae[_primeId - 1].isClaimed = true;
    _mint(msg.sender, _primeId);
    _setTokenURI(_primeId, prime.discoveredBy);
    emit primeClaimed(msg.sender, _primeId);    
  }

  function withdraw() public onlyOwner {
    msg.sender.transfer(address(this).balance);
  }

}