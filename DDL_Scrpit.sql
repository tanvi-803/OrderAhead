DROP DATABASE IF EXISTS canteen_ordering_system;
CREATE DATABASE canteen_ordering_system;
USE canteen_ordering_system;

-- ------------------------------------------------------------
-- 1. USER
-- Independent entity — no foreign keys
-- ------------------------------------------------------------
CREATE TABLE USER (
    User_ID     INT AUTO_INCREMENT,
    First_Name  VARCHAR(50)  NOT NULL,
    Last_Name   VARCHAR(50)  NOT NULL,
    Email       VARCHAR(100) NOT NULL,
    Phone_No    VARCHAR(15)  NOT NULL,
    Password    VARCHAR(225) NOT NULL,
    PRIMARY KEY (User_ID),
    UNIQUE (Email)
);

-- ------------------------------------------------------------
-- 2. CANTEEN
-- Independent entity — no foreign keys
-- ------------------------------------------------------------
CREATE TABLE CANTEEN (
    Canteen_No  INT AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    Password    VARCHAR(225) NOT NULL,
    Phone_No    VARCHAR(15)  NOT NULL,
    PRIMARY KEY (Canteen_No)
);

-- ------------------------------------------------------------
-- 3. CUISINE
-- Independent entity — no foreign keys
-- ------------------------------------------------------------
CREATE TABLE CUISINE (
    Cuisine_ID  INT AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    PRIMARY KEY (Cuisine_ID)
);

-- ------------------------------------------------------------
-- 4. FOOD_CATEGORY
-- Independent entity — no foreign keys
-- ------------------------------------------------------------
CREATE TABLE FOOD_CATEGORY (
    Category_ID INT AUTO_INCREMENT,
    Name        VARCHAR(50) NOT NULL,
    PRIMARY KEY (Category_ID)
);

-- ------------------------------------------------------------
-- 5. FOOD_ITEM
-- References CUISINE (Belongs_To relationship, 1:N)
-- ------------------------------------------------------------
CREATE TABLE FOOD_ITEM (
    Item_ID     INT AUTO_INCREMENT,
    Name        VARCHAR(100) NOT NULL,
    Cuisine_ID  INT NOT NULL,
    PRIMARY KEY (Item_ID),
    CONSTRAINT fk_fooditem_cuisine
        FOREIGN KEY (Cuisine_ID) REFERENCES CUISINE(Cuisine_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ------------------------------------------------------------
-- 6. FOOD_ITEM_CATEGORY
-- Resolves M:N Preference relationship between FOOD_ITEM and FOOD_CATEGORY
-- ------------------------------------------------------------
CREATE TABLE FOOD_ITEM_CATEGORY (
    Item_ID     INT NOT NULL,
    Category_ID INT NOT NULL,
    PRIMARY KEY (Item_ID, Category_ID),
    CONSTRAINT fk_fic_item
        FOREIGN KEY (Item_ID) REFERENCES FOOD_ITEM(Item_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_fic_category
        FOREIGN KEY (Category_ID) REFERENCES FOOD_CATEGORY(Category_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 7. CANTEEN_OFFERS
-- Resolves M:N Offers relationship between CANTEEN and FOOD_ITEM
-- ------------------------------------------------------------
CREATE TABLE CANTEEN_OFFERS (
    Canteen_No  INT NOT NULL,
    Item_ID     INT NOT NULL,
    Price       DECIMAL(10,2) NOT NULL,
    Prep_Time   INT NOT NULL,
    PRIMARY KEY (Canteen_No, Item_ID),
    CONSTRAINT fk_offers_canteen
        FOREIGN KEY (Canteen_No) REFERENCES CANTEEN(Canteen_No)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_offers_item
        FOREIGN KEY (Item_ID) REFERENCES FOOD_ITEM(Item_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 8. ORDERS
-- References USER (Places, 1:N) and CANTEEN (Receives, 1:N)
-- Alternate key: (Canteen_No, Token_No)
-- ------------------------------------------------------------
CREATE TABLE ORDERS (
    Order_ID    INT AUTO_INCREMENT,
    Token_No    INT NOT NULL,
    User_ID     INT NOT NULL,
    Canteen_No  INT NOT NULL,
    PRIMARY KEY (Order_ID),
    UNIQUE (Canteen_No, Token_No),
    CONSTRAINT fk_orders_user
        FOREIGN KEY (User_ID) REFERENCES USER(User_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_orders_canteen
        FOREIGN KEY (Canteen_No) REFERENCES CANTEEN(Canteen_No)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ------------------------------------------------------------
-- 9. ORDER_ITEM
-- Resolves M:N Contains relationship between ORDERS and FOOD_ITEM
-- ------------------------------------------------------------
CREATE TABLE ORDER_ITEM (
    Order_ID    INT NOT NULL,
    Item_ID     INT NOT NULL,
    Quantity    INT NOT NULL,
    Price       DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Order_ID, Item_ID),
    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_orderitem_item
        FOREIGN KEY (Item_ID) REFERENCES FOOD_ITEM(Item_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- ------------------------------------------------------------
-- 10. PAYMENT
-- References ORDERS (Paid_By, 1:1) — Order_ID is unique (alternate key)
-- ------------------------------------------------------------
CREATE TABLE PAYMENT (
    PID         INT AUTO_INCREMENT,
    Method      VARCHAR(20)  NOT NULL,
    Time        DATETIME     NOT NULL,
    P_Status    VARCHAR(20)  NOT NULL,
    Order_ID    INT NOT NULL,
    PRIMARY KEY (PID),
    UNIQUE (Order_ID),
    CONSTRAINT fk_payment_order
        FOREIGN KEY (Order_ID) REFERENCES ORDERS(Order_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- 11. FAVOURITE
-- Resolves M:N Favourite relationship between USER and FOOD_ITEM
-- ------------------------------------------------------------
CREATE TABLE FAVOURITE (
    User_ID     INT NOT NULL,
    Item_ID     INT NOT NULL,
    PRIMARY KEY (User_ID, Item_ID),
    CONSTRAINT fk_favourite_user
        FOREIGN KEY (User_ID) REFERENCES USER(User_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_favourite_item
        FOREIGN KEY (Item_ID) REFERENCES FOOD_ITEM(Item_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
