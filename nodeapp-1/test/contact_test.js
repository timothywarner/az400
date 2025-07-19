'use strict';
const config = require('../config');
const chai = require('chai');
const chaiHttp = require('chai-http');
const should = chai.should();
const app = require('../app');

chai.use(chaiHttp);

describe('/GET contact', () => {
    it('returns the contact page', (done) => {
        chai.request(app)
            .get('/contact')
            .end((err, res) => {
                res.should.have.status(200);
                res.text.should.contain('Contact information');
                done();
            });
    });
});