# Shadowy Super Coder Proposal
## Background
A couple of days ago, U.S. Senator Elizabeth Warren expressed that _**"Crypto Puts Financial System in the Hands of 
'Shadowy Super-Coders'"**_. 
Check out the full story [here](https://decrypt.co/76997/elizabeth-warren-crypto-big-banks-shadowy-super-coders). 
This quickly turned into a trending meme on CT:

![img_1.png](img_1.png)

While crypto skeptics make criticisms, we want to give tributes to all Shadowy Super-Coder out there who contributed to
the blockchain ecosystem!


### Result Summary
This repo contains queries run on [ethereum public dataset on google bigquery](https://bigquery.cloud.google.com/dataset/bigquery-public-data:crypto_ethereum)
which are used for the NFT and perks drop. Here are the rules and result:

**110,294** Ethereum addresses who:
1. Deployed at least 1 contract on Ethereum mainnet.
2. Deployed contracts that had at least 2 different non-deployer addresses interacted.

These addresses are ranked in two tiers:
1. **7,466 Shadowy Super-Coders**: those that served >=500 unique addresses & contracts had at least 1 transaction in 2021.
2. **102,828 Shadowy Coders**: those that served less <500 unique addresses || those that served >=500 but have no active tx since 2021.

Special shout out to our Super-Coder friend @Banteg who helped curate data.

### Result File
As we run the queries on Google big query, we export the results to a public google folder [here](https://drive.google.com/drive/folders/1OobRsPXVO66PlKUE6cxOHpPxesxrYiru?usp=sharing). 
You can also find it under this repo, it's under:
```path
results/eligible.csv
results/tier-1.csv
results/tier-2.csv
```

### Reproduce the results
Check below scripts in this repo for details:
```path
scripts/create_views.sql
scripts/queries.sql
```

