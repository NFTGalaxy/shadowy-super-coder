-- eligible:
SELECT
    DISTINCT coder,
             unique_caller,
    DATE(last_tx_ts) as last_tx_date,
    unique_contract,
    total_txn
FROM
    `shadowy-super-coder.coder_from_tx.coder-aggr`
WHERE
    unique_caller>=2
ORDER BY
    unique_caller DESC


-- tier 1: shadowy super coders
SELECT
    DISTINCT coder,
             unique_caller,
    DATE(last_tx_ts) as last_tx_date,
    unique_contract,
    total_txn
FROM
    `shadowy-super-coder.coder_from_traces.coder-aggr`
WHERE
    unique_caller>=500
  AND DATE(last_tx_ts)>"2021-1-1"
ORDER BY
    unique_caller DESC


-- tier 2: shadowy coders
SELECT
    DISTINCT coder,
             unique_caller,
    DATE(last_tx_ts) as last_tx_date,
    unique_contract,
    total_txn
FROM
    `shadowy-super-coder.coder_from_traces.coder-aggr`
WHERE
    unique_caller>=2
  AND
    (unique_caller<500 OR DATE(last_tx_ts)<="2021-1-1")
ORDER BY
    unique_caller DESC