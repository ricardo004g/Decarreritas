import express from "express";
const routes = express.Router();

//PATH
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

import { methods as authentication } from "../controller/authentication.controller.js";

import controller from "../controller/controller.js";

routes.get("/", controller.index);
routes.get("/login-cliente", controller.loginClient);
routes.get("/register-cliente", controller.registerClient);
routes.get("/register-chofer", controller.registerChofer);
routes.get("/login-chofer", controller.loginChofer);
routes.post("/api/register-client", authentication.registerClient);

export default routes;