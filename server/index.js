const express = require("express");

const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const dbUrl =
  "mongodb+srv://khaled:Jkx8OeZwCWhr12FY@cluster0.kabwr.mongodb.net/amazon_clone?retryWrites=true&w=majority";

const app = express();
const PORT = 3000;

//midleware
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(dbUrl)
  .then(() => {
    console.log("Connected to Database");
  })
  .catch((err) => {
    console.log("can't connect to Database: " + err.message);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
