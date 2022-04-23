import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";



export const Mensaje = sequelize.define(
  "mensajes",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    descripcion: {
      type: DataTypes.STRING(12340),
    },
    leido: {
        type: DataTypes.BOOLEAN,
        defaultValue: false
    },
    suscripto: {
      type: DataTypes.BOOLEAN,
      defaultValue: false
  },
  },
  {
    timestamps: true,
  }
);
