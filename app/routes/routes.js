import express from "express";
const routes = express.Router();

import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

routes.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/index.html"));
});

routes.get("/login-cliente", (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/login/login-cliente.html"));
});

routes.get("/register-cliente", (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register/register-cliente.html"));
});

routes.get("/login-chofer", (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/login/login-chofer.html"));
});

export default routes;