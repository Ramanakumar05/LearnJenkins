const assert = require('assert');
const { add } = require('../index');

describe('add()', function() {
    it('should return 5 for 2 + 3', function() {
        assert.strictEqual(add(2, 3), 5);
    });
});