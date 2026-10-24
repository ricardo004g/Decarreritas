const btnError = document.getElementsByClassName('error')[0];

document.getElementById('login-form').addEventListener('submit', async(e)=> {

    e.preventDefault();

    const email = e.target.children.email.value;
    const password = e.target.children.password.value;
    
    const res = await fetch('https://localhost:3000/api/login',
        {
            method: 'POST',
            headers: {
                'Content-Type': 'Application/Json'
            },
            body: JSON.stringify({
                email, password
            })
        }
    );
    
    console.log('email: ', email, 'password: ', password);
});