import Web3 from 'web3';
import ContractABI from './abi/MersennePrimeBlock.json';
var $ = require( "jquery" );

document.addEventListener('DOMContentLoaded', onDocumentLoad);
function onDocumentLoad() {
  DApp.init();
}

const DApp = {
  web3: null,
  contracts: {},
  accounts: [],
  primes: [],

  init: function() {
    return DApp.initWeb3();
  },

  initWeb3: async function () {
    if (typeof window.ethereum !== 'undefined') {
      // New web3 provider
      // As per EIP1102 and EIP1193
      // Ref: https://eips.ethereum.org/EIPS/eip-1102
      // Ref: https://eips.ethereum.org/EIPS/eip-1193
      try {
        // Request account access if needed
        const accounts = await window.ethereum.request({
          method: 'eth_requestAccounts',
        });
        // Accounts now exposed, use them
        DApp.updateAccounts(accounts);
        // Opt out of refresh page on network change
        // Ref: https://docs.metamask.io/guide/ethereum-provider.html#properties
        ethereum.autoRefreshOnNetworkChange = false;
        // When user changes to another account,
        // trigger necessary updates within DApp
        window.ethereum.on('accountsChanged', DApp.updateAccounts);
      } catch (error) {
        // User denied account access
        console.error('User denied web3 access');
        $("#address").text("Not connected.")
        return;
      }
      DApp.web3 = new Web3(window.ethereum);
    }
    // else if (window.web3) {
    //   // Deprecated web3 provider
    //   DApp.web3 = new Web3(web3.currentProvider);
    //   // no need to ask for permission
    // }
    // No web3 provider
    else {
      $("#address").text("Not connected.")
      $("#txStatus").text(`No web3 provider detected.`)
      console.error('No web3 provider detected');
      return;
    }
    return DApp.initContract();
  },

  updateAccounts: async function(accounts) {
    const firstUpdate = !(DApp.accounts && DApp.accounts[0]);
    DApp.accounts = accounts || await DApp.web3.eth.getAccounts();
    $("#address").text(`${accounts[0].substring(0, 6)}...${accounts[0].substring(accounts[0].length - 4, accounts[0].length)}`);
    if (!firstUpdate) {
      DApp.render();
    }
  },

  initContract: async function() {
    try {
      const currentNetworkId = await DApp.web3.eth.net.getId();
      const BSCNetwork = 97 // bsc testnet
      if(currentNetworkId != BSCNetwork) {
        $("#txStatus").text(`Please switch to Binance smart chain testnet and refresh.`)
        console.log(`Please switch to Binance smart chain testnet and refresh.`)
        return
      }
    
      DApp.contracts.MPBContract = new DApp.web3.eth.Contract(
        ContractABI,
        "0x802eE77358fF4dcC993D9D193d8DD511411362d1"
      );
    }
    catch(e){
      $("#txStatus").text(`Connection failed, please check console.`)
      console.log(e);
    }

    return DApp.render();
  },

  render: async function() {
    // show spinner before loading data from smart contract
    // TODO

    // set or refresh any event listeners

    // update DOM to render account address where relevant
    // TODO using DApp.accounts[0]

    // retrieve data from smart contract and render it
    // TODO using DApp.contracts.Contract

    // Hide spinner after loading and rendering data from smart contract
    try {
      const now = Date.now()
      const block_time = 3 // Binance smart chain testnet
      const blocks_per_hour = 3600 / block_time
      const blocks_per_day = 3600 * 24 / block_time
      const block_number = await DApp.web3.eth.getBlockNumber()
      $("#blockNumber").text("⛓ " + block_number.toLocaleString())
      DApp.primes = await DApp.contracts.MPBContract.methods.getAllPrimes().call()
      $("#blockList").empty()
      for(var i = 0; i < DApp.primes.length; i++) {
        const prime = DApp.primes[i]
        const price = DApp.web3.utils.fromWei(
          DApp.web3.utils.toWei(prime.P, "szabo")
        ).toLocaleString({maximumFractionDigits: 2})
        const exponent = parseInt(prime.P)
        let claim_action = `<span class="claim_message">Already claimed.</span>`
        if(prime.isClaimed == false) {
          claim_action = `<span class="button-dark button" id="claimButton" data-pi="${i}">Claim</span>`
          if(exponent > block_number) {          
            const msecs_claim = now + (exponent - block_number) * block_time * 1000 
            const claim_date = (new Date(msecs_claim)).toLocaleString(
              undefined,
              {dateStyle: "medium", timeStyle: "short"})
            claim_action = `<span class="claim_message">Available to claim at <br/><b><i>${claim_date}</i></b></span>`
          }
        }
        let discoverers = prime.discoveredBy.replace(/,/g, ",<br/>")
        // "?" => "Anonymous"
        if(prime.discoveredBy.length < 2) {
          discoverers = "Anonymous"
        }
        let discovery_year = prime.yearDiscovered
        if(prime.yearDiscovered.indexOf("BCE") > 0) {
          discovery_year = "Antiquity"
          discoverers = "Anonymous"
        }
        let block = $.parseHTML( 
          `<div class="block" id="M${i + 1}">
            <span class="M">|\\/|<sub>${i + 1}</sub></span>
            <span title="Found with '${prime.toolset}'" class="discovery_toolset ${prime.toolset == 'Pen' ? 'hand' : 'cpu'}"></span>
            <span class="prime">2<sup><font color="#2f4c56">${exponent.toLocaleString()}</font></sup> - 1<br/>is a “<i>Mersenne</i>” prime</span>
            <div class="claim">
              <span class="claim_cost">${price} BNB</span>
              ${claim_action}
            </div>
            <div class="discovery">
              <span title="Discovered by">${discoverers}</span>
              <span title="Year discovered">${discovery_year}</span>
            </div>
          </div>`)
        $("#blockList").append(block)
      }
      $(".modal").css({display: "none"})
    }
    catch(e) {
      $("#txStatus").text(`Load failed, please check console.`)      
      console.log(e)
    }
  },
};

$(document).on("click", ".button", async function() {
  const index = parseInt(($(this).data("pi")))
  const prime = DApp.primes[index]
  if(prime.isClaimed) {
    return;
  }
  const price = DApp.web3.utils.toWei(prime.P, "szabo")  
  DApp.contracts.MPBContract.methods.claimPrime(index + 1).send({from: DApp.accounts[0], value: price})
  .once("transactionHash", function(hash){    
    $(".modal").css({display: "grid"})
    $("#txStatus").text(`Initiating claim...`)
    $("#txLink").prop("href", `https://testnet.bscscan.com/tx/${hash}`)
    $("#txLink").text(`Tx: ${hash.substring(0, 16)}...`)
  })  
  .on('error', function(error){ 
    $("#txStatus").text(`Failed to claim.`)
    setTimeout(function() {
      $(".modal").css({display: "none"})
    }, 4000)
    console.log(error)
   })
  .then(function(receipt){
    $("#txStatus").text(`Claimed successfully.`)
    setTimeout(function() {
      $(".modal").css({display: "none"})
      window.location.reload()
      return false    
    }, 4000)    
  })
})