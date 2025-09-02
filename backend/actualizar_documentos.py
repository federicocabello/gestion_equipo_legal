from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config.from_object('config.DevelopmentConfig')  # O reemplazá con tu clase real

mysql = MySQL(app)

def actualizar_documentos_en_bloques(tamano_bloque=1000):
    with app.app_context():
        cursor = mysql.connection.cursor()
        try:
            while True:
                update_query = """
                UPDATE documentos d
                JOIN casos c ON d.caso = c.id
                SET d.cliente = c.idcliente
                WHERE d.cliente IS NULL
                LIMIT %s;
                """
                filas_afectadas = cursor.execute(update_query, (tamano_bloque,))
                mysql.connection.commit()
                print(f"{filas_afectadas} registros actualizados.")

                if filas_afectadas < tamano_bloque:
                    print("Actualización completada.")
                    break
        except Exception as e:
            print("Error:", e)
        finally:
            cursor.close()

if __name__ == "__main__":
    actualizar_documentos_en_bloques()

