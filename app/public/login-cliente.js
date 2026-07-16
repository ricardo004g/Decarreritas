const mensajeError = document.getElementsByClassName("error")[0];

document.getElementById("login-form").addEventListener("submit", async(e) => {
    e.preventDefault();

    const email = e.target.children.email.value;
    const password = e.target.children.password.value;

    

    console.log(e);
});