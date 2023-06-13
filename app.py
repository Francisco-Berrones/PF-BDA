from flask import Flask, render_template, request, make_response
from flask_mysqldb import MySQL
from datetime import datetime
from flask import abort
import ast
import random

app= Flask(__name__)
mysql=MySQL(app)
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='usuario'
app.config['MYSQL_PASSWORD']='666'
app.config['MYSQL_DB']='MochisHotel'

print("Conexion Exitosa :D")

@app.route('/')
def inicio():
    return render_template('index.html')


@app.route('/disponible', methods=['GET'])
def disponible():
    fecha_entrada = request.args.get('popupDatepickerfrom1Modal')
    fecha_salida = request.args.get('popupDatepickerto1Modal')


    if fecha_entrada is None or fecha_salida is None:
        abort(400, description="Both 'popupDatepickerfrom1Modal' and 'popupDatepickerto1Modal' must be provided.")

    cur = mysql.connection.cursor()
    cur.callproc('ObtenerHabitacionesDisponibles', (datetime.strptime(fecha_entrada, "%m/%d/%Y"), datetime.strptime(fecha_salida, "%m/%d/%Y")))
    datos = cur.fetchall()
    cur.nextset()
    cur.close()

    return render_template('buscar.html', hab=datos, fecha_entrada=fecha_entrada, fecha_salida=fecha_salida)


@app.route('/reservar', methods=['POST'])
def reservar():
    id = request.form['id']
    fechaEntrada = request.form['fechaIn']
    fechaSalida = request.form['fechaOut']
    return render_template('reserva.html', id=id, fechaEntrada=fechaEntrada, fechaSalida=fechaSalida)

@app.route('/reservacion', methods=['POST'])
def reservacion():
    fechaEntrada = request.form['fecha_entrada']
    fechaSalida = request.form['fecha_salida']
    nombre = request.form['nombre']
    apellido = request.form['apellido']
    email = request.form['email']
    telefono = request.form['telefono']
    idr=random.randint(100, 999)
    idc=random.randint(100, 999)
    idHabitacion_str = request.form.get('id')
    if idHabitacion_str is not None:
        idHabitacion = int(request.form.get('id'))
    else:
        return "Error: No se ha proporcionado un id de habitación."
    fecha_entrada_obj = datetime.strptime(fechaEntrada, "%m/%d/%Y")
    fecha_salida_obj = datetime.strptime(fechaSalida, "%m/%d/%Y")
    fecha_entrada_str = fecha_entrada_obj.strftime("%Y-%m-%d")
    fecha_salida_str = fecha_salida_obj.strftime("%Y-%m-%d")
    cur = mysql.connection.cursor()
    cur.callproc('ReservacionCliente', (nombre, apellido, telefono, email, idc,))
    mysql.connection.commit()
    cur.nextset()
    cur.callproc('Reservacion', (fecha_entrada_str, fecha_salida_str, idHabitacion, idr, idc,))
    mysql.connection.commit()
    cur.nextset()
    cur.close()
    return render_template('index.html')

@app.route('/cuartos')
def cuartos():
    return render_template('cuartos.html')

@app.route('/paquetes')
def paquetes():
    return render_template('paquetes.html')

@app.route('/contacto')
def contacto():
    return render_template('contacto.html')

@app.route('/HabitacionClasica')
def habitacionC():
    return render_template('habitacion1.html')

@app.route('/HabitacionDeluxe')
def habitacionD():
    return render_template('habitacion2.html')

@app.route('/HabitacionUltraSuite')
def habitacionU():
    return render_template('habitacion3.html')

@app.route('/Factura')
def facturacion():
    return render_template('facturacion.html')

@app.route('/ChecarReservacion')
def checarReservacion   ():
    return render_template('checarID.html')

@app.route('/mostrarReservacion' ,methods=['POST'])
def mostrar():
    idr=request.form['idReserva']
    cur=mysql.connection.cursor()
    cur.callproc('MostrarReservacion', (idr,))
    datos=cur.fetchall()
    cur.nextset()
    cur.close()
    return render_template('stored.html', datos=datos)

if __name__=='__main__':
    app.run(debug=True)