﻿using HeyBus.Connection;
using HeyBus.Models;
using MySql.Data.MySqlClient;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HeyBus.Repository
{
    public class RepositoryRota
    {
        MySqlCommand cmd;
        MySqlDataReader dr;
        Conexao conn = new Conexao();

        public void Insert_Rota(Rota rot)
        {
            try
            {
                conn.abrirConexao();
                cmd = new MySqlCommand("SP_Cadastrar_Rota", Conexao.conexao);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@origem", rot.origem_Rota);
                cmd.Parameters.AddWithValue("@destino", rot.destino_Rota);
                cmd.Parameters.AddWithValue("@itinerario", rot.itinerario_Rota.TimeOfDay);
                cmd.Parameters.AddWithValue("@distancia", rot.distancia_Rota);
                cmd.ExecuteNonQuery();
            }
            catch(Exception tu)
            {
                throw;
            }
            finally
            {
                conn.fecharConexao();
            }
        }

        public void Update_Rota(Rota rot)
        {
            try
            {
                conn.abrirConexao();
                cmd = new MySqlCommand("SP_Alterar_Rota", Conexao.conexao);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@origem", rot.origem_Rota);
                cmd.Parameters.AddWithValue("@destino", rot.destino_Rota);
                cmd.Parameters.AddWithValue("@itinerario", rot.itinerario_Rota.TimeOfDay);
                cmd.Parameters.AddWithValue("@distancia", rot.distancia_Rota);
                cmd.ExecuteNonQuery();
            }catch(Exception hj)
            {
                throw;
            }
            finally
            {
                conn.fecharConexao();
            }
        }

        public void Consultar_Rota(Rota rot)
        {
            try
            {
                conn.abrirConexao();
                cmd = new MySqlCommand("SP_Consultar_Rota", Conexao.conexao);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", rot.id_Rota);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    rot.origem_Rota = dr["origem_Rota"].ToString();
                    rot.destino_Rota = dr["destino_Rota"].ToString();
                    rot.itinerario_Rota = Convert.ToDateTime(dr["itinerario_Rota"].ToString());
                    rot.distancia_Rota = dr["distancia_Rota"].ToString();
                }
            }catch(Exception io)
            {
                throw;
            }
            finally
            {
                conn.fecharConexao();
            }
        }

    }
}