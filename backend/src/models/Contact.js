const mongoose = require('mongoose');
const mongoosePaginate = require('mongoose-paginate');

const ContactSchema = new mongoose.Schema({
    firstName: {
        type: String,
        required: true,
    },
    lastName: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
    },
    phone: {
        type: String,
        required: true,
    },
    avatar: {
        type: String,
        required: false,
    },
});

ContactSchema.plugin(mongoosePaginate);

mongoose.model('contatos', ContactSchema);