import express from "express";
import path from "path";
import {PORT} from "./config.js";
import { fileURLToPath } from "url";

//PATH
const __dirname = path.dirname(fileURLToPath(import.meta.url));
import routes from "./routes/routes.js";

const app = express();


app.use(express.urlencoded({extended: false}));

//static files
app.use(express.static(path.join(__dirname, "public")));

//routes
app.use("/", routes);

//port config
app.listen(PORT, ()=> {
    console.log(`http://localhost:${PORT}`);
});