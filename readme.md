How to install
==============

**[ ! ] REQUIRE python >= 3.10.11 [ ! ]**

With Docker
--------------

1. Cloning git repository and switch to repository folder:
```
git clone https://github.com/catdeveloper-com/cars_api
cd cars_api
```
2. Run containers: `docker-compose up -d`
3. import `dump.sql` to PostgreSQL DB:
- For windows Power Shell: `Get-Content dump.sql | docker-compose exec -T db psql -U your_db_username -d your_database_name`
- For windows CMD and Linux(debians dist.): `docker-compose exec -T db psql -U your_db_username -d your_database_name < dump.sql`
4. Login to Django admin panel with this credentials:
- username: `admin`
- password: `123`
- panel url: `http://host:port/admin/`

Without Docker
--------------

1. Cloning git repository and switch to repository folder:
```
git clone https://github.com/catdeveloper-com/cars_api
cd cars_api
```
2. Create virtual environment: `python -m venv .venv`
3. Activate your virtual environment:
- For windows: `.venv\Scripts\activate`
- For linux(debians dist.): `source .venv/bin/activate`
4. Install requirements:
- For windows: `pip install -r requirements.txt`
- For linux: `pip3 install -r requirements-linux.txt`
5. Copy and rename file `.env.example` to `.env`, after this, fill environments variables with your data  
6. Switch to project directory: `cd project`
7. Run dev web server: `python manage.py runserver`
8. Import `dump.sql` to PostgreSQL DB: `psql --username=your_db_username your_database_name < dump.sql`
9. Login to Django admin panel with this credentials:
- username: `admin`
- password: `123`
- panel url: `http://host:port/admin/`

### Registered users

- Admin:
    - username: `admin`
    - email: `adm@adm.adm`
    - password: `123`
- Test:
  - username: `test`
  - email: `test@test.test`
  - password: `QWEasd!123`
