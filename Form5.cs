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
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Dataconnection s = new Dataconnection();
 
            string Query1 = "select title_name from title where isbn = '" + textBox1.Text.ToString() + "'";
            DataTable d2 = s.Select(Query1);
            int numofrows = d2.Rows.Count;
            if (numofrows < 1)
            {
                string Query2 = "select * from author where full_name = '" + textBox4.Text.ToString() + "'";
                DataTable d3 = s.Select(Query2);
                int numofrows1 = d3.Rows.Count;
                if (numofrows1 < 1)
                {
                    if (textBox4.Text == "") { MessageBox.Show("Please enter a valid Author name!"); }

                    else
                    {
                        string Query3 = "INSERT INTO author ([Author_ID], [Full_Name])" +
                            "VALUES((select max(Author_ID) from author) + 1 , '" + textBox4.Text.ToString() + "' )";
                        s.Inserts(Query3);
                       
                    }
                }
                    string Query4 = "select * from author where full_name = '" + textBox6.Text.ToString() + "'";
                    DataTable d4 = s.Select(Query4);
                    int numofrows2 = d4.Rows.Count;
                    if (numofrows1 < 1)
                    {
                        if (textBox6.Text == "") { MessageBox.Show("Please enter a valid Publisher name!"); }

                        else
                        {
                            string Query5 = "INSERT INTO publisher ([publisher_ID], [Full_Name])" +
                                "VALUES((select max(publisher_ID) from publisher) + 1 , '" + textBox6.Text.ToString() + "' )";
                            s.Inserts(Query5);
                        }
                    
                    
                    }

                    int CategoryID = 0 ;
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
                    
                string Query6 = "Insert into title ([Title_ID] ,[Category_idCategory] ,[ISBN] " +
                    ", [Title_Name] ,[Pages] ,[Quantity] ,[Edition])" +
                    " VALUES((select max(title_ID) from title) + 1 , " + CategoryID.ToString() + ", '" + textBox1.Text.ToString() + "'," +
                    "'" + textBox2.Text.ToString() + "', '" + numericUpDown1.Value.ToString() + "', '1', '" + numericUpDown1.Value.ToString() + "')";
                s.Inserts(Query6);

                string Query7 = "insert into title_has_type([Title_ID] ,[Type_Type_id] ,[Title_Category_idCategory])" +
                    "values((select max(title_ID) from title), (select type_id from type_3 where type_name = '" + comboBox1.Text + "'), " +
                    "" + CategoryID.ToString() + ")";
                s.Inserts(Query7);

                string Query8 = "insert into title_has_author([Title_ID] ,[author_id] ,[Title_Category_idCategory])" +
                    "values((select max(title_ID) from title), (select Author_id from Author where Full_name like '%" + textBox4.Text.ToString() + "%'), " +
                    "" + CategoryID.ToString() + ")";
                s.Inserts(Query8);

                string Query9= "insert into title_has_publisher([Title_ID] ,[publisher_id] ,[Title_Category_idCategory])" +
                    "values((select max(title_ID) from title), ( select publisher_id from publisher where Full_name like '%" + textBox6.Text.ToString() + "%'), " +
                    "" + CategoryID.ToString() + ")";
                s.Inserts(Query9);

                MessageBox.Show(" A New Book Has Been Added In The Library Successfully!");



            }

            else 
            { 
                MessageBox.Show("Book already exists"); 
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void comboBox1_DragDrop(object sender, DragEventArgs e)
        {

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
    }
    
}
