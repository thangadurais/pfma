using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;


namespace Proforma.Repository
{
    public class DataTableWrapper : DataConvertor<DataTableWrapper>, IDisposable, IhasIndexer
    {
        DataTable dt;

        int position;

        public DataTableWrapper(DataTable dt)
        {
            Initialise(this);

            this.dt = dt;

            position = -1;
        }

        public object this[string name]
        {
            get
            {
                return dt.Rows[position][name];
            }
        }

        public bool Read()
        {
            this.position++;

            return position != dt.Rows.Count;
        }
    
        public void Dispose()
        {
            dt.Dispose();
        }

    }


}
