using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Empleos
{
    public partial class Postulante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("Postulante.aspx");
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Postulante.aspx");
        }

        protected void GetRecordToUpdate(String ID)
        {

            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(PostulanteDS.ConnectionString);

            cmd = new SqlCommand("empleo.[sp_Postulante_get_Postulante]", con);
            cmd.Parameters.Add(new SqlParameter("@IdPostulante", ID));
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter adp = new SqlDataAdapter();

            con.Open();

            adp.SelectCommand = cmd;
            DataSet ds = new DataSet();
            adp.Fill(ds);

            EditFormView.DataSource = ds;
            EditFormView.DataBind();

            con.Close();
        }


        protected void DeleteRecord(String ID)
        {

            SqlCommand cmd = new SqlCommand();
            SqlConnection con = new SqlConnection(PostulanteDS.ConnectionString);

            cmd = new SqlCommand("empleo.[sp_Postulante_delete]", con);
            cmd.Parameters.Add(new SqlParameter("@IdPostulante", ID));



            cmd.CommandType = CommandType.StoredProcedure;

            con.Open();
            cmd.ExecuteNonQuery();



            con.Close();
        }


        protected void ListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Editar")
            {
                GetRecordToUpdate(e.CommandArgument.ToString());

                ScriptManager.RegisterStartupScript(this, this.GetType(), "",
               "$('#editModal').modal('show');", true);



            }
            else if (e.CommandName == "Eliminar")
            {
                DeleteRecord(e.CommandArgument.ToString());
                PostulanteListView.DataBind();

                ErrorLabel.Text = "El Registro se eliminò correctamente.";
                ErrorLabel.Visible = true;
                FadeOut(ErrorLabel.ClientID, 3000);
            }
        }


        protected void FadeOut(string ClientID, int Time)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "script", "window.setTimeout(function() { document.getElementById('" + ClientID + "').style.display = 'none' }," + Time.ToString() + ");", true);
        }



        protected void EditFormView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            EditFormView.ChangeMode(e.NewMode);
        }

        protected void EditFormView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            SqlCommand cmd = new SqlCommand();
            DataKey key = EditFormView.DataKey;

            string format = "dd/MM/yyyy";

            try
            {
                //Obtengo los valores de los campos a editar
                TextBox txtIdPostulante = (TextBox)EditFormView.FindControl("txtIdPostulante");
                TextBox txtcod_funcionario = (TextBox)EditFormView.FindControl("txtcod_funcionario");
                TextBox txtNombres = (TextBox)EditFormView.FindControl("txtNombres");
                TextBox txtApellidos = (TextBox)EditFormView.FindControl("txtApellidos");
                TextBox txtLogin = (TextBox)EditFormView.FindControl("txtLogin");
                TextBox txtIdTipoDocumento = (TextBox)EditFormView.FindControl("txtIdTipoDocumento");
                TextBox txtNumeroDocumento = (TextBox)EditFormView.FindControl("txtNumeroDocumento");
                TextBox txtFechaNacimiento = (TextBox)EditFormView.FindControl("txtFechaNacimiento");
                TextBox txtSexo = (TextBox)EditFormView.FindControl("txtSexo");
                TextBox txtIdEstadoCivil = (TextBox)EditFormView.FindControl("txtIdEstadoCivil");
                TextBox txtIdCiudad = (TextBox)EditFormView.FindControl("txtIdCiudad");
                TextBox txtIdNacionalidad = (TextBox)EditFormView.FindControl("txtIdNacionalidad");
                TextBox txtEsFuncionario = (TextBox)EditFormView.FindControl("txtEsFuncionario");
                TextBox txtIdBachillerato = (TextBox)EditFormView.FindControl("txtIdBachillerato");
                TextBox txtFormacionUniversitaria = (TextBox)EditFormView.FindControl("txtFormacionUniversitaria");
                TextBox txtIdCarrera = (TextBox)EditFormView.FindControl("txtIdCarrera");
                TextBox txtIdUniversidad = (TextBox)EditFormView.FindControl("txtIdUniversidad");


                //DateTime isoDateTime = DateTime.ParseExact(txtCalendar.Value, format, CultureInfo.InvariantCulture);

                SqlConnection conn = new SqlConnection(PostulanteDS.ConnectionString);

                cmd.Connection = conn;

                cmd.CommandText = "educacion.sp_Postulante_update";
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IdPostulante", txtIdPostulante.Text);
                cmd.Parameters.AddWithValue("@cod_funcionario", txtcod_funcionario.Text);
                cmd.Parameters.AddWithValue("@Nombres", txtNombres.Text);
                cmd.Parameters.AddWithValue("@Apellidos", txtApellidos.Text);
                cmd.Parameters.AddWithValue("@Login", txtLogin.Text);
                cmd.Parameters.AddWithValue("@IdTipoDocumento", txtIdTipoDocumento.Text);
                cmd.Parameters.AddWithValue("@NumeroDocumento", txtNumeroDocumento.Text);
                cmd.Parameters.AddWithValue("@FechaNacimiento", txtFechaNacimiento.Text);
                cmd.Parameters.AddWithValue("@Sexo", txtSexo.Text);
                cmd.Parameters.AddWithValue("@IdEstadoCivil", txtIdEstadoCivil.Text);
                cmd.Parameters.AddWithValue("@IdCiudad", txtIdCiudad.Text);
                cmd.Parameters.AddWithValue("@IdNacionalidad", txtIdNacionalidad.Text);
                cmd.Parameters.AddWithValue("@EsFuncionario", txtEsFuncionario.Text);
                cmd.Parameters.AddWithValue("@IdBachillerato", txtIdBachillerato.Text);
                cmd.Parameters.AddWithValue("@FormacionUniversitaria", txtFormacionUniversitaria.Text);
                cmd.Parameters.AddWithValue("@IdCarrera", txtIdCarrera.Text);
                cmd.Parameters.AddWithValue("@IdUniversidad", txtIdUniversidad.Text);

                conn.Open();
                cmd.ExecuteNonQuery();

                conn.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "",
                "$('#editModal').modal('hide');", true);

                Response.Redirect("Postulante.aspx");


            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
                ErrorLabel.Visible = true;
                FadeOut(ErrorLabel.ClientID, 5000);
            }
        }


        protected void EditFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            EditFormView.ChangeMode(FormViewMode.ReadOnly);
            ErrorLabel.Text = "El Registro de actualizò correctamente";
            ErrorLabel.Visible = true;
            FadeOut(ErrorLabel.ClientID, 5000);
            PostulanteListView.DataBind();

        }

    }
}