const btnError = document.getElementsByClassName("error")[0];

document.getElementById("register-form").addEventListener("submit", async(e) => {
    e.preventDefault();

    // console.log(e);

    const {name, lastname, ci, tel, password, email} = e.target.children;

    const res = await fetch("http://localhost:3000/api/register-customer", {
        method: "POST",
        headers:{
            "Content-Type": "Application/Json"
        },
        body: JSON.stringify({
            name: name.value,
            lastname: lastname.value,
            ci: ci.value,
            tel: tel.value,
            password: password.value,
            email: email.value
        })
    });

    const resJson = await res.json();

    if(resJson.redirect) {
        
    };
});