const request = require('supertest');
const app = require('./index');

describe('GET /', () => {
  it('responds with "Hello, world!"', async () => {
    const response = await request(app).get('/');
    expect(response.status).toBe(200);
    expect(response.text).toBe('Hello, world!');
  });
});