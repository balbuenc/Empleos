<%@ Page Title="Postulantes" Language="C#" MasterPageFile="~/Boot.Master" AutoEventWireup="true" CodeBehind="Postulante.aspx.cs" Inherits="Empleos.Postulante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-header">
        <div class="alert alert-primary" role="alert">
            <div class="row">
                <div class="col-10">
                    <b><%: Page.Title %> </b>

                </div>
                <div class="col-2">
                    <button class="btn btn-primary" type="button" runat="server" id="AddLicitacionBtn" data-toggle="modal" data-target="#addModal">
                        <i class="fas fa-plus"></i>
                    </button>
                </div>
            </div>
            <div class="row alert-info">
                <asp:Label ID="ErrorLabel" runat="server" Visible="False" CssClass="form-control" />
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <asp:ListView ID="PostulanteListView"
            runat="server"
            DataSourceID="PostulanteDS"
            DataKeyNames="IdPostulante"
            OnItemCommand="ListView_ItemCommand">
            <LayoutTemplate>
                <div class="table responsive">
                    <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                        <thead>
                            <th>IdPostulante</th>
                            <th>cod_funcionario</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Login</th>
                            <th>IdTipoDocumento</th>
                            <th>NumeroDocumento</th>
                            <th>FechaNacimiento</th>
                            <th>Sexo</th>
                            <th>IdEstadoCivil</th>
                            <th>IdCiudad</th>
                            <th>IdNacionalidad</th>
                            <th>EsFuncionario</th>
                            <th>IdBachillerato</th>
                            <th>FormacionUniversitaria</th>
                            <th>IdCarrera</th>
                            <th>IdUniversidad</th>
                            <th>...</th>
                            <th>...</th>
                        </thead>
                        <tbody>
                            <tr runat="server" id="itemPlaceholder" />
                        </tbody>
                    </table>
                </div>
            </LayoutTemplate>
            <ItemTemplate>

                <tr>
                    <td>
                        <asp:Label ID="lblIdPostulante" runat="server" Text='<%# Eval("IdPostulante") %>' /></td>
                    <td>
                        <asp:Label ID="lblcod_funcionario" runat="server" Text='<%# Eval("cod_funcionario") %>' /></td>
                    <td>
                        <asp:Label ID="lblNombres" runat="server" Text='<%# Eval("Nombres") %>' /></td>
                    <td>
                        <asp:Label ID="lblApellidos" runat="server" Text='<%# Eval("Apellidos") %>' /></td>
                    <td>
                        <asp:Label ID="lblLogin" runat="server" Text='<%# Eval("Login") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdTipoDocumento" runat="server" Text='<%# Eval("IdTipoDocumento") %>' /></td>
                    <td>
                        <asp:Label ID="lblNumeroDocumento" runat="server" Text='<%# Eval("NumeroDocumento") %>' /></td>
                    <td>
                        <asp:Label ID="lblFechaNacimiento" runat="server" Text='<%# Eval("FechaNacimiento") %>' /></td>
                    <td>
                        <asp:Label ID="lblSexo" runat="server" Text='<%# Eval("Sexo") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdEstadoCivil" runat="server" Text='<%# Eval("IdEstadoCivil") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdCiudad" runat="server" Text='<%# Eval("IdCiudad") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdNacionalidad" runat="server" Text='<%# Eval("IdNacionalidad") %>' /></td>
                    <td>
                        <asp:Label ID="lblEsFuncionario" runat="server" Text='<%# Eval("EsFuncionario") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdBachillerato" runat="server" Text='<%# Eval("IdBachillerato") %>' /></td>
                    <td>
                        <asp:Label ID="lblFormacionUniversitaria" runat="server" Text='<%# Eval("FormacionUniversitaria") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdCarrera" runat="server" Text='<%# Eval("IdCarrera") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdUniversidad" runat="server" Text='<%# Eval("IdUniversidad") %>' /></td>


                    <th>
                        <asp:LinkButton CssClass="btn btn-info" runat="server" ID="EditPostulanteBtn" CommandName="Editar" CommandArgument='<%# Eval("IdPostulante")%>' ToolTip="Editar">
                            <i class="fa fa-keyboard fa-sm"></i>
                        </asp:LinkButton>
                    </th>

                    <th>

                        <asp:LinkButton CssClass="btn btn-danger" runat="server" ID="DeletePostulanteBtn" CommandName="Eliminar" CommandArgument='<%# Eval("IdPostulante")%>' ToolTip="Eliminar">
                            <i class="fa  fa-eraser fa-sm"></i>
                        </asp:LinkButton>

                    </th>

                </tr>

            </ItemTemplate>
            <EditItemTemplate>
            </EditItemTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
        </asp:ListView>

        <!-- #region Modals -->
        <div id="addModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <b id="addModalLabel">Agregar nueva Postulante.</b>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <asp:FormView ID="InsertFormView" runat="server" DataSourceID="PostulanteDS" Width="100%"
                                    CellPadding="4" DataKeyNames="IdPostulante" ForeColor="#333333"
                                    DefaultMode="Insert"
                                    OnItemInserted="FormView1_ItemInserted">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <InsertItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-3">IdPostulante</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdPostulante" runat="server" Text="" CssClass="form-control" Font-Size="X-Small" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">cod_funcionario</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtcod_funcionario" runat="server" Text='<%# Bind("cod_funcionario") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Nombres</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNombres" runat="server" Text='<%# Bind("Nombres") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Apellidos</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtApellidos" runat="server" Text='<%# Bind("Apellidos") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Login</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtLogin" runat="server" Text='<%# Bind("Login") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdTipoDocumento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdTipoDocumento" runat="server" Text='<%# Bind("IdTipoDocumento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">NumeroDocumento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNumeroDocumento" runat="server" Text='<%# Bind("NumeroDocumento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">FechaNacimiento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Sexo</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtSexo" runat="server" Text='<%# Bind("Sexo") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdEstadoCivil</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdEstadoCivil" runat="server" Text='<%# Bind("IdEstadoCivil") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdCiudad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdCiudad" runat="server" Text='<%# Bind("IdCiudad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdNacionalidad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdNacionalidad" runat="server" Text='<%# Bind("IdNacionalidad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">EsFuncionario</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtEsFuncionario" runat="server" Text='<%# Bind("EsFuncionario") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdBachillerato" runat="server" Text='<%# Bind("IdBachillerato") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">FormacionUniversitaria</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtFormacionUniversitaria" runat="server" Text='<%# Bind("FormacionUniversitaria") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdCarrera</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdCarrera" runat="server" Text='<%# Bind("IdCarrera") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdUniversidad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdUniversidad" runat="server" Text='<%# Bind("IdUniversidad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-3">TieneFamiliaraPersonal</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtTieneFamiliaraPersonal" runat="server" Text='<%# Bind("TieneFamiliaraPersonal") %>' CssClass="form-control" Font-Size="X-Small" /></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">TieneFamiliarCompetencia</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtTieneFamiliarCompetencia" runat="server" Text='<%# Bind("TieneFamiliarCompetencia") %>' CssClass="form-control" Font-Size="X-Small" /></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">NombreFamiliarPersonal</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNombreFamiliarPersonal" runat="server" Text='<%# Bind("NombreFamiliarPersonal") %>' CssClass="form-control" Font-Size="X-Small" /></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">NombreFamiliarCompetencia</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNombreFamiliarCompetencia" runat="server" Text='<%# Bind("NombreFamiliarCompetencia") %>' CssClass="form-control" Font-Size="X-Small" /></div>
                                            </div>



                                        </div>


                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Aceptar" CssClass="btn btn-success" />
                                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancelar" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>



                                </asp:FormView>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>


        <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">


                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header">
                                <b id="editModalLabel">Modificar Postulante.</b>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <asp:FormView ID="EditFormView" runat="server" Width="100%"
                                    CellPadding="4" DataKeyNames="IdPostulante" ForeColor="#333333"
                                    DefaultMode="Edit"
                                    OnModeChanging="EditFormView_ModeChanging" OnItemUpdating="EditFormView_ItemUpdating" OnItemUpdated="EditFormView_ItemUpdated">
                                    <EditItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-3">IdPostulante</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdPostulante" runat="server" Text='<%# Bind("IdPostulante") %>' CssClass="form-control" Font-Size="X-Small" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">cod_funcionario</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtcod_funcionario" runat="server" Text='<%# Bind("cod_funcionario") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Nombres</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNombres" runat="server" Text='<%# Bind("Nombres") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Apellidos</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtApellidos" runat="server" Text='<%# Bind("Apellidos") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Login</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtLogin" runat="server" Text='<%# Bind("Login") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdTipoDocumento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdTipoDocumento" runat="server" Text='<%# Bind("IdTipoDocumento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">NumeroDocumento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtNumeroDocumento" runat="server" Text='<%# Bind("NumeroDocumento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">FechaNacimiento</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Sexo</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtSexo" runat="server" Text='<%# Bind("Sexo") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdEstadoCivil</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdEstadoCivil" runat="server" Text='<%# Bind("IdEstadoCivil") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdCiudad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdCiudad" runat="server" Text='<%# Bind("IdCiudad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdNacionalidad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdNacionalidad" runat="server" Text='<%# Bind("IdNacionalidad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">EsFuncionario</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtEsFuncionario" runat="server" Text='<%# Bind("EsFuncionario") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdBachillerato" runat="server" Text='<%# Bind("IdBachillerato") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">FormacionUniversitaria</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtFormacionUniversitaria" runat="server" Text='<%# Bind("FormacionUniversitaria") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdCarrera</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdCarrera" runat="server" Text='<%# Bind("IdCarrera") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdUniversidad</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdUniversidad" runat="server" Text='<%# Bind("IdUniversidad") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>


                                        </div>



                                        <asp:LinkButton ID="AcceptButton" runat="server" CausesValidation="False" CommandName="Update" Text="Aceptar" CssClass="btn btn-success" />
                                        <asp:LinkButton ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancelar" Text="Cancelar" CssClass="btn btn-danger" OnClick="CancelButton_Click" />
                                    </EditItemTemplate>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <InsertItemTemplate>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                    </ItemTemplate>



                                </asp:FormView>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>

        <!-- #endregion -->




        <!-- #region DataSources -->
        <asp:SqlDataSource ID="PostulanteDS"
            runat="server" ConnectionString="<%$ ConnectionStrings:EmpleosDBContext %>"
            InsertCommand="empleo.sp_Postulante_insert" InsertCommandType="StoredProcedure"
            SelectCommand="empleo.sp_Postulante_get_all" SelectCommandType="StoredProcedure">
            <DeleteParameters>
            </DeleteParameters>
            <InsertParameters>

                <asp:Parameter Name="IdPostulante" Type="Int32" />
                <asp:Parameter Name="cod_funcionario" Type="Int32" />
                <asp:Parameter Name="Nombres" Type="String" />
                <asp:Parameter Name="Apellidos" Type="String" />
                <asp:Parameter Name="Login" Type="String" />
                <asp:Parameter Name="IdTipoDocumento" Type="Int32" />
                <asp:Parameter Name="NumeroDocumento" Type="String" />
                <asp:Parameter Name="FechaNacimiento" Type="DateTime" />
                <asp:Parameter Name="Sexo" Type="String" />
                <asp:Parameter Name="IdEstadoCivil" Type="Int32" />
                <asp:Parameter Name="IdCiudad" Type="Int32" />
                <asp:Parameter Name="IdNacionalidad" Type="Int32" />
                <asp:Parameter Name="EsFuncionario" Type="String" />
                <asp:Parameter Name="IdBachillerato" Type="Int32" />
                <asp:Parameter Name="FormacionUniversitaria" Type="String" />
                <asp:Parameter Name="IdCarrera" Type="Int32" />
                <asp:Parameter Name="IdUniversidad" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
            </UpdateParameters>
        </asp:SqlDataSource>


        <!-- #endregion -->




    </div>
</asp:Content>
