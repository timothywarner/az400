'use strict';
const config = require('../config');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
const server = require('../app');

chai.use(chaiHttp);

describe('/GET', () => {
    it('returns the who page', (done) => {
        chai.request(`http://localhost:${config.port}`)
            .get('/who')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('Who We Are');
                done();
            });
    });
});
