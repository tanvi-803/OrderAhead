# BCNF Analysis

This document verifies that each relation in the **Cafeteria Management System** satisfies **Boyce-Codd Normal Form (BCNF)**.

---

# 1. User

**Relation**

```
User(User_ID, First_Name, Last_Name, Email, Phone_No, Password)
```

**Primary Key**

```
User_ID
```

**Candidate Keys**

- User_ID

### Functional Dependencies

- User_ID → First_Name
- User_ID → Last_Name
- User_ID → Email
- User_ID → Phone_No
- User_ID → Password

### BCNF Verification

The determinant **User_ID** is the primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 2. Canteen

**Relation**

```
Canteen(Canteen_No, Name, Password, Phone_No)
```

**Primary Key**

```
Canteen_No
```

**Candidate Keys**

- Canteen_No

### Functional Dependencies

- Canteen_No → Name
- Canteen_No → Password
- Canteen_No → Phone_No

### BCNF Verification

The determinant **Canteen_No** is the primary key and hence a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 3. Food_Item

**Relation**

```
Food_Item(Item_ID, Name, Cuisine_ID)
```

**Primary Key**

```
Item_ID
```

**Candidate Keys**

- Item_ID

### Functional Dependencies

- Item_ID → Name
- Item_ID → Cuisine_ID

### BCNF Verification

The determinant **Item_ID** is the primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 4. Food_Category

**Relation**

```
Food_Category(Category_ID, Name)
```

**Primary Key**

```
Category_ID
```

**Candidate Keys**

- Category_ID

### Functional Dependencies

- Category_ID → Name

### BCNF Verification

The determinant **Category_ID** is the primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 5. Cuisine

**Relation**

```
Cuisine(Cuisine_ID, Name)
```

**Primary Key**

```
Cuisine_ID
```

**Candidate Keys**

- Cuisine_ID

### Functional Dependencies

- Cuisine_ID → Name

### BCNF Verification

The determinant **Cuisine_ID** is the primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 6. Canteen_Offers

**Relation**

```
Canteen_Offers(Canteen_No, Item_ID, Price, Prep_Time)
```

**Primary Key**

```
(Canteen_No, Item_ID)
```

**Candidate Keys**

- (Canteen_No, Item_ID)

### Functional Dependencies

- (Canteen_No, Item_ID) → Price
- (Canteen_No, Item_ID) → Prep_Time

### BCNF Verification

The determinant **(Canteen_No, Item_ID)** is the composite primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 7. Orders

**Relation**

```
Orders(Order_ID, Token_No, User_ID, Canteen_No)
```

**Primary Key**

```
Order_ID
```

**Candidate Keys**

- Order_ID
- (Canteen_No, Token_No)

### Functional Dependencies

- Order_ID → Token_No
- Order_ID → User_ID
- Order_ID → Canteen_No
- (Canteen_No, Token_No) → Order_ID

### BCNF Verification

- **Order_ID** is a candidate key and therefore a **superkey**.
- **(Canteen_No, Token_No)** is also a candidate key and therefore a **superkey**.

Since every determinant is a superkey, the relation satisfies BCNF.

✅ **Result:** The relation is in **BCNF**.

---

# 8. Order_Item

**Relation**

```
Order_Item(Order_ID, Item_ID, Quantity, Price)
```

**Primary Key**

```
(Order_ID, Item_ID)
```

**Candidate Keys**

- (Order_ID, Item_ID)

### Functional Dependencies

- (Order_ID, Item_ID) → Quantity
- (Order_ID, Item_ID) → Price

### BCNF Verification

The determinant **(Order_ID, Item_ID)** is the composite primary key and therefore a **superkey**.

✅ **Result:** The relation is in **BCNF**.

---

# 9. Payment

**Relation**

```
Payment(PID, Method, Time, P_Status, Order_ID)
```

**Primary Key**

```
PID
```

**Candidate Keys**

- PID
- Order_ID

### Functional Dependencies

- PID → Method
- PID → Time
- PID → P_Status
- PID → Order_ID
- Order_ID → PID

### BCNF Verification

- **PID** is a candidate key and therefore a **superkey**.
- **Order_ID** is also a candidate key and therefore a **superkey**.

Since every determinant is a superkey, the relation satisfies BCNF.

✅ **Result:** The relation is in **BCNF**.

---

# 10. Favourite

**Relation**

```
Favourite(User_ID, Item_ID)
```

**Primary Key**

```
(User_ID, Item_ID)
```

**Candidate Keys**

- (User_ID, Item_ID)

### Functional Dependencies

There are **no non-trivial functional dependencies**.

### BCNF Verification

Since there are no non-trivial functional dependencies, the relation trivially satisfies BCNF.

✅ **Result:** The relation is in **BCNF**.

---

# 11. Food_Item_Category

**Relation**

```
Food_Item_Category(Item_ID, Category_ID)
```

**Primary Key**

```
(Item_ID, Category_ID)
```

**Candidate Keys**

- (Item_ID, Category_ID)

### Functional Dependencies

There are **no non-trivial functional dependencies**.

### BCNF Verification

Since there are no non-trivial functional dependencies, the relation trivially satisfies BCNF.

✅ **Result:** The relation is in **BCNF**.

---

# Conclusion

The **Cafeteria Management System** database schema has been analyzed using the **Boyce-Codd Normal Form (BCNF)** criteria.

For every relation:

- Every non-trivial functional dependency has a **superkey** as its determinant.
- No relation contains **partial dependencies**.
- No relation contains **transitive dependencies**.
- Relations with composite keys have attributes fully functionally dependent on the entire key.
- Junction tables contain only trivial functional dependencies.

Therefore, **all relations satisfy BCNF**, resulting in a schema that minimizes redundancy, prevents insertion, deletion, and update anomalies, and provides a robust, scalable, and efficient database design.
