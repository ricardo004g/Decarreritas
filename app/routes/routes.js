import express from "express";
const routes = express.Router();

//PATH
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

import { login, registerChofer, registerCustomer} from "../controller/authentication.controller.js";

import controller from "../controller/controller.js";

routes.get("/", controller.index);

routes.get("/register", async(req, res)=> {
    res.sendFile(path.join(__dirname, "../pages/register.html"));
});

routes.get("/login-cliente", controller.loginClient);
routes.get("/register-cliente", controller.registerClient);
routes.get("/register-chofer", controller.registerChofer);
routes.get("/login-chofer", controller.loginChofer);

routes.post("/api/register-customer", registerCustomer);

routes.post("/api/login", login);

export default routes;