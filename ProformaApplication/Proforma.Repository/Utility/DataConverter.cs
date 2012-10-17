using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Proforma.Repository
{ 
    public class DataConvertor<T> where T : IhasIndexer
    {
        public DataConvertorField<string, T> String;
        public DataConvertorField<int, T> Int;
        public DataConvertorField<DateTime, T> Date;
        public DataConvertorField<bool, T> Bool;
        public DataConvertorField<long, T> Long;

        T reader;

        public void Initialise(T reader)
        {
            this.reader = reader;
            String = new DataConvertorField<string, T>(reader, Convert.ToString);
            Int = new DataConvertorField<int, T>(reader, Convert.ToInt32);
            Date = new DataConvertorField<DateTime, T>(reader, Convert.ToDateTime);
            Bool = new DataConvertorField<bool, T>(reader, Convert.ToBoolean);
            Long = new DataConvertorField<long, T>(reader, Convert.ToInt64);
        }

        public bool has(string name)
        {
            try
            {
                object o = reader[name];
                return true;
            }
            catch
            {
                return false;
            }

        }
    }

    public class DataConvertorField<T, O> where O : IhasIndexer
    {
        O parent;
        DataConvertorMethod convertor;

        public DataConvertorField(O parent, DataConvertorMethod convertor)
        {
            this.parent = parent;
            this.convertor = convertor;
        }

        public T this[string name]
        {
            get
            {
                if (parent[name] == DBNull.Value)
                {
                    if (typeof(T).Equals(typeof(string)))
                        return (T)(object)string.Empty;
                    else
                        return default(T);
                }
                else
                    return convertor(parent[name]);
            }
        }
        public delegate T DataConvertorMethod(object o);

    }

    public interface IhasIndexer
    {
        object this[string key] { get; }
    }

    public static class DBUtil
    {
        public static object SetStringParamEmptyStringIsNull(string sValue)
        {
            if (sValue == null || sValue.Trim() == "")
            {               
                return System.DBNull.Value;
            }
            else
            {
                return sValue;
            }

        }
    }
}
