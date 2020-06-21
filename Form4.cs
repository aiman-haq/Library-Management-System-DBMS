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
    public partial class Form4 : Form
    {
        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label15_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


            Dataconnection i = new Dataconnection() ;
            string finding_issued_book = "select * from book_issue where title_id in (select title_id from title where isbn = '" + textBox1.Text.ToString() + "') and issued = ((1))" +
                " and issued_to = '" + textBox4.Text.ToString() + "' ";
            DataTable issued_books = i.Select(finding_issued_book);
            bool IssuedBookExists = issued_books.Rows.Count >= 1;
            if (!IssuedBookExists)
            {

                MessageBox.Show("Book could not be returned");
                return;
            }
            else
            {
                string query1 = " UPDATE book_issue " +
                    "SET issued = ((0))" +
                    "WHERE title_id = (select title_id from title where isbn = '" + textBox1.Text.ToString() + "' and issued = ((1)))" +
                    "and issued_to = '" + textBox4.Text.ToString() + "' ";
                i.Inserts(query1);

                MessageBox.Show("Book Returned");

            }


        }
    }
}
