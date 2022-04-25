import { config } from "dotenv";
config();

export default {
    DB_NAME: process.env.DB_NAME ,
    DB_HOST: process.env.DB_HOST ,
    DB_USERNAME: process.env.DB_USERNAME ,
    DB_PASSWORD: process.env.DB_PASSWORD ,
    DB_DIALECT: process.env.DB_DIALECT ,


};
