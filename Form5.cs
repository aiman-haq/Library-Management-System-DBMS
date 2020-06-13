using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hello
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void label11_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dataconnection s = new Dataconnection();

            string Query1 = "select title_name from title where isbn = '" + textBox1.Text.ToString() + "'";
            DataTable d2 = s.Select(Query1);
            int numofrows = d2.Rows.Count;
            if (numofrows < 1)
            {
                string Query2 = "select * from author where full_name = '" + textBox2.Text.ToString() + "'";
                DataTable d3 = s.Select(Query2);
                int numofrows1 = d3.Rows.Count;
                if (numofrows1 < 1)
                {

                    string Query3 = "INSERT INTO author ([Author_ID], [Full_Name])" +
                        "VALUES(select max(Author_ID) from author) + 1 , '"  + textBox2.Text.ToString() + "' )";
                     s.Inserts(Query3);
                     
                }
                else
                {

                }




            }
            else { MessageBox.Show("Book already exists"); }
        }
    
    }
    
}
