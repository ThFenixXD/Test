using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppTest.Util;

namespace AppTest
{
    public partial class usuarios : PageBase
    {
        #region Métodos

        protected void LimpaCampos()
        {
            txtPrimeiroNome.Text =
            txtUltimoNome.Text =
            txtEmail.Text =
            txtSenha.Text =
            txtConfirmarSenha.Text =
            txtDataNascimento.Text =
            txtTelefone.Text =
            txtEndereco.Text =
            txtNumero.Text =
            txtBairro.Text =
            txtCidade.Text =
            txtEstado.Text =
            hdfId.Value = "";
        }

        protected void PopulaCamposUsuário(int _cdUsuario)
        {
            using (dbTestEntities ctx = new dbTestEntities())
            {
                int cdUsuario = _cdUsuario;
                hdfId.Value = _cdUsuario.ToString();

                var usuario = (from objUsuario in ctx.tb_usuarios
                               where objUsuario.cdUsuario == cdUsuario
                               select objUsuario).FirstOrDefault();

                txtPrimeiroNome.Text = usuario.primeiro_nome;
                txtUltimoNome.Text = usuario.ultimo_nome;
                txtEmail.Text = usuario.email;
                txtSenha.Text = usuario.senha;
                txtDataNascimento.Text = usuario.data_nascimento.ToString();
                txtTelefone.Text = usuario.telefone;
                txtEndereco.Text = usuario.endereco;
                txtNumero.Text = usuario.numero;
                txtBairro.Text = usuario.bairro;
                txtCidade.Text = usuario.cidade;
                txtEstado.Text = usuario.estado;
            }
        }

        protected bool Compara2Strings(string value1, string value2)
        {
            return value1 == value2;
        }

        protected void AtualizaGridUsuarios()
        {
            GridUsuarios.DataSource = Framework.GetDataTable("SELECT cdUsuario, nome_completo, email, senha, data_nascimento, telefone, endereco, numero, bairro, cidade, estado, dataRegistro FROM tb_usuarios WHERE deleted = 0");
            GridUsuarios.DataBind();
        }

        #endregion

        #region Page_Load

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        #endregion

        #region ItemCommand
        protected void GridUsuarios_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int cdUsuario = Convert.ToInt32(e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["cdUsuario"]);

            switch (e.CommandName)
            {
                case "opEditar":
                    EscondePaineis(pnlGridUsuarios);
                    pnlCadastroUsuarios.Visible = true;
                    LimpaCampos();
                    PopulaCamposUsuário(cdUsuario);
                    break;

                case "opExcluir":

                    using (dbTestEntities ctx = new dbTestEntities())
                    {
                        var query = (from obj in ctx.tb_usuarios
                                     where obj.cdUsuario == cdUsuario
                                     select obj).FirstOrDefault();

                        if (query != null)
                        {
                            query.deleted = 1;
                            ctx.SaveChanges();
                            AtualizaGridUsuarios();
                        }
                        else
                        {
                            Framework.Alerta("Erro", "Falha ao excluir registro", "Error");
                        }
                    }
                    break;
            }
        }
        #endregion

        #region NeedDataSource
        protected void GridUsuarios_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            GridUsuarios.DataSource = Framework.GetDataTable("SELECT cdUsuario, nome_completo, email, senha, data_nascimento, telefone, endereco, numero, bairro, cidade, estado, dataRegistro FROM tb_usuarios WHERE deleted = 0");
        }
        #endregion

        #region Click
        protected void btn_NovoUsuario_Click(object sender, EventArgs e)
        {
            EscondePaineis(pnlGridUsuarios);
            pnlCadastroUsuarios.Visible = true;
        }

        protected void btn_salvar_Click(object sender, EventArgs e)
        {
            using (dbTestEntities ctx = new dbTestEntities())
            {
                tb_usuarios usuario = new tb_usuarios();

                if (!string.IsNullOrEmpty(hdfId.Value))
                {
                    int cdUsuario = Convert.ToInt32(hdfId.Value);

                    var queryUsuario = (from objUsuario in ctx.tb_usuarios
                                        where objUsuario.cdUsuario == cdUsuario
                                        select objUsuario);

                    if (queryUsuario != null)
                    {
                        usuario = queryUsuario.FirstOrDefault();
                    }
                }

                usuario.primeiro_nome = txtPrimeiroNome.Text;
                usuario.ultimo_nome = txtUltimoNome.Text;
                usuario.nome_completo = usuario.primeiro_nome + " " + usuario.ultimo_nome;
                usuario.email = txtEmail.Text.Trim();
                usuario.data_nascimento = Convert.ToDateTime(txtDataNascimento.Text);
                usuario.telefone = Framework.FormatWithMask(txtTelefone.Text.Trim(), "(##) #####-####");
                usuario.endereco = txtEndereco.Text.Trim();
                usuario.numero = txtNumero.Text.Trim();
                usuario.bairro = txtBairro.Text.Trim();
                usuario.cidade = txtCidade.Text.Trim();
                usuario.estado = txtEstado.Text.Trim();
                if (Compara2Strings(txtSenha.Text, txtConfirmarSenha.Text))
                {
                    usuario.senha = txtSenha.Text;
                    usuario.dataRegistro = DateTime.Now;

                    ctx.tb_usuarios.Add(usuario);
                    ctx.SaveChanges();
                }
                else
                {
                    Framework.Alerta("Erro, ", "Senhas Incorretas", " Error");
                }
            }
        }

        #endregion
    }
}