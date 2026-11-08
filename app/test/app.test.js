const { test, before, after } = require("node:test");
const assert = require("node:assert/strict");
const app = require("../src/app");

let server;
let baseUrl;

before(async () => {
  // Porta 0 = o sistema escolhe uma porta livre
  server = app.listen(0);
  await new Promise((resolve) => server.once("listening", resolve));
  baseUrl = `http://127.0.0.1:${server.address().port}`;
});

after(() => server.close());

test("GET /health retorna 200 e status ok", async () => {
  const res = await fetch(`${baseUrl}/health`);
  assert.equal(res.status, 200);
  assert.deepEqual(await res.json(), { status: "ok" });
});

test("GET / retorna 200", async () => {
  const res = await fetch(`${baseUrl}/`);
  assert.equal(res.status, 200);
});
