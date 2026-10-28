import {pool} from "../db.js"

export class UserModel {
    static async findByEmail(email) {
        const query = 'SELECT * FROM "user" WHERE email = $1';
        const {rows} = await pool.query(query, [email]);
        return rows[0];
    }

    static async insertUser(name, lastname, ci, tel, email, password) {

        const query = 
        `
        INSER INTO "user"(name, lastname, ci, tel, email, password) 
        VALUES ($1, $2, $3, $4, $5, $6)
        `;
        
        const {rows} = await pool.query(query, [name, lastname, ci, tel, email, password]);
        return rows[0];
    }
};