# Absinthe Technical Assessment | Xinusu

## Overview
This is a fully self-contained fullstack project with a Hasura GraphQL backend, a Node.js Express server, a Postgres DB, and a Nextjs + RadixUI frontend.


## ENV Setup
You will need to create a `.env` file in the root directory of the project and add the following environment variables.
You can use openssl to generate the secret.

Please see the .env.example for of the .env, it should look like this,
```env
HASURA_GRAPHQL_ADMIN_SECRET=<your-hasura-admin-secret>
EXPRESS_API_URL=http://express-server:3000
```
The Postgres connection string is already set in the docker-compose for sake of the exercise.
Obviously, in a production environment, you would want to use a more secure method of storing the connection string.

## Hasura Setup
You will need to download the `hasura-cli` from [here](https://hasura.io/docs/1.0/graphql/manual/hasura-cli/install-hasura-cli.html#install-hasura-cli) if you haven't already.

Once you can see the console, apply the migrations + the reload the metadata by running this command from the `hasura` directory:
```bash
hasura metadata apply --envfile ../.env; hasura migrate apply --envfile ../.env; hasura metadata reload --envfile ../.env
```

You can run the hasura console by going into the `hasura` directory and running:
```bash
hasura console --envfile ../.env
```

