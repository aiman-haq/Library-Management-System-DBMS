using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Hello
{
    internal class Dataconnection
    {
        
        public SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-92RB685\SQLEXPRESS ;Initial Catalog=Lib;Integrated Security=True");
        public SqlCommand cmd = new SqlCommand();
        

        public Dataconnection()
        { }



        public void Inserts(string query) // insert / update / delete
        {
            conn.Open();
            cmd.CommandText = query;
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();
            conn.Close();


        }

        public DataTable Select(string query) // select query
        {
            conn.Open();
            cmd.CommandText = query;
            cmd.Connection = conn;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            return dt;
        }
    }
}