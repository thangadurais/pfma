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
    public class InsertCommand : CommandBase, IDisposable
    {
        public InsertCommand() : base() { }
        public InsertCommand(string procname) : base(procname) { }

        public int Execute()
        {
            Database db = DatabaseFactory.CreateDatabase();

            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbCommand cmd = connection.CreateCommand();
                cmd.CommandType = cmdType;
                cmd.CommandText = getCommandText();
                cmd.Parameters.AddRange(getParams());
                return cmd.ExecuteNonQuery();
            }
        }
        /// <summary>
        /// Uses ExecuteScalar for returning ID
        /// </summary>
        /// <returns></returns>
        public int ExecuteAndReturnId()
        {
            Database db = DatabaseFactory.CreateDatabase();

            using (DbConnection connection = db.CreateConnection())
            {
                connection.Open();
                DbCommand cmd = connection.CreateCommand();
                cmd.CommandType = cmdType;
                cmd.CommandText = getCommandText();
                cmd.Parameters.AddRange(getParams());
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }
    }
}
