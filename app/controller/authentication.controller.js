import bcrypt from "bcryptjs";
import { UserModel } from "../models/userModel.js";
import { CustomerModel } from "../models/customerModels.js";
import { catchAsync } from "../utils/catchAsync.js";
import { DriverModels } from "../models/driverModels.js";

export const login = catchAsync(async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).send({ status: "error", message: "Los campos estan incompletos" });
    }

    const userResul = await UserModel.findByEmail(email);

    if (userResul) {
        return res.satatus(400).send({ status: "error", message: "Este usuario ya existe" });
    }

    //Esta constante guarda el tipo de usuario (admin, customer o driver)
    const roleType = await UserModel.role(email);

    if (roleType == 1) {
        return res.status(201).send({ status: "ok", message: "", redirect: "/dashboard-admin.html" });
    } else if (roleType == 2) {
        return res.status(201).send({ status: "ok", message: "", redirect: "/dashboard-customer.html" });
    } else if (roleType == 3) {
        return res.status(201).send({ status: "ok", message: "", redirect: "/dashboard-driver.html" });
    }
});

export const registerChofer = catchAsync(async (req, res) => {
    const { name, lastname, ci, tel, password, email } = req.body;

    if (!name || !lastname || !ci || !tel || !password || !email) {
        return res.status(400).send({
            status: "error",
            message: "Los campos estan incompletos, por favor vuelva a intentarlo"
        });
    }
    const userResul = await UserModel.findByEmail(email);

    if (userResul) {
        return res.status(400).send({ 
            status: "error",
            message: "El usuario con este email ya existe" 
        });
    }

    const salt = await bcrypt.genSalt(7);
    const passwordHash = await bcrypt.hash(password, salt);

    const idUser = UserModel.insertUser(3, name, lastname, email, passwordHash);
    await DriverModels.insertDriver(idUser, ci, tel);

    return res.status(201).send({
        status: "ok",
        message: "Usuario registrado con exito",
        redirect: "/"
    });
});

export const registerCustomer = catchAsync(async (req, res) => {
    const { name, lastname, ci, tel, password, email } = req.body;

    if (!name || !lastname || !ci || !tel || !password || !email) {
        return res.status(400).send(
            {
                status: "error",
                message: "Los campos estan incompletos, por favor vuelva a intentarlo"
            });
    }
    const userResul = await UserModel.findByEmail(email);


    if (userResul) {
        return res.status(400).send({ 
            status: "error",
            message: "El usuario con este email ya existe" 
        });
    }

    //Le echamos salecita a tu contraseña 😭🙏!!
    const salt = await bcrypt.genSalt(7);
    const passwordHash = await bcrypt.hash(password, salt);

    const idUser = await UserModel.insertUser(2, name, lastname, email, passwordHash);
    await CustomerModel.insertCustomer(idUser, ci, tel);

    return res.status(201).send({ 
        status: "ok",
        message: `Usuario ${name} creado con exito`, redirect: "/" 
    });
});