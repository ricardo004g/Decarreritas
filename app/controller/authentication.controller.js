import bcrypt from "bcryptjs";
import { UserModel } from "../models/userModel.js";

async function login(req, res) {
    const {email, password} = req.body;

    const userResul = await UserModel.findByEmail(email);

    if(!userResul) {
        console.log("El usuario con email: ", email, "no existe");
    }else {
        console.log("");
    }
}

async function registerChofer(req, res) {
    const {name, lastname, ci, tel, password, email} = req.body;

}

async function registerCustomer(req, res) {
    const {name, lastname, ci, tel, password, email} = req.body;

    const userResul = await UserModel.findByEmail(email);

    if(!name || !lastname || !ci || !tel || !password || !email) {
        return res.status(400).send(
            {
            status: "error",
            message: "Los campos estan incompletos, por favor vuelva a intentarlo"
            });
    }
    
    if(userResul){
        return res.status(400).send({status: "error", message: "El usuario con este email ya existe"});
    }

    //Le echamos salecita a tu contraseña 😭🙏!!
    const salt = await bcrypt.genSalt(7);
    const passwordHash = await bcrypt.hash(password, salt); 

    console.log(passwordHash);

    const insertResul = await UserModel.insertUser(name, lastname, ci, tel, passwordHash, email);

    return res.status(201).send({message: "", redirect: "/"});
}

export const methods = {
    login,
    registerCustomer,
    registerChofer
}