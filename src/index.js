import app from './app.js'
import {sequelize} from './database/database.js'
import dotenv from 'dotenv'

async function main() {
    try {
        await sequelize.sync({force: false});
        dotenv.config()
        
        app.listen(4000)
        console.log('listening on port',4000)
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
}

main();