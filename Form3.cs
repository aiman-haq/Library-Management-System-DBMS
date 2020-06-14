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
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            Dataconnection i = new Dataconnection();
            //string query2 = " (select max(Book_Issue_ID) from book_issue) + 1 ";
            //string query3 = " (select title_id from title where isbn = '" + textBox1.Text.ToString() + "') ";
            int CategoryID = 0;
            if (radioButton1.Checked == true)
            {
                CategoryID = 4;
            }
            else if (radioButton2.Checked == true)
            {
                CategoryID = 3;
            }
            else if (radioButton3.Checked == true)
            {
                CategoryID = 1;
            }
            else if (radioButton4.Checked == true)
            {
                CategoryID = 2;
            }
          
            string query1 = " insert into book_issue ([Book_Issue_ID] ,[Title_ID] ,[Issued_by] ,[Issued_to]" +
                ",[Title_Category_idCategory] ,[Issue_Date] ,[Return_Date] ,[Issued]) " +
                "values ( (select max(Book_Issue_ID) from book_issue) + 1 , (select title_id from title where isbn = '" + textBox1.Text.ToString() + "') ," +
                " '"+ textBox11.Text.ToString() + "', '"+ textBox4.Text.ToString()+"'," +
                " '"+ CategoryID.ToString() +"', '"+ dateTimePicker1.Value.ToString() + "', '" + dateTimePicker2.Value.ToString() + "'," +
                " '"+ '1' +"')";
            i.Inserts(query1);
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
        }
    }
}
