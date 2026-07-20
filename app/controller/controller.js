const controller = {};
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

controller.index = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/index.html"));
};

controller.loginClient = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/login/login-cliente.html"));
};

controller.loginChofer = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/login/login-chofer.html"));
}
controller.registerClient = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register/register-cliente.html"));
};

controller.registerChofer = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register/register-chofer.html"));
};

export default controller;