## Background
A couple of days ago, U.S. Senator Elizabeth Warren expressed that _**"Crypto Puts Financial System in the Hands of 
'Shadowy Super-Coders'"**_. 
Check out the full story [here](https://decrypt.co/76997/elizabeth-warren-crypto-big-banks-shadowy-super-coders). 
This quickly turned into a trending meme on CT:

![img_1.png](img_1.png)

While crypto skeptics make criticisms, we want to give tributes to all Shadowy Super-Coder out there who contributed to
the blockchain ecosystem!

## Snapshot
This repo contains queries run on [ethereum public dataset on google bigquery](https://bigquery.cloud.google.com/dataset/bigquery-public-data:crypto_ethereum)
which are used for the NFT and perk drop. Here are the rules and result:

There are 96,809 Ethereum addresses who:
1. Deployed at least 1 contract on Ethereum mainnet before 8/1/2021
2. Deployed contracts that had at least 2 different addresses interacted

These addresses are ranked in two tiers:
1. 7,153 **Shadowy Super-Coders**: those that served >=500 unique addresses & contracts had at least 1 transaction in 2021
2. 89,656 **Shadowy Coders**: those that served less <500 unique addresses

