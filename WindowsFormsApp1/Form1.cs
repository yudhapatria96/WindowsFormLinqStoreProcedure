using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        ProgrammingDataClassDataContext db = new ProgrammingDataClassDataContext();

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            int prodid = int.Parse(textBox1.Text);
            string itemname = textBox2.Text, design = textBox3.Text, color = comboBox1.Text;
            DateTime expiredate = DateTime.Parse(dateTimePicker1.Text);
            //var st = new ProductInfo
            //{
            //    ProductID = prodid,
            //    ItemName = itemname,
            //    ExpiryDate = expiredate,
            //    Design = design,
            //    Color = color,
            //    InsertDate = DateTime.Now

            //};

            //db.ProductInfos.InsertOnSubmit(st);
            //db.SubmitChanges();

            db.insert_data(prodid, itemname, design, color, expiredate, DateTime.Now);
            MessageBox.Show("Successfully Inserted");
            loadData();
        }

        //adding method to load data in datagridview

        void loadData()
        {
            var st = from s in db.ProductInfos select s;
            dataGridView1.DataSource = db.show_data();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            //update
            string itemname = textBox2.Text, design = textBox3.Text, color = comboBox1.Text;
            DateTime expiredate = DateTime.Parse(dateTimePicker1.Text);
            //var st = (from s in db.ProductInfos where s.ProductID == int.Parse(textBox1.Text) select s).First();
            //st.ItemName = itemname ;
            //st.Design = design;
            //st.Color = color;
            //st.ExpiryDate = expiredate;
            //st.UpdateDate = DateTime.Now;
            //db.SubmitChanges();

            db.update_data(int.Parse(textBox1.Text), itemname, design, color, expiredate, DateTime.Now);
            MessageBox.Show("Successfully Updated");
            loadData();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            //var st = from s in db.ProductInfos where s.ProductID == int.Parse(textBox1.Text) select s;
            dataGridView1.DataSource = db.search_data_by_id(int.Parse(textBox1.Text));
        }

        private void button4_Click(object sender, EventArgs e)
        {
            //Delete
            if(MessageBox.Show("Are you sure to delete?", "Delete Record", MessageBoxButtons.YesNo)== DialogResult.Yes)
            {
                // var st = (from s in db.ProductInfos where s.ProductID == int.Parse(textBox1.Text) select s).First();

                //db.ProductInfos.DeleteOnSubmit(st);
                //db.SubmitChanges();
                db.delete_data(int.Parse(textBox1.Text));
                MessageBox.Show("Successfully Deleted");
                loadData();

            }


        }
        
    }
}
