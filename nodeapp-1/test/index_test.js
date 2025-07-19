'use strict';
const config = require('../config');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
const app = require('../app');

chai.use(chaiHttp);

describe('/GET', () => {
    it('returns the homepage', (done) => {
        chai.request(app)
            .get('/')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('Welcome to GitHub Copilot Training!');
                done();
            });
    });
});