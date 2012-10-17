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
    public class GetValueCommand : CommandBase, IDisposable
    {
        public GetValueCommand() : base() { }
        public GetValueCommand(string procname) : base(procname) { }

        public object Execute()
        {
            Database db = DatabaseFactory.CreateDatabase();

            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbCommand cmd = connection.CreateCommand();
                cmd.CommandType = cmdType;
                cmd.CommandText = getCommandText();
                cmd.Parameters.AddRange(getParams());
                return cmd.ExecuteScalar();
            }
        }

        public int ExecuteAndGetIntValue()
        {
            object obj = DBNull.Value;


            Database db = DatabaseFactory.CreateDatabase();

            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbCommand cmd = connection.CreateCommand();
                cmd.CommandType = cmdType;
                cmd.CommandText = getCommandText();
                cmd.Parameters.AddRange(getParams());
                obj = cmd.ExecuteScalar();
            }


            if (obj == DBNull.Value)
                return 0;
            else
                return Convert.ToInt32(obj);
        }
    }
}
