// swagger-options.ts
export const swaggerOptions = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "My TypeScript API",
      version: "1.0.0",
      description: "API documentation for my TypeScript application",
    },
    servers: [
      {
        url: "http://localhost:5000/api/v1",
        description: "Development server",
      },
    ],
  },
  apis: ["./src/routes/**/*.ts", "./src/controller/**/*.ts"],
};
