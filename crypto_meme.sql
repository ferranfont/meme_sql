CREATE DATABASE IF NOT EXISTS crypto_meme;
USE crypto_meme;

CREATE TABLE IF NOT EXISTS transactions (
    sig_hash_id VARCHAR(255) NOT NULL,
    timestamp DATETIME NOT NULL,
    block INT NOT NULL,
    result BOOLEAN NOT NULL,
    wallet VARCHAR(255) NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    dex1 VARCHAR(255),
    dex2 VARCHAR(255),
    dex3 VARCHAR(255),
    dex4 VARCHAR(255),
    `index` INT NOT NULL,
    meme VARCHAR(255) NOT NULL,
    amount DECIMAL(18, 8) NOT NULL,
    PRIMARY KEY (sig_hash_id)
);

CREATE TABLE IF NOT EXISTS client_wallet (
    wallet_id VARCHAR(255) NOT NULL,
    meme1 VARCHAR(255),
    meme2 VARCHAR(255),
    meme3 VARCHAR(255),
    meme4 VARCHAR(255),
    meme5 VARCHAR(255),
    PRIMARY KEY (wallet_id)
);

CREATE TABLE IF NOT EXISTS product_meme (
    token_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    website VARCHAR(255),
    PRIMARY KEY (token_id)
);

SET foreign_key_checks = 0;

-- Assuming the tables and database are already created as per the previous instructions

-- Alter 'transactions' table to add a foreign key constraint from 'wallet' to 'client_wallet(wallet_id)'
ALTER TABLE transactions
ADD CONSTRAINT fk_wallet
FOREIGN KEY (wallet) REFERENCES client_wallet(wallet_id);

-- Alter 'transactions' table to add a foreign key constraint from 'meme' to 'product_meme(token_id)'
ALTER TABLE transactions
ADD CONSTRAINT fk_meme
FOREIGN KEY (meme) REFERENCES product_meme(token_id);
