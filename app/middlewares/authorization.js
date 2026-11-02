import jsonwebtoken from "jsonwebtoken";
import { JWT_SECRET } from "../config.js";
import { UserModel } from "../models/userModel.js";

export const onlyPublic = async (req, res, next) => {
    // const log = await checkCookie(req);
    // if(log) {
    //     return res.redirect("/");
    // }
    // return next();
};

export const onlyAdmin = async (req, res, next) => {
    const log = await checkCookie(req);
    if(!log) {
        return res.redirect("/");
    }
    return next();
};

async function checkCookie(req) {
    try{
        const cookieJWT = req.headers.cookie.split("; ").find((value) => value.startsWith("jwt=")).slice(4);
        const decodificado = jsonwebtoken.verify(cookieJWT, JWT_SECRET);
        console.log(decodificado);
        const findUser = await UserModel.findByEmail(decodificado.user);
        
        if(!findUser) {
            return false;
        }
        return true;
    }catch (err){
        return false;
    }
};