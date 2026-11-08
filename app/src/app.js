const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Lab app rodando via Docker 🚀");
});

app.get("/health", (req, res) => {
  res.status(200).json({ status: "ok" });
});

module.exports = app;
