using System;
using System.Data;
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
            else
            {
                MessageBox.Show("Please choose the valid category");
                return;
            }

            if (textBox1.TextLength > 0  
                 && textBox4.TextLength > 0 && textBox11.TextLength > 0 && checkBox1.Checked==true)            
            {
                string query1 = " insert into book_issue ([Book_Issue_ID] ,[Title_ID] ,[Issued_by] ,[Issued_to]" +
                    ",[Title_Category_idCategory] ,[Issue_Date] ,[Return_Date] ,[Issued]) " +
                    "values ( (select max(Book_Issue_ID) from book_issue) + 1 , (select title_id from title where isbn = '" + textBox1.Text.ToString() + "') ," +
                    " '" + textBox11.Text.ToString() + "', '" + textBox4.Text.ToString() + "'," +
                    " '" + CategoryID.ToString() + "', '" + dateTimePicker1.Value.ToString() + "', '" + dateTimePicker2.Value.ToString() + "'," +
                    " '" + '1' + "')";
                i.Inserts(query1);
                MessageBox.Show("Book Issued!");
            }
            else 
            {
                MessageBox.Show("Book cannot be issued. Please enter all the details!");
            }
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Dataconnection s = new Dataconnection();
            // Query to check whether the isbn is valid or not jese >=1 kiya tha
            string check_book = "select Category_idCategory, title_name from title where isbn = '" + textBox1.Text.ToString() +"' ";
            DataTable available_book = s.Select(check_book);
            bool bookexists = available_book.Rows.Count >= 1;
            if (!bookexists)
            {
                MessageBox.Show("Can not auto fill. Enter Valid ISBN.");
                return;
            }
            int CategoryID = available_book.Rows[0].Field<int>(0);
            string title = available_book.Rows[0].Field<string>(1);
            textBox2.Text = title;
            radioButton1.Checked = false;
            radioButton2.Checked = false;
            radioButton3.Checked = false;
            radioButton4.Checked = false;
            if (CategoryID == 4)
            {
                radioButton1.Checked = true;
                
            }
            else if (CategoryID == 3)
            {
                radioButton2.Checked = true;
            }
            else if (CategoryID == 1 )
            {
                radioButton3.Checked = true;
            }
            else if (CategoryID == 2)
            {
                radioButton4.Checked = true;
            }
        }
    }
}
