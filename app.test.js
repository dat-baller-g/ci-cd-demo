const request = require('supertest');
const app = require('./index');
let server;

beforeAll(() => {
  server = require("./index");
});

describe('Health check', () => {
  it('should return OK', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
  });
});

afterAll((done) => {
  server.close(done);
});