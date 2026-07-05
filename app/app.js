import express from "express";
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));
import routes from "./routes/routes.js"

const app = express();

app.set("port", process.env.PORT || 3000);

//port config
app.listen(app.get('port'), ()=> {
    console.log("http://localhost:3000");
});



//routes
app.use("/", routes);



