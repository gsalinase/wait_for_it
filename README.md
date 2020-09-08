# Readme

Aplicación que permite optimizar el tiempo de espera presencial y mejorar el distanciamiento social en negocios con alto flujo de usuarios.

### Historias de usuario

https://www.notion.so/Wait-4-It-No-m-s-filas-d7648e39ba504d909df79323c8a75986

### Modelo DDBB

https://drive.google.com/file/d/1Gkzj1sN0UncM1dNtzQ84eewmGbXNRujz/view?usp=sharing

### Front End Vue JS

https://github.com/gsalinase/front_wait_for_it

### Uso

Para usar API se debe ingresar con la siguiente ruta:

https://vast-chamber-77486.herokuapp.com/

#### Autenticación

##### Signup

Ingresar via POST a https://vast-chamber-77486.herokuapp.com/signup.

###### Body:

```json
{
	"user": {
		"email": string,
		"password": string,
		"name": string, 
		"phone": string,
		"role": integer,
		"birthday": string,
		"critical_role": boolean
	}
}
```

##### Login

Ingresar via POST a https://vast-chamber-77486.herokuapp.com/login.

###### Body:

```json
{
	"user": {
		"email": string,
		"password": string
	}	
}
```

#####  Logout

Ingresar via DELETE a https://vast-chamber-77486.herokuapp.com/logout.
