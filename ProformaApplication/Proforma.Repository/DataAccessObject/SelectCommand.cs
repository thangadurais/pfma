using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;

namespace Proforma.Repository
{
    public class SelectCommand : CommandBase, IDisposable
    {
        public SelectCommand() : base() { }
        public SelectCommand(string procname) : base(procname) { }

        public DBDataReaderWrapper ExecuteReader()
        {
            SqlDataReader reader = null;
            Database db = DatabaseFactory.CreateDatabase();
            DbConnection cn = db.CreateConnection();
            cn.Open();
            DbCommand cmd = cn.CreateCommand();
            cmd.CommandType = cmdType;
            cmd.CommandText = getCommandText();
            cmd.Parameters.AddRange(getParams());
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection) as SqlDataReader;
            return new DBDataReaderWrapper(reader); 

        }

        public DataSet ExecuteDataSet()
        {
            DataSet dsResult = null;
            Database db = DatabaseFactory.CreateDatabase();

            using (DbConnection cn = db.CreateConnection())
            {
                cn.Open();
                DbCommand cmd = cn.CreateCommand();
                cmd.CommandType = cmdType;
                cmd.CommandText = getCommandText();
                cmd.Parameters.AddRange(getParams());
                dsResult = db.ExecuteDataSet(cmd);
            }
            return dsResult;

        }
    }    
}
