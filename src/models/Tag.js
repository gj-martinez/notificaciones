import { DataTypes } from "sequelize";
import { sequelize } from "../database/database.js";
import { Mensaje }from "./Mensaje.js"


export const Tag = sequelize.define(
  "tags",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    nombre: {
      type: DataTypes.STRING,
    },
    descripcion: {
        type: DataTypes.STRING,
    },
    inicio: {
      type: DataTypes.DATE,
    },
    final: {
        type: DataTypes.DATE,
      },
  },
  {
    timestamps: true,
  }
);
Tag.hasOne(Mensaje,{
    foreinkey: "tagId",
    sourceKey: "id",
})

Mensaje.belongsTo(Tag,{
    foreinkey: "tagId",
    targetId: "id"
})