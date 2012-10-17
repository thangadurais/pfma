using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


namespace Proforma.Repository
{
    public class DBDataReaderWrapper : DataConvertor<DBDataReaderWrapper>, IDisposable, IhasIndexer
    {
        SqlDataReader reader;
        
       
        public DBDataReaderWrapper(SqlDataReader reader)
        {
            Initialise(this);
            this.reader = reader;
        }        

        public object this[string name]
        {
            get
            {
                return reader[name];
            }
        }

        public bool Read()
        {
            return reader.Read();
        }

        public bool NextResult()
        {
            return reader.NextResult();
        }

        public void Dispose()
        {
            reader.Close();
            reader.Dispose();
                        
        }

    }
}
