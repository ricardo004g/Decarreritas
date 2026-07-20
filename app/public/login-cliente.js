const mensajeError = document.getElementsByClassName("error")[0];

document.getElementById("login-form").addEventListener("submit", async(e) => {
    e.preventDefault();

    const email = e.target.children.email.value;
    const password = e.target.children.password.value;

    const n = await fetch("/api/login-cliente", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            email, password
        })
    });

    console.log(e);
});