import os
from flask import Flask
from flask_mysqldb import MySQL

# Inicializar app Flask y cargar configuración desde config.py
app = Flask(__name__)
app.config.from_object('config.DevelopmentConfig')  # O reemplazá con tu clase real

mysql = MySQL(app)

def migrar_documentos():
    carpeta_pdfs = "/home/flask/gestion_equipo_legal/Documents"
    archivos = [f for f in os.listdir(carpeta_pdfs) if os.path.isfile(os.path.join(carpeta_pdfs, f))]
    total = len(archivos)

    archivos_insertados = 0
    errores = 0
    errores_log = []

    cursor = mysql.connection.cursor()

    for i, archivo in enumerate(archivos, start=1):
        ruta_completa = os.path.join(carpeta_pdfs, archivo)

        try:
            with open(ruta_completa, 'rb') as f:
                binario = f.read()
                cursor.execute(
                    "INSERT INTO documentos (cliente, caso, nombre, documento, clasificacion, fecha, creador) VALUES (1, 5, %s, %s, 0, NOW(), 1)",
                    (archivo, binario)
                )
                archivos_insertados += 1

            if i % 100 == 0:
                mysql.connection.commit()
                print(f"[{i}/{total}] ✅ Commit parcial - Insertados: {archivos_insertados} / Errores: {errores}")

        except Exception as e:
            errores += 1
            errores_log.append(f"{archivo}: {e}")
            print(f"❌ Error con archivo {archivo}: {e}")

    mysql.connection.commit()
    cursor.close()

    if errores > 0:
        with open("errores_migracion.txt", "w") as f:
            f.write("\n".join(errores_log))

    print(f"\n🚀 Migración finalizada.\nInsertados: {archivos_insertados}\nErrores: {errores}")

if __name__ == "__main__":
    with app.app_context():
        migrar_documentos()
