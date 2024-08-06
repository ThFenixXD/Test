<%@ Page Title="" Language="C#" MasterPageFile="~/AppTeste.Master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="AppTest.usuarios" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- PAINEL CADASTRO USUÁRIOS --%>

    <asp:Panel ID="pnlCadastroUsuarios" runat="server" Visible="false">

        <h2>Dados Gerais</h2>

        <div class="form-floating">
            <asp:TextBox ID="txtPrimeiroNome" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblPrimeiroNome" AssociatedControlID="txtPrimeiroNome" runat="server" Text="Primeiro Nome" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtUltimoNome" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblUltimoNome" AssociatedControlID="txtUltimoNome" runat="server" Text="Último Nome" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblEmail" AssociatedControlID="txtEmail" runat="server" Text="Email" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblSenha" AssociatedControlID="txtSenha" runat="server" Text="Senha" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtConfirmarSenha" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblConfirmarSenha" AssociatedControlID="txtConfirmarSenha" runat="server" Text="Confirma Senha" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtTelefone" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblTelefone" AssociatedControlID="txtTelefone" runat="server" Text="Telefone" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtDataNascimento" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblDataNascimento" AssociatedControlID="txtDataNascimento" runat="server" Text="Data de Nascimento" CssClass="form-label"></asp:Label>
        </div>

        <h2>Dados Endereço</h2>

        <div class="form-floating">
            <asp:TextBox ID="txtCep" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblCep" AssociatedControlID="txtCep" runat="server" Text="CEP" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblEndereco" AssociatedControlID="txtEndereco" runat="server" Text="Endereço" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblNumero" AssociatedControlID="txtNumero" runat="server" Text="Número" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblBairro" AssociatedControlID="txtBairro" runat="server" Text="Bairro" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblCidade" AssociatedControlID="txtCidade" runat="server" Text="Cidade" CssClass="form-label"></asp:Label>
        </div>

        <div class="form-floating">
            <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblEstado" AssociatedControlID="txtEstado" runat="server" Text="Estado" CssClass="form-label"></asp:Label>
        </div>

        <asp:Button ID="btn_salvar" runat="server" Text="Salvar" OnClick="btn_salvar_Click" />

    </asp:Panel>

    <%-- PAINEL GRID USUÁRIOS --%>

    <asp:Panel ID="pnlGridUsuarios" CssClass="d-flex flex-column h-100 p-3" runat="server" Visible="true">

        <div class="card-header">
            <asp:Button ID="btn_Voltar" runat="server" Text="Voltar" />
            <asp:Button ID="btn_NovoUsuario" runat="server" Text="Novo Usuário" OnClick="btn_NovoUsuario_Click"/>
        </div>


        <telerik:RadGrid
            ID="GridUsuarios"
            runat="server"
            CssClass="mt-3 h-100"
            AutoGenerateColumns="false"
            OnNeedDataSource="GridUsuarios_NeedDataSource"
            OnItemCommand="GridUsuarios_ItemCommand">

            <GroupingSettings CollapseAllTooltip="collapse all columns" />

            <MasterTableView DataKeyNames="cdUsuario">

                <Columns>
                    <telerik:GridTemplateColumn>
                        <ItemTemplate>
                            <div class="dropdown show">
                                <button class="btn_profile btn btn-primary" style="border-radius: 25px" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="bi bi-list"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <asp:LinkButton ID="lblEditar" class="dropdown-item" runat="server" CommandName="opEditar">
                                                            <span class="ddl_editar"><i class="bi bi-pencil-square"></i></span>
                                                            <span class="ddlEditar">Editar</span>
                                        </asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lblExcluir" class="dropdown-item" runat="server" CommandName="opExcluir">
                                                            <span class="ddl_excluir"><i class="bi bi-trash"></i></span>
                                                            <span class="ddlExcluir">Excluir</span>
                                        </asp:LinkButton></li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn
                        HeaderText="cdUsuario"
                        DataField="Cod">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Usuário"
                        DataField="nome_completo">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Email"
                        DataField="email">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Senha"
                        DataField="senha">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Data de Nascimento"
                        DataField="data_nascimento"
                        DataFormatString="{0:dd/MM/yyyy}">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Telefone"
                        DataField="telefone">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Endereço"
                        DataField="endereco">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Número"
                        DataField="numero">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Bairro"
                        DataField="bairro">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Cidade"
                        DataField="cidade">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Estado"
                        DataField="estado">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn
                        HeaderText="Data de Criação"
                        DataField="dataRegistro"
                        DataFormatString="{0:dd/MM/yyyy}">
                    </telerik:GridBoundColumn>
                </Columns>

            </MasterTableView>

        </telerik:RadGrid>
    </asp:Panel>

    <asp:HiddenField ID="hdfId" runat="server" />
</asp:Content>
