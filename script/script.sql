CREATE TABLE USERS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    user_address TEXT NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passsword VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    licence_number VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PAYMENTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    payment_token VARCHAR(255) NOT NULL,
    payment_type ENUM('carte', 'paypal', 'autre') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USERS(id) ON DELETE CASCADE
);

CREATE TABLE AGENCIES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agency_name VARCHAR(100) NOT NULL,
    agency_address TEXT NOT NULL
);

CREATE TABLE CARS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    acriss_code VARCHAR(4),
    disponibility BOOLEAN NOT NULL,
    agency_id INT NOT NULL,
    price_base DECIMAL(10,2) NOT NULL,
    immatriculation VARCHAR(20) UNIQUE NOT NULL,
    brand VARCHAR(50) NOT NULL,
    modele VARCHAR(50) NOT NULL,
    car_year INT NOT NULL,
    FOREIGN KEY (agency_id) REFERENCES AGENCIES(id) ON DELETE CASCADE
);

CREATE TABLE RESERVATIONS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    car_id INT NOT NULL,
    agency_departure_id INT NOT NULL,
    agency_return_id INT NOT NULL,
    date_beginning DATETIME NOT NULL,
    date_end DATETIME NOT NULL,
    price_total DECIMAL(10,2) NOT NULL,
    statut ENUM('confirmée', 'en attente', 'annulée') NOT NULL DEFAULT 'en attente',
    FOREIGN KEY (user_id) REFERENCES USERS(id) ON DELETE CASCADE,
    FOREIGN KEY (car_id) REFERENCES CARS(id) ON DELETE CASCADE,
    FOREIGN KEY (agency_departure_id) REFERENCES AGENCIES(id) ON DELETE CASCADE,
    FOREIGN KEY (agency_return_id) REFERENCES AGENCIES(id) ON DELETE CASCADE
);

CREATE TABLE MESSAGES (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES USERS(id) ON DELETE CASCADE
);

CREATE TABLE CANCELLATIONS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT NOT NULL,
    cancelled_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    refund_amount DECIMAL(10,2) NOT NULL,
    refund_type ENUM('total', 'partiel') NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES RESERVATIONS(id) ON DELETE CASCADE
);
