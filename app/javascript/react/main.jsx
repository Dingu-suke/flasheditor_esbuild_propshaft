// app/javascript/react/main.jsx
import React from "react";
import { createRoot } from "react-dom/client";
import App from "./App"; // "./App" のパスが正しいか再確認

const rootElement = document.getElementById("monaco");
if (rootElement) {
  createRoot(rootElement).render(
    <>
      <App />
    </>
  );
}
