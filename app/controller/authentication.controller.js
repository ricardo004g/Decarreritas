async function loginClient(req, res) {
    
}

async function loginChofer(req, res) {
    
}

async function registerChofer(req, res) {
    
}

async function registerClient(req, res) {
    const {name, ci, email, password} = req.body;
    
    req.getConnection((err, conn) => {
        
    })
}

export const methods = {
    loginClient,
    loginChofer,
    registerClient,
    registerChofer
}