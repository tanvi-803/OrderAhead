# Minimal Functional Dependency Sets

## 1. User

**Relation:**
```
User(User_ID, First_Name, Last_Name, Email, Phone_No, Password)
```

**Primary Key:**
```
User_ID
```

**Functional Dependencies:**
- User_ID → First_Name
- User_ID → Last_Name
- User_ID → Email
- User_ID → Phone_No
- User_ID → Password

---

## 2. Canteen

**Relation:**
```
Canteen(Canteen_No, Name, Password, Phone_No)
```

**Primary Key:**
```
Canteen_No
```

**Functional Dependencies:**
- Canteen_No → Name
- Canteen_No → Password
- Canteen_No → Phone_No

---

## 3. Food_Item

**Relation:**
```
Food_Item(Item_ID, Name, Cuisine_ID)
```

**Primary Key:**
```
Item_ID
```

**Functional Dependencies:**
- Item_ID → Name
- Item_ID → Cuisine_ID

---

## 4. Food_Category

**Relation:**
```
Food_Category(Category_ID, Name)
```

**Primary Key:**
```
Category_ID
```

**Functional Dependencies:**
- Category_ID → Name

---

## 5. Cuisine

**Relation:**
```
Cuisine(Cuisine_ID, Name)
```

**Primary Key:**
```
Cuisine_ID
```

**Functional Dependencies:**
- Cuisine_ID → Name

---

## 6. Canteen_Offers

**Relation:**
```
Canteen_Offers(Canteen_No, Item_ID, Price, Prep_Time)
```

**Primary Key:**
```
(Canteen_No, Item_ID)
```

**Functional Dependencies:**
- (Canteen_No, Item_ID) → Price
- (Canteen_No, Item_ID) → Prep_Time

---

## 7. Orders

**Relation:**
```
Orders(Order_ID, Token_No, User_ID, Canteen_No)
```

**Primary Key:**
```
Order_ID
```

**Candidate Key:**
```
(Canteen_No, Token_No)
```

**Functional Dependencies:**
- Order_ID → Token_No
- Order_ID → User_ID
- Order_ID → Canteen_No
- (Canteen_No, Token_No) → Order_ID

---

## 8. Order_Item

**Relation:**
```
Order_Item(Order_ID, Item_ID, Quantity, Price)
```

**Primary Key:**
```
(Order_ID, Item_ID)
```

**Functional Dependencies:**
- (Order_ID, Item_ID) → Quantity
- (Order_ID, Item_ID) → Price

---

## 9. Payment

**Relation:**
```
Payment(PID, Method, Time, P_Status, Order_ID)
```

**Primary Key:**
```
PID
```

**Functional Dependencies:**
- PID → Method
- PID → Time
- PID → P_Status
- PID → Order_ID
- Order_ID → PID

---

## 10. Favourite

**Relation:**
```
Favourite(User_ID, Item_ID)
```

**Primary Key:**
```
(User_ID, Item_ID)
```

**Functional Dependencies:**
- No non-trivial functional dependencies.

---

## 11. Food_Item_Category

**Relation:**
```
Food_Item_Category(Item_ID, Category_ID)
```

**Primary Key:**
```
(Item_ID, Category_ID)
```

**Functional Dependencies:**
- No non-trivial functional dependencies.
