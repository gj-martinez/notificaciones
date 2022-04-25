import app from './app.js'
import {sequelize} from './database/database.js'
import { config } from "dotenv";
config();

const PORT = process.env.PORT || 3000

async function main() {
    try {
        await sequelize.sync({force: false});
        
        
        app.listen(PORT)
        console.log('listening on port',PORT)
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

main();