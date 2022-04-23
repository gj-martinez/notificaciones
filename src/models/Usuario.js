import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";
import { Mensaje }from "./Mensaje.js"

export const Usuario = sequelize.define(
  "usuarios",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING,
    },
    usuario: {
        type: DataTypes.STRING,
    },
    password: {
      type: DataTypes.STRING,
    },
  },
  {
    timestamps: true,
  }
);

Usuario.hasMany(Mensaje,{
    foreinkey: "userId",
    sourceKey: "id",
})

Mensaje.belongsTo(Usuario,{
    foreinkey: "userId",
    targetId: "id"
})