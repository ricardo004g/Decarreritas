import { pool } from "../db.js"

export class UserModel {
    static async findByEmail(email) {
        const query = 'SELECT * FROM "user" WHERE email = $1';
        const { rows } = await pool.query(query, [email]);
        return rows[0];
    }

    static async insertUser(rol, name, lastname, email, password) {
        const query =
            `
        INSERT INTO 
        "user"(id_rol, name, last_name, email, password) 
        VALUES ($1, $2, $3, $4, $5) RETURNING id_user;
        `;

        const { rows } = await pool.query(query, [rol, name, lastname, email, password]);
        return rows[0].id_user;
    }

    static async role(email) {
        const query = `SELECT id_rol FROM "user" WHERE email = $1`;
        const { rows } = await pool.query(query, [email]);
        return rows[0].id_rol;
    }
};