const mongoose = require("mongoose");

const Contact = mongoose.model("contatos");

module.exports = {
    async index(req, res) {
        const { page = 1 } = req.query;
        const contacts = await Contact.paginate({}, { page, limit: 50 });

        return res.json(contacts)
    },

    async show(req, res) {
        const contact = await Contact.findById(req.params.id);

        return res.json(contact);
    },

    async store(req, res) {


        const contact = await Contact.create(req.body);

        return res.json(contact);
    },

    async update(req, res) {
        const contact = await Contact.findByIdAndUpdate(req.params.id, req.body, { new: true })

        return res.json(contact);
    },

    async destroy(req, res) {
        await Contact.findByIdAndRemove(req.params.id);

        return res.send();
    }
};