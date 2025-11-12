import React, {useState, useEffect} from "react";
import axios from "axios";
import FormatearNumero from '../components/FormatearNumero'

const Reportes = () => {
    const backendUrl = import.meta.env.VITE_BACKEND_URL;
    const [reportePagos, setReportePagos] = useState([]);
    const [reportePagosTotal, setReportePagosTotal] = useState(0);
    const [fecha, setFecha] = useState("");

    const cargarReportes = () => {
        axios.post(`${backendUrl}/reportes`, {'fecha': fecha}, {withCredentials: true})
            .then((response) => {
                setReportePagos(response.data.reporte_pagos);
                setReportePagosTotal(response.data.total);
            })
            .catch((error) => {
                console.error("Error al obtener los reportes:", error);
            });
        };

useEffect(() => {
  if (fecha) {
    cargarReportes();
  }
}, [fecha]);

useEffect(() => {
  setFecha(new Date().toISOString().split("T")[0]);
}, [backendUrl]);

    return (
        <div>
            <div className="bg-white p-4 rounded-lg shadow-md w-80 text-center mx-auto">
                <input type="date" value={fecha} onChange={(e) => setFecha(e.target.value)} />
            </div>
            {reportePagos.length > 0 ? (
            <div>
            <div className="text-center my-5 text-xl text-green-600">
                Total registrado: <span className="font-bold"><FormatearNumero numero={reportePagosTotal} /></span>
            </div>
            <div className="flex justify-center">
                <table className="w-5/4">
                    <thead>
                        <tr className="bg-green-500 text-white">
                            <th className="border">Pago</th>
                            <th className="border">Monto</th>
                            <th className="border">Cliente</th>
                            <th className="border">Caso</th>
                        </tr>
                    </thead>
                    <tbody>
                        {reportePagos.map((reporte) => (
                            <tr key={reporte.idpago} className="hover:bg-green-100">
                                <td className="border p-2">
                                    <div>
                                        {reporte.pagado == 1 && "CUOTA"}
                                        {reporte.pagado == 2 && "PAGO SIN DETERMINAR"}
                                        {reporte.pagado == 3 && "SALDO RESTANTE"}
                                        {reporte.pagado == 4 && "PAGO INDEPENDIENTE"}
                                    </div>
                                    <div className="text-xs font-bold text-violet-500">{reporte.tipo}</div>
                                    <div className="text-xs font-bold text-violet-500">{reporte.metodo}</div>
                                    {reporte.nombretipopago && (
                                    <div className="text-xs font-bold text-blue-500">Cuenta: {reporte.nombretipopago}</div>
                                    )}
                                </td>
                                <td className="border p-2 font-bold"><FormatearNumero numero={reporte.monto} /></td>
                                <td className="border p-2">{reporte.cliente}</td>
                                <td className="border p-2">{reporte.idcaso} • {reporte.caso}</td>
                            </tr>
                        ))}
                    </tbody>
                </table>
            </div>
            </div>
            ) : (
                <div className="text-center my-5 text-gray-500 font-bold flex justify-center items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="size-5 mr-1">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M10.05 4.575a1.575 1.575 0 1 0-3.15 0v3m3.15-3v-1.5a1.575 1.575 0 0 1 3.15 0v1.5m-3.15 0 .075 5.925m3.075.75V4.575m0 0a1.575 1.575 0 0 1 3.15 0V15M6.9 7.575a1.575 1.575 0 1 0-3.15 0v8.175a6.75 6.75 0 0 0 6.75 6.75h2.018a5.25 5.25 0 0 0 3.712-1.538l1.732-1.732a5.25 5.25 0 0 0 1.538-3.712l.003-2.024a.668.668 0 0 1 .198-.471 1.575 1.575 0 1 0-2.228-2.228 3.818 3.818 0 0 0-1.12 2.687M6.9 7.575V12m6.27 4.318A4.49 4.49 0 0 1 16.35 15m.002 0h-.002" />
                    </svg>
                    No hay pagos registrados para la fecha seleccionada.
                </div>
            )}
        </div>
    )
}

export default Reportes;