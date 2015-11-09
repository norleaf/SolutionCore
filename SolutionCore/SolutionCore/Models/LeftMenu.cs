using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SolutionCore.Models
{
    public class LeftMenu
    {
        private List<MenuItem> ListOfMenuItems = new List<MenuItem>();

        public void addItem(MenuItem item)
        {
            ListOfMenuItems.Add(item);
        }
        
        public List<MenuItem> get()
        {
            return ListOfMenuItems;
        }

        public void removeItem(MenuItem item)
        {
            ListOfMenuItems.Remove(item);
        }
    }
}