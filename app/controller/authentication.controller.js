async function login(req, res) {
    const {email, password} = req.body;
}

async function registerChofer(req, res) {
    
}

async function registerClient(req, res) {
    const {name, lastname, ci, tel, password, email} = req.body;

}

export const methods = {
    login,
    registerClient,
    registerChofer
}