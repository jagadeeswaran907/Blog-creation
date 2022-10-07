const express = require('express');
// calling an router
const router = express.Router();
const multer = require('multer');
const storage = multer.diskStorage({

    destination: function (req, file, cb) {

        cb(null, './uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, new Date().toISOString().replace(/:/g, '-') + '-' +  file.originalname);
    }
});
// need to upload the file or not
const fileFilter = (req, file, cb) => {
    if (true) {
        cb(null, true)
    } else {
        cb(null, false)
    }
}

// const uploads = multer({dest:'uploads/'})
const uploads = multer({ storage: storage, fileFilter: fileFilter })


 router.post("/post-create", uploads.single('image'), (req, res) => {

const file = req.file;
 // router.post("/user-post-create", (req, res) => {

    connection.query("call Create_Post (?,?,?,?,?)", [req.body.posttitle,file.image,req.body.starRating,req.body.Price,req.body.createdBy
        ],
     (error, results, fields) => {
        if (error) {
            res.status(400).json({msg: "Something went wrong", status_code: 400});
        } else {
            res.status(200).json(results[0]);
        }
    });
});


router.get("/post-get", (req, res) => {

    connection.query("call Get_Post ()", [],
     (error, results, fields) => {
        if (error) {
            res.status(400).json({msg: "Something went wrong", sttus_code: 400});
        } else {
            res.status(200).json(results[0]);
        }
    });
});
router.get("/post-delete", (req, res) => {

    connection.query("call Delete_Post (?)", [req.body.ID],
     (error, results, fields) => {
        if (error) {
            res.status(400).json({msg: "Something went wrong", sttus_code: 400});
        } else {
            res.status(200).json(results[0]);
        }
    });
});

module.exports = router;