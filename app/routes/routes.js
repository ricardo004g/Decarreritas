import express from "express";
const routes = express.Router();

//PATH
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

import { login, registerChofer, registerCustomer} from "../controller/authentication.controller.js";

import controller from "../controller/controller.js";
import { onlyPublic, onlyAdmin } from "../middlewares/authorization.js";

//rutas
routes.get("/", controller.index);
routes.get("/register", controller.register);
routes.get("/register-cliente", controller.registerClient);
routes.get("/register-chofer", controller.registerChofer);
routes.get("/dashboard-customer", onlyAdmin, controller.dashboardCustomer);
routes.post("/api/register-customer", registerCustomer);
routes.post("/api/login", login);

export default routes;