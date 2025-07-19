'use strict';
const config = require('../config');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
const app = require('../app');

chai.use(chaiHttp);

describe('/GET who', () => {
    it('returns the who page', (done) => {
        chai.request(app)
            .get('/who')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('Who are you?');
                done();
            });
    });
});