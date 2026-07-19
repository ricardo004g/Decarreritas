import express from "express";
import path from "path";
import { fileURLToPath } from "url";
import mysql from "mysql";
import myConnection from "express-myconnection";
const __dirname = path.dirname(fileURLToPath(import.meta.url));
import routes from "./routes/routes.js";

const app = express();

app.set("port", process.env.PORT || 3000);

//port config
app.listen(app.get('port'), ()=> {
    console.log("http://localhost:3000");
});

app.use(myConnection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '',
    port:3306,
    database: 'crudnodemysql'
}, 'single'));

app.use(express.urlencoded({extended: false}));

//static files
app.use(express.static(path.join(__dirname, "public")));

//routes
app.use("/", routes);