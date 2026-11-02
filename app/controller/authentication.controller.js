import bcrypt from "bcryptjs";
import { UserModel } from "../models/userModel.js";
import { CustomerModel } from "../models/customerModels.js";
import { catchAsync } from "../utils/catchAsync.js";
import { DriverModels } from "../models/driverModels.js";
import jsonwebtoken from "jsonwebtoken";
import { JWT_SECRET, JWT_EXPIRES_IN, JWT_COOKIE_EXPIRES_IN } from "../config.js";

export const login = catchAsync(async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).send({ status: "error", message: "Los campos estan incompletos" });
    }

    const userResul = await UserModel.findByEmail(email);

    if (!userResul) {
        console.log("Este usuario no existe");
        return res.status(400).send({ status: "error", message: "Error durante el login" });
    }

    const loginAccept = await bcrypt.compare(password, userResul.password);

    if(!loginAccept) {
        return res.status(400).send({ status: "error", message: "Error durante el login" });
    }

    const token = jsonwebtoken.sign({user: userResul.email}, JWT_SECRET, {expiresIn: JWT_EXPIRES_IN});

    const cookieOption = {
        expires: new Date(Date.now() + JWT_COOKIE_EXPIRES_IN * 24 * 3600 * 1000),
        path: "/"
    };

    res.cookie("jwt", token, cookieOption);
    
    //Esta constante guarda el tipo de usuario (admin, customer o driver)
    const roleType = await UserModel.role(email);

    console.log("ID ROL: ", roleType, "USUARIO:  ", userResul.email, "isAccept: ", loginAccept);

    if(loginAccept || password === userResul.password) {
        if (roleType == 1) {
            return res.status(200).send({ status: "ok", message: "Usuario logeado", redirect: "/dashboard-admin" });
        } else if (roleType == 2) {
            return res.status(200).send({ status: "ok", message: "Usuario logeado", redirect: "/dashboard-customer" });
        } else if (roleType == 3) {
            return res.status(200).send({ status: "ok", message: "Usuario logeado", redirect: "/dashboard-driver" });
        }
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
        message: `Usuario ${name} registrado con exito`,
        redirect: "/"
    });
});

export const registerCustomer = catchAsync(async (req, res) => {
    const { name, lastname, ci, tel, email, password } = req.body;

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
        message: `Usuario ${name} creado con exito`,
        redirect: "/" 
    });
});  