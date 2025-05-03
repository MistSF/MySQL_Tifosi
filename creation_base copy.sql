CREATE TABLE ingredient (
    id_ingredient INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE Client (
    id_client INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT
);

CREATE TABLE marque (
    id_marque INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE focaccia (
    id_focaccia INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE menu (
    id_menu INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prix DECIMAL(5,2) NOT NULL  
);

CREATE TABLE boisson (
    id_boisson INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    id_marque INT,
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);


CREATE TABLE comprend (
    id_focaccia INT,
    id_ingredient INT,
    quantite INT NOT NULL,
    PRIMARY KEY (id_focaccia, id_ingredient),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);

CREATE TABLE achete (
    id_client INT,
    id_menu INT,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu),
    FOREIGN KEY (id_client) REFERENCES Client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);

CREATE TABLE est_constitue (
    id_menu INT,
    id_focaccia INT,
    PRIMARY KEY (id_menu, id_focaccia),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia)
);

CREATE TABLE contient (
    id_menu INT,
    id_boisson INT,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);
