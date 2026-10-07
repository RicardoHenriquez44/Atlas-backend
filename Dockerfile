FROM node:18-alpine

WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias bloqueando scripts automáticos
RUN npm ci --only=production --ignore-scripts

# Copiar código de la aplicación
COPY src/ ./src/
COPY sql/ ./sql/
COPY uploads/ ./uploads/

# Crear directorio para uploads y asignar permisos al usuario "node"
RUN mkdir -p uploads/contracts && chown -R node:node /app

# Cambiar del usuario root al usuario seguro "node"
USER node

# Exponer puerto
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "src/app.js"]