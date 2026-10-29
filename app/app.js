import express from "express";
import path from "path";
import {PORT} from "./config.js";
import { fileURLToPath } from "url";
import { pool } from "./db.js";
import morgan from "morgan";

//PATH
const __dirname = path.dirname(fileURLToPath(import.meta.url));
import routes from "./routes/routes.js";

const app = express();

app.use(morgan("dev"));

app.use(express.json());
app.use(express.urlencoded({extended: false}));

//static files
app.use(express.static(path.join(__dirname, "public")));

//routes
app.use("/", routes);

app.use((err, req, res, next) =>{
    console.error("Error no controlado: ", err.stack || err);

    const statusCode = err.statusCode || 500;
    const message = err.message || "Ocurrio un error interno en el servidor";

    res.status(statusCode).json({
        status: "error",
        message: message
    });
});

const testConection = async () => {
    try {
        const resul = await pool.query('SELECT NOW() as current_time');

        console.log('Conexión a la base de datos exitosa!!');
        console.log('Hora del servidor', resul.rows[0].current_time);
    } catch (error) {
        console.log('Error de conexion', error.message);
    }
}

testConection();

app.listen(PORT, ()=> {
    console.log(`http://localhost:${PORT}`);
});