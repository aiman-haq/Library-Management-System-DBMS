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
            // finding title via isbn
            string Book_exist_query = "select title_name from title where isbn = '" + textBox1.Text.ToString() + "'";
            DataTable BooksWithName = s.Select(Book_exist_query);
            bool BookExists = BooksWithName.Rows.Count >= 1;
            if (BookExists)
            {
                MessageBox.Show("Book is already in database");
                return;
            }
            string Author_exists_query = "select * from author where full_name = '" + textBox4.Text.ToString() + "'";
            DataTable AuthorWithName = s.Select(Author_exists_query);
            bool AuthorExists = AuthorWithName.Rows.Count>=1;
             
            if (!AuthorExists)
            {
                // See if Valid Author
                if (textBox4.Text == "")
                {
                    MessageBox.Show("Please enter a valid Author name!");
                    return;
                }
                string Insert_Author = "INSERT INTO author ([Author_ID], [Full_Name])" +
                            "VALUES((select max(Author_ID) from author) + 1 , '" + textBox4.Text.ToString() + "' )";
                s.Inserts(Insert_Author);


            }
            string Publisher_Exists_Query = "select * from publisher where full_name = '" + textBox6.Text.ToString() + "'";
            DataTable PublisherWithName = s.Select(Publisher_Exists_Query);
            bool PublisherExists = PublisherWithName.Rows.Count >=1;
            if (!PublisherExists)
            {
                if (textBox6.Text == "") 
                {
                    MessageBox.Show("Please enter a valid Publisher name!");
                    return;
                }
                string AddPublisher = "INSERT INTO publisher ([publisher_ID], [Full_Name])" +
                        "VALUES((select max(publisher_ID) from publisher) + 1 , '" + textBox6.Text.ToString() + "' )";
                s.Inserts(AddPublisher);

            }
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
                MessageBox.Show("Please Select Correct Category");
                return;
            }
            if (comboBox1.SelectedIndex == -1)
            {
                MessageBox.Show("Please Choose A Type");
                return;
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

            string Query9 = "insert into title_has_publisher([Title_ID] ,[publisher_id] ,[Title_Category_idCategory])" +
                "values((select max(title_ID) from title), ( select publisher_id from publisher where Full_name like '%" + textBox6.Text.ToString() + "%'), " +
                "" + CategoryID.ToString() + ")";
            s.Inserts(Query9);

            MessageBox.Show(" A New Book Has Been Added In The Library Successfully!");
        
                    
                    
               

                   
            

            
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

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton3.Checked)
            {
                label1.Text = "A_ID";
            }
            else
            {
                label1.Text = "ISBN:";
            }
        }
    }
    
}
