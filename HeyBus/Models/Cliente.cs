﻿using HeyBus.Validations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace HeyBus.Models
{
    public class Cliente
    {
        [Key]
        public int id_Cliente { get; set; }

        [Display (Name ="CPF do cliente"), MaxLength(14), Required]
        public string cpf_Cliente { get; set; }

        [Display (Name ="Nome do cliente"), MaxLength(70), Required]
        public string nome_Cliente { get; set; }

        public DateTime nascimento_Cliente { get; set; }

        [Display (Name ="Telefone do cliente"), MaxLength(20), Required]
        public string tel_Cliente { get; set; }

        [Display (Name ="Celular do cliente"), MaxLength(20), Required]
        public string cel_Cliente { get; set; }
        
        [Display (Name ="E-mail do cliente"), MaxLength(60), Required]
        public string email_Cliente { get; set; }

        [Display(Name = "Nome de usuário"), MaxLength(25), Required]
        public string usuario_Cliente { get; set; }

        [Display(Name = "Senha do usuário"), MaxLength(25), Required]
        public string senha_Cliente { get; set; }
    }
}