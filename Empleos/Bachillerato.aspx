<%@ Page Title="Bachilleratos" Language="C#" MasterPageFile="~/Boot.Master" AutoEventWireup="true" CodeBehind="Bachillerato.aspx.cs" Inherits="Empleos.Bachillerato" %>

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
        <asp:ListView ID="BachilleratoListView"
            runat="server"
            DataSourceID="BachilleratoDS"
            DataKeyNames="IdBachillerato"
            OnItemCommand="LicitacionListView_ItemCommand">
            <LayoutTemplate>
                <div class="table responsive">
                    <table class="table table-striped" style="font-size: x-small; font-family: 'Segoe UI'">
                        <thead>
                            <th>IdBachillerato</th>
                            <th>IdTipoBachillerato</th>
                            <th>Enfasis</th>
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
                        <asp:Label ID="lblIdBachillerato" runat="server" Text='<%# Eval("IdBachillerato") %>' /></td>
                    <td>
                        <asp:Label ID="lblIdTipoBachillerato" runat="server" Text='<%# Eval("IdTipoBachillerato") %>' /></td>
                    <td>
                        <asp:Label ID="lblEnfasis" runat="server" Text='<%# Eval("Enfasis") %>' /></td>

                    <th>
                        <asp:LinkButton CssClass="btn btn-info" runat="server" ID="EditTipoContactoBtn" CommandName="Editar" CommandArgument='<%# Eval("IdBachillerato")%>' ToolTip="Editar">
                            <i class="fa fa-keyboard fa-sm"></i>
                        </asp:LinkButton>
                    </th>

                    <th>

                        <asp:LinkButton CssClass="btn btn-danger" runat="server" ID="DeleteTipoContactoBtn" CommandName="Eliminar" CommandArgument='<%# Eval("IdBachillerato")%>' ToolTip="Eliminar">
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
                                <b id="addModalLabel">Agregar nuevo Bachillerato.</b>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <asp:FormView ID="InsertFormView" runat="server" DataSourceID="BachilleratoDS" Width="100%"
                                    CellPadding="4" DataKeyNames="IdBachillerato" ForeColor="#333333"
                                    DefaultMode="Insert"
                                    OnItemInserted="FormView1_ItemInserted">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                    <InsertItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-3">IdBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdBachillerato" runat="server" Text='<%# Bind("IdBachillerato") %>' CssClass="form-control" Font-Size="X-Small" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdTipoBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdTipoBachillerato" runat="server" Text='<%# Bind("IdTipoBachillerato") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Enfasis</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtEnfasis" runat="server" Text='<%# Bind("Enfasis") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
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
                                <b id="editModalLabel">Modificar Bachillerato.</b>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <asp:FormView ID="EditFormView" runat="server" Width="100%"
                                    CellPadding="4" DataKeyNames="IdBachillerato" ForeColor="#333333"
                                    DefaultMode="Edit"
                                    OnModeChanging="EditFormView_ModeChanging" OnItemUpdating="EditFormView_ItemUpdating" OnItemUpdated="EditFormView_ItemUpdated">
                                    <EditItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-3">IdBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdBachillerato" runat="server" Text='<%# Bind("IdBachillerato") %>' CssClass="form-control" Font-Size="X-Small" Enabled="false" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">IdTipoBachillerato</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtIdTipoBachillerato" runat="server" Text='<%# Bind("IdTipoBachillerato") %>' CssClass="form-control" Font-Size="X-Small" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-3">Enfasis</div>
                                                <div class="col-9">
                                                    <asp:TextBox ID="txtEnfasis" runat="server" Text='<%# Bind("Enfasis") %>' CssClass="form-control" Font-Size="X-Small" />
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
        <asp:SqlDataSource ID="BachilleratoDS"
            runat="server" ConnectionString="<%$ ConnectionStrings:EmpleosDBContext %>"
            InsertCommand="educacion.sp_Bachillerato_insert" InsertCommandType="StoredProcedure"
            SelectCommand="educacion.sp_Bachillerato_get_all" SelectCommandType="StoredProcedure">
            <DeleteParameters>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IdTipoBachillerato" Type="Int32" />
                <asp:Parameter Name="Enfasis" Type="String" />
            </InsertParameters>
            <UpdateParameters>
            </UpdateParameters>
        </asp:SqlDataSource>


        <!-- #endregion -->




    </div>

</asp:Content>
