const controller = {};
import path from "path";
import { fileURLToPath } from "url";
const __dirname = path.dirname(fileURLToPath(import.meta.url));

controller.index = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/index.html"));
};

controller.registerClient = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register/register-customer.html"));
};

controller.registerChofer = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register/register-driver.html"));
};

controller.dashboardCustomer = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/admin/dashboard-customer.html"));
};

controller.register = (req, res) => {
    res.sendFile(path.join(__dirname, "../pages/register.html"));
}

export default controller;