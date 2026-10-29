import { pool } from "../db.js";

export class CustomerModel {
    static async insertCustomer(id, cedula, phone) {
        const query = 'INSERT INTO customer (id_user, cedula, phone) VALUES ($1, $2, $3)';
        await pool.query(query, [id, cedula, phone]);
    }
}