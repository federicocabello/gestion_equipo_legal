import { createRoot } from "react-dom/client"
import App from "./App"
import { BrowserRouter } from "react-router-dom"
import "./index.css"

const rootElement = document.getElementById("root");
if (!rootElement) {
  throw new Error("No se encontró un elemento con id 'root'. Asegúrate de que exista en tu index.html.");
}

const root = createRoot(rootElement);
root.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>
);
