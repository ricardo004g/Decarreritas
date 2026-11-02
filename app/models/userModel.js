import { pool } from "../db.js"

export class UserModel {
    //Devuelve un usuario si lo encuentra mediante el email
    static async findByEmail(email) {
        const query = 'SELECT * FROM "user" WHERE email = $1';
        const { rows } = await pool.query(query, [email]);
        return rows[0];
    }

    //Inserta el nuevo usuario y devuelve su id correspondiente
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

    //Extrae el id del usuario mediante el email
    static async role(email) {
        const query = `SELECT id_rol FROM "user" WHERE email = $1`;
        const { rows } = await pool.query(query, [email]);
        return rows[0].id_rol;
    }
};