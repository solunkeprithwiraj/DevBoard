import express from "express";
import dotenv from "dotenv";
import signupRoutes from "./routes/auth/signup.route";
import loginRoutes from "./routes/auth/login.route";
import swaggerUi from "swagger-ui-express";
import { swaggerOptions } from "./swagger-options";
import swaggerJSDoc from "swagger-jsdoc";
dotenv.config();

const app = express();

app.use(express.json());

app.use("/api/v1/auth", signupRoutes);
app.use("/api/v1/auth", loginRoutes);

const specs = swaggerJSDoc(swaggerOptions);
app.use("/api/v1/docs", swaggerUi.serve, swaggerUi.setup(specs));

app.listen(5000, () => {
  console.log("Server is running on port 5000");
});
