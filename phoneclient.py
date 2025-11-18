import psycopg2
conn = psycopg2.connect(database="netology_db", user="postgres", password="1234")

def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS clients (
            id SERIAL PRIMARY KEY,
            first_name TEXT NOT NULL,
            last_name TEXT NOT NULL,
            email TEXT UNIQUE
        );    
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS phones (
            id SERIAL PRIMARY KEY,
            client_id INTEGER NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
            phone TEXT UNIQUE
        );    
        """)
    conn.commit()
    print("Структура БД создана")

def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        try:
            cur.execute("""INSERT INTO clients (first_name, last_name, email) VALUES (%s, %s, %s);""",
                        (first_name, last_name, email))
            client_id = cur.fetchone()[0]
            if phones:
                for p in phones:
                    cur.execute("""INSERT INTO phones (client_id, phone) VALUES (%s, %s);""",(client_id, p))
            conn.commit()
            print(f"Клиент добавлен:id={client_id}, {first_name}, {last_name}")
            return client_id
        except Exception as e:
            conn.rollback()
            print("Ошибка при добавлении клиента", e)
            raise

def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        try:
            cur.execute("""INSERT INTO phones (client_id, phone) VALUES (%s, %s);""",(client_id, phone))
            conn.commit()
            print(f"Телефон{phone} добавлен клиентуid={client_id}")
        except Exception as e:
            conn.rollback()
            print("Ошибка при добавлении телефона", e)
            raise


conn.close()
