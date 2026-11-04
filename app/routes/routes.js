import express from "express";
const routes = express.Router();

import { login, registerDriver, registerCustomer} from "../controller/authentication.controller.js";

import controller from "../controller/controller.js";
import { onlyPublic, onlyAdmin } from "../middlewares/authorization.js";

//rutas
routes.get("/", controller.index);
routes.get("/register", controller.register);
routes.get("/register-customer", controller.registerClient);
routes.get("/register-driver", controller.registerChofer);
routes.get("/dashboard-customer", onlyAdmin, controller.dashboardCustomer);
routes.post("/api/register-customer", registerCustomer);
routes.post("/api/register-driver", registerDriver);
routes.post("/api/login", login);

export default routes;