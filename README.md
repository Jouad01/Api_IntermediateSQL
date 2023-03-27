# Api_IntermediateSQL

This project combines the flask framework to use the different things learned in this unit: 

- Integrity constraints
- Referential integrity
- Cascading actions in referential integrity
- Date, time or timestamp data types
- Binary large objects
- Domains
- Indexes
- Users
- Privileges
- Roles


## Installation

First, clone the repository to your local machine:

```bash
git clone
```

Then, create a virtual environment (but its not necessary) and activate it:

```bash
python3 -m venv venv
source venv/bin/activate
```

Install the framework flask and mysql-connector-python:

```bash
pip install flask
pip install mysql-connector-python
```

Once you have the database created, it is important to keep a few things in mind:

The path of the images must be modified in the file **insert_img.py**.

If your username and password are different, too.

It is also necessary to use the following command

```bash
ALTER table products modify image MEDIUMBLOB;
```

to be able to correctly insert the images into the table, otherwise the error 'Data too long for column' will
appear.

---

**Keep in mind that you must do the inserts from the Suppliers table, since by belonging as a column in the 'Products' table, it is necessary to make sure that the ids that are inserted are part of the 'Suppliers' table.**