import { pool } from "../db.js";

export class DriverModels {
    static async insertDriver(id, cedula, phone) {
        const query = 'INSERT INTO driver (id_user, cedula, phone) VALUES ($1, $2, $3)';
        await pool.query(query, [id, cedula, phone]);
    }
}