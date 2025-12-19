const request = require('supertest');
const { app } = require('./index');

describe('Health check', () => {
  it('should return OK', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('OK');
  });
});