using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.Design.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hello
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
           
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dataconnection c = new Dataconnection();
            
            String query = "select * from Title where title_name like '%" + textBox1.Text.ToString() + "%'";
            string query2 = "and Title_ID in (select Title_ID from Title_has_Author where  Author_id in ( select Author_id from Author where Full_name like '%" + textBox2.Text.ToString() + "%'))";
            string query3 = "and Title_ID in (select Title_ID from Title_has_Publisher where  publisher_id in ( select publisher_id from publisher where Full_name like '%" + textBox3.Text.ToString() + "%'))";
            if (comboBox1.SelectedIndex != -1)
            {
                query = query + " and Title_ID in (select Title_ID from Title_has_Type where  Type_Type_id in ( select type_id from type_3 where type_name = '" + comboBox1.Text + "'))" + query2
                    + query3 ;
                
            }
            
            // Radio Buttons
            String CategoryID = "";
            if (radioButton1.Checked == true)
            {
                CategoryID = "4";
            }
            else if (radioButton2.Checked == true)
            {
                CategoryID = "3";
            }
            else if (radioButton3.Checked == true)
            {
                CategoryID = "1";
            }
            else if (radioButton4.Checked == true)
            {
                CategoryID = "2";
            }
            if (CategoryID != "")
            {
                query = query + "and Category_idCategory = " + CategoryID;
            }

            query = query + "and title_id in (select title_id from Book_quantity_remaining where available_quantity > 0 )";
            DataTable d1 = c.Select(query);
           
            
            dataGridView1.DataSource = d1;
           
            int numRowCount = dataGridView1.RowCount;
            if (numRowCount<=1) 
            { MessageBox.Show("There is no such book in our library!"); }
            else { MessageBox.Show("Book found!"); }

        }

        private void button2_MouseClick(object sender, MouseEventArgs e)
        {
            this.Close();

        }
        
        private void comboBox1_Click(object sender, EventArgs e)
        {
            comboBox1.Items.Clear();
            comboBox1.Items.Add("Accounting");
            comboBox1.Items.Add("Arts");
            comboBox1.Items.Add("Biography");
            comboBox1.Items.Add("Business & Economics");
            comboBox1.Items.Add("Chemistry");
            comboBox1.Items.Add("Computer Science");
            comboBox1.Items.Add("English Language");
            comboBox1.Items.Add("English Literature");
            comboBox1.Items.Add("Finance");
            comboBox1.Items.Add("Geography");
            comboBox1.Items.Add("History");
            comboBox1.Items.Add("Mathematics");
            comboBox1.Items.Add("Physics");
            comboBox1.Items.Add("Psychology");
            comboBox1.Items.Add("Science");          
            comboBox1.Items.Add("Sociology");   
            comboBox1.Items.Add("Urdu");
            comboBox1.Items.Add("Zoology");
            comboBox1.Items.Add("Action and Adventure");
            comboBox1.Items.Add("Crime");
            comboBox1.Items.Add("Drama");
            comboBox1.Items.Add("Fantacy");
            comboBox1.Items.Add("Historical fiction");
            comboBox1.Items.Add("Horror");
            comboBox1.Items.Add("Mystery");
            comboBox1.Items.Add("Romance");
            comboBox1.Items.Add("Satire");
            comboBox1.Items.Add("Science fiction");
            comboBox1.Items.Add("Short story");
            comboBox1.Items.Add("Suspense");
            comboBox1.Items.Add("Thriller");

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
           

        }

        private void comboBox2_Click(object sender, EventArgs e)
        {
            
        }

        private void Form1_Click(object sender, EventArgs e)
        {
           
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
