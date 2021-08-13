-- create views for:
-- 1. contract deployer
-- 2. contracts txs and callers info
-- 3. aggregations
--------------------------------------------------------------
-- view 1:
-- shadowy-super-coder.coder_from_traces.eoa-deployer
-- coder 	  STRING
-- contract	STRING

-- Method-1: USING TRACE
SELECT
  from_address AS coder,
  to_address AS contract
FROM
  `bigquery-public-data.crypto_ethereum.traces`
WHERE
  -- is contract creation
  trace_type = 'create'
  -- successful
  AND status=1
  AND to_address IS NOT NULL
  -- snapshot
  AND DATE(block_timestamp) < "2021-08-01"
  -- deployer is not a contract
  AND from_address NOT IN (
  SELECT
    address
  FROM
    `bigquery-public-data.crypto_ethereum.contracts`)
GROUP BY
  coder,
  contract

--------------------------------------------------------------
-- view 2:
-- shadowy-super-coder.coder_from_traces.contract-caller
-- contract	          STRING
-- caller	            STRING
-- last_success_tx_ts	TIMESTAMP
-- txn	                INTEGER
-- total_gas_used	    INTEGER

-- Method-1: USING TRACE
SELECT
  to_address AS contract,
  from_address AS caller,
  MAX(block_timestamp) AS last_success_tx_ts,
  COUNT(1) AS txn,
  SUM(gas_used) AS total_gas_used
FROM
  `bigquery-public-data.crypto_ethereum.traces`
WHERE
  -- NOT contract creation
  trace_type != 'create'
  -- contract successfully deployed before 2021-08-01 by non-contract deployer
  AND to_address IN (SELECT contract FROM `shadowy-super-coder.coder_from_traces.eoa-deployer`)
  -- successful
  AND status=1
  -- snapshot
  AND DATE(block_timestamp) < '2021-08-01'
GROUP BY
  contract,
  caller

--------------------------------------------------------------
-- view 3:
-- coder-aggr
-- coder	         STRING
-- unique_caller	 INTEGER
-- last_tx_ts	   TIMESTAMP

SELECT
  coder,
  COUNT(DISTINCT caller) AS unique_caller,
  MAX(last_success_tx_ts) AS last_tx_ts,
  -- COUNT(DISTINCT c.contract) AS unique_contract,
  -- SUM(txn) AS total_txn
FROM
  `shadowy-super-coder.coder_from_traces.contract-caller` c
JOIN
  `shadowy-super-coder.coder_from_traces.eoa-deployer` d
ON
  c.contract=d.contract
GROUP BY
  coder