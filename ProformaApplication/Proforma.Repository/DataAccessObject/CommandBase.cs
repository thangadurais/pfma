using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;



namespace Proforma.Repository
{ 
    public class CommandBase : IDisposable
    {
        public Dictionary<string, SqlParameter> parameters = new Dictionary<string, SqlParameter>();
        protected string procName;
        protected string sqlString = "";

        public bool IsExceptionOccured;
        public bool IsCompleted { get { return !IsExceptionOccured; } }

        //By default, cmd type is storedProc. 
        //If the SQL property is set, it is changed to text type
        protected CommandType cmdType = CommandType.StoredProcedure;

        public CommandBase()
        {
            this.cmdType = CommandType.Text;
        }

        public CommandBase(string procname)
        {
            this.procName = procname;
            this.cmdType = CommandType.StoredProcedure;
        }

        public object this[string key]
        {
            set
            {
                this[key, ParamType.NonNullable] = value;
            }
            get
            {
                try
                {
                    return parameters[key].Value;
                }
                catch
                {
                    return null;
                }
            }
        }

        public object this[string key, ParamType pt]
        {
            set
            {
                this[key, pt, ParamDirection.Input] = value;
            }
        }

        public object this[string key, ParamType pt, ParamDirection d]
        {
            set
            {
                //if the set value is null, assume it is a string
                if ((value is string) || (value == null))
                {
                    if (pt == ParamType.Nullable)
                        this[key, SqlDbType.NVarChar, d] = value;
                    else
                        this[key, SqlDbType.VarChar, d] = value;
                }
                else if (value is DateTime)
                {
                    if (pt == ParamType.Nullable)
                    {
                        DateTime dt = (DateTime)value;
                        if (dt == DateTime.MinValue)
                            this[key, SqlDbType.SmallDateTime, d] = DBNull.Value;
                        else
                            this[key, SqlDbType.SmallDateTime, d] = value;
                    }
                    else
                        this[key, SqlDbType.SmallDateTime, d] = value;
                }
                else if (value is bool)
                {
                    this[key, SqlDbType.Bit, d] = value;
                }
                else if (value is long)
                {
                    if (pt == ParamType.Nullable)
                    {
                        long i = (long)value;
                        if (i == 0)
                            this[key, SqlDbType.Int, d] = DBNull.Value;
                        else
                            this[key, SqlDbType.Int, d] = value;
                    }
                    else
                        this[key, SqlDbType.Int, d] = value;
                }
                else //if (value is int)
                {
                    if (pt == ParamType.Nullable)
                    {
                        int i = (int)value;
                        if (i == 0)
                            this[key, SqlDbType.Int, d] = DBNull.Value;
                        else
                            this[key, SqlDbType.Int, d] = value;
                    }
                    else
                        this[key, SqlDbType.Int, d] = value;
                }
            }
        }

        public object this[string key, SqlDbType t, ParamDirection d]
        {
            set
            {
                if (!parameters.ContainsKey(key))
                {
                    SqlParameter p = new SqlParameter(key, t);
                    p.Direction = (ParameterDirection)d;
                    parameters.Add(key, p);
                }

                object result = getFormattedValue(value, t);
                parameters[key].Value = result;
            }
        }

        public object this[string key, SqlDbType t, ParamDirection d, int size]
        {
            set
            {
                if (!parameters.ContainsKey(key))
                {
                    SqlParameter p = new SqlParameter(key, t, size);
                    p.Direction = (ParameterDirection)d;
                    parameters.Add(key, p);
                }

                object result = getFormattedValue(value, t);
                parameters[key].Value = result;

            }
        }

        private object getFormattedValue(object obj, SqlDbType t)
        {
            object result = null;

            if (t == SqlDbType.NVarChar)
                result = DBUtil.SetStringParamEmptyStringIsNull((string)obj);
            else
                result = obj;

            return result;
        }

        public string SQL
        {
            set
            {
                this.sqlString = value;
                cmdType = CommandType.Text; //by default it is storedProc
            }
            get
            {
                return this.sqlString;
            }
        }

        public void Clear()
        {
            parameters.Clear();
        }

       

        protected SqlParameter[] getParams()
        {
            SqlParameter[] lst = new SqlParameter[parameters.Count];

            int i = 0;
            foreach (KeyValuePair<string, SqlParameter> item in parameters)
            {
                lst[i] = item.Value;
                i++;
            }

            return lst;
        }

        protected string getCommandText()
        {
            if (cmdType == CommandType.Text)
                return SQL;
            else
                return procName;
        }

        public void Dispose()
        {
            parameters.Clear();
        }
    }

    public enum ParamType
    {
        NonNullable,
        Nullable
    }

    // Summary:
    //     Specifies the type of a parameter within a query relative to the System.Data.DataSet.
    public enum ParamDirection
    {
        //     The parameter is an input parameter.
        Input = 1,
        //     The parameter is an output parameter.
        Output = 2,
        //     The parameter is capable of both input and output.
        InputOutput = 3,
        //     The parameter represents a return value from an operation such as a stored
        //     procedure, built-in function, or user-defined function.
        ReturnValue = 6,
    }
}
