CREATE TABLE "public"."logs" ("transaction_type" text NOT NULL, "transaction_hash" text NOT NULL, "decoded" jsonb NOT NULL, "address" text NOT NULL, "block_number" Numeric NOT NULL, "block_timestamp" timestamptz NOT NULL, "from" text NOT NULL, "to" text NOT NULL, PRIMARY KEY ("transaction_hash") );

-- Badges
-- for points and multipliers one or the other will be NULL
CREATE TABLE "public"."badges" (
    "id" serial PRIMARY KEY, -- Auto-increment
    "label" text NOT NULL,
    "type" text NOT NULL,
    "points" int,
    "multiplier" Numeric,
    "reward" text NOT NULL,
    "complete" boolean NOT NULL DEFAULT false,
    "image" text NOT NULL
);

-- Actions
CREATE TABLE "public"."actions" (
    "id" serial PRIMARY KEY,
    "badge_id" int NOT NULL,
    "action" text NOT NULL,
    "completed" boolean NOT NULL DEFAULT false,
    FOREIGN KEY ("badge_id") REFERENCES "public"."badges" ("id") ON DELETE CASCADE
);

-- INSERT Badges
INSERT INTO "public"."badges" ("label", "type", "points", "multiplier", "reward", "complete", "image")
VALUES 
('Liquidity Rookie', 'Achievement', 200, NULL, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724344555/absinthe/liquidity_rookie.png'),
('Liquidity Machine', 'Achievement', NULL, 2, 'Trade USDC', true, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/liquidity_machine.png'),
('Rookie Badge', 'Achievement', 150, NULL, 'Buy Ethereum', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/rookie.png'),
('Pioneer Badge', 'Achievement', 500, NULL, 'Liquidity Provisions for ETH/USDC', true, 'https://res.cloudinary.com/xinusu/image/upload/v1724344532/absinthe/pioneer.png'),
('Visionary Badge', 'Achievement', 1000, NULL, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343560/absinthe/visionary.png'),
('Income Engineer', 'Achievement', NULL, 2, 'Liquidity Provisions for ETH/USDC', true, 'https://res.cloudinary.com/xinusu/image/upload/v1724343558/absinthe/income_engineer.png'),
('Core OG', 'Community', NULL, 1.15, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/core_og.png'),
('Pudgy OG', 'Community', 200, NULL, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/pudgy_og.png'),
('Liquidity OGs', 'Community', 200, NULL, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343560/absinthe/liquidity_og.png'),
('Pathfinder OG', 'Community', NULL, 1.15, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343560/absinthe/pathfinder_og.png'),
('Originator', 'Community', 500, NULL, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/originator.png'),
('Torchbearer', 'Community', NULL, 1.15, 'Liquidity Provisions for ETH/USDC', false, 'https://res.cloudinary.com/xinusu/image/upload/v1724343559/absinthe/torchbearer.png');

-- Insert Actions
INSERT INTO "public"."actions" ("badge_id", "action", "completed")
VALUES 
(1, 'Provide at least $50 Liquidity to USDT/ETH', false),
(1, 'Hold your liquidity for at least 7 days', false),
(2, 'Provide at least $50 Liquidity to LINK/ETH', true),
(2, 'Stake liquidity tokens in a rewards pool', false),
(2, 'Claim staking rewards after 14 days', false),
(3, 'Provide at least $50 Liquidity to USDT/ETH', false),
(3, 'Provide at least $50 Liquidity to DAI/ETH', false),
(3, 'Complete a trade on a decentralised exchange (DEX)', false),
(4, 'Provide at least $100 Liquidity to USDT/ETH', true),
(4, 'Provide at least $100 Liquidity to DAI/ETH', true),
(4, 'Hold your liquidity for at least 14 days', false),
(5, 'Provide at least $50 Liquidity to USDT/ETH', false),
(5, 'Provide at least $100 Liquidity to UNI/ETH', false),
(5, 'Provide at least $125 Liquidity to SUSHI/ETH', false),
(5, 'Participate in a governance vote using staked tokens', false),
(6, 'Provide at least $100 Liquidity to USDT/ETH', true),
(6, 'Earn at least $10 in rewards from a staking pool', true),
(7, 'Provide at least $50 Liquidity to USDT/ETH', false),
(7, 'Refer a friend to join the liquidity pool', false),
(9, 'Provide at least $50 Liquidity to USDT/ETH', false),
(9, 'Provide at least $50 Liquidity to LINK/ETH', false),
(9, 'Engage with the community on social media', false),
(10, 'Provide at least $50 Liquidity to USDT/ETH', false),
(10, 'Explore and provide liquidity to a newly launched pool', false),
(11, 'Provide at least $50 Liquidity to USDT/ETH', false),
(11, 'Participate in a community governance proposal', false),
(12, 'Provide at least $50 Liquidity to USDT/ETH', false),
(12, 'Share your liquidity provision strategy with the community', false);