

const express = require('express')
const app = express()
const bcrypt = require('bcrypt')
const passport = require('passport')
const flash = require('express-flash')
const session = require('express-session')
const methodOverride = require('method-override')
const mysql = require('mysql')
const csv = require('csv-parser');
const fs = require('fs');

require('dotenv').config();
const csvFilePath = 'public/database/mapa.csv';
const initializePassport = require('./passport-config')
initializePassport(
    passport,
    async (email) => {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM users WHERE email = ?', [email], (error, results) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(results[0]); // returns the first row found or undefined if no user is found
                }
            });
        });
    },
    async (id) => {
        return new Promise((resolve, reject) => {
            db.query('SELECT * FROM users WHERE id = ?', [id], (error, results) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(results[0]); // returns the first row found or undefined if no user is found
                }
            });
        });
    }
);


app.set('view engine', 'ejs')
app.use(express.urlencoded({ extended: false }))
app.use(flash())
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
}))
app.use(passport.initialize())
app.use(passport.session())
app.use(methodOverride('_method'))

//////////////////////////////////////////////////////
// CREACION DE BASE DE DATOS /////////////////////////
//////////////////////////////////////////////////////
const db = mysql.createConnection({
  host: process.env.DATABASE_HOST,
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: process.env.DATABASE
})

db.connect((error)=>{
  if(error){
    console.log(error)
  }else{
    console.log("Conectado a Mysql..")
  }
})
/////////////////////////////////////////////////////


app.use(express.static('public'));

async function checkAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }

    res.redirect('/login');
}

async function checkNotAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return res.redirect('/');
    }
    next();
}

app.get('/', checkAuthenticated, async (req, res) => {
    try {
        const data = await readAndProcessCSV();
        const chartConfig = makeChartConfig(data);
        const secondChartConfig = makeSecondChartConfig(data);
        res.render('index', { name: req.user.name, chartConfig: JSON.stringify(chartConfig),secondChartConfig: JSON.stringify(secondChartConfig) });
    } catch (error) {
        console.error("Error al cargar y procesar el archivo CSV:", error);
        res.status(500).send("Error interno del servidor");
    }
});


// DEFINIMOS LAS RUTAS (./Routes/pages.js)///////////
app.get('/login', checkNotAuthenticated, (req, res) => {
    res.render('login');
});

app.get('/register', checkNotAuthenticated, (req, res) => {
    res.render('register');
});

app.post('/login', checkNotAuthenticated, passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true
}));

app.post('/register', checkNotAuthenticated, async (req, res) => {
    try {
        const hashedPassword = await bcrypt.hash(req.body.password, 10)
        const newUser = {
            name: req.body.name,
            email: req.body.email,
            password: hashedPassword
        }
        // Insertar el nuevo usuario en la base de datos
        db.query('INSERT INTO users (name, email, password) VALUES (?, ?, ?)', 
            [newUser.name, newUser.email, newUser.password],
            (error, results) => {
                if (error) {
                    console.log(error);
                    res.redirect('/register');
                } else {
                    res.redirect('/login');
                }
            });
    } catch {
        res.redirect('/register');
    }
});

app.delete('/logout', (req, res, next) => {
    req.logOut((err) => {
        if (err) {
            return next(err);
        }
        res.redirect('/login');
    });
});

function readAndProcessCSV() {
    return new Promise((resolve, reject) => {
        const results = [];
        fs.createReadStream(csvFilePath)
            .pipe(csv({ separator: ',' })) 
            .on('data', (data) => {
                // Convierte las cantidades a números y maneja el caso de las cantidades mal formateadas
                const entidad = data.Entidad.trim(); // Elimina los espacios adicionales
                const cantidad = parseFloat(data['	Cantidad'].trim()); 
                const porcentaje = parseFloat(data['	% de total Cantidad junto con Entidad'].trim()); 
                
                if (!isNaN(cantidad)) {
                    results.push({entidad, cantidad,porcentaje});
                }
            })
            .on('end', () => {
                resolve(results);
            })
            .on('error', reject);
    })
    };






//grafica
function makeChartConfig(data) {
    console.log(data)
    const labels = data.map(entry => entry.entidad);
    const values = data.map(entry => entry.cantidad);

    return {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Cantidad por Entidad',
                data: values,
                backgroundColor: 'rgba(169, 169, 169, 0.2)', 
                borderColor: 'black', 
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
        
    };
    

}

function makeSecondChartConfig(data) {
    const labels = data.map(entry => entry.entidad);
    const values = data.map(entry => entry.porcentaje);

    return {
        type: 'line', // Tipo de gráfico de línea en lugar de barras
        data: {
            labels: labels,
            datasets: [{
                label: 'Porcentaje por Entidad ',
                data: values,
                backgroundColor: 'rgba(169, 169, 169, 0.2)', 
                borderColor: 'black', 
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    };
}

app.listen(3000, () => {
    console.log("Servidor iniciado en el puerto 3000");
});


