import jsonwebtoken from "jsonwebtoken";
import { JWT_SECRET } from "../config.js";
import { UserModel } from "../models/userModel.js";

var idRol = -1;

export const onlyPublic = async (req, res, next) => {
    const log = await checkCookie(req);
    if(log) {
        switch (idRol) {
            case 1:
                return res.redirect("/dashboard-admin");
            case 2:
                return res.redirect("/dashboard-customer");
            case 3:
                return res.redirect("/dashboard-driver");
        }
    }
    return next();
};

export const onlyAdmin = async (req, res, next) => {
    const log = await checkCookie(req);
    if(!log) {
        console.log("Error login");
        return res.redirect("/");
    }
    return next();
};

async function checkCookie(req) {
    try{
        if(!req.headers.cookie){return false};
        
        const cookieJWT = req.headers.cookie.split("; ").find((value) => value.startsWith("jwt=")).slice(4);
        const decodificado = jsonwebtoken.verify(cookieJWT, JWT_SECRET);
        console.log(decodificado);
        const findUser = await UserModel.findByEmail(decodificado.user);
        
        if(!findUser) {
            return false;
        }
        
        idRol = Number(findUser.id_rol);
        return true;
    }catch (err){
        return false;
    }
};