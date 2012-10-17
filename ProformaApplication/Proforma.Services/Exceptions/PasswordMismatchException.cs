using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace Proforma.Services.Exceptions
{
    [Serializable]
    public class PasswordMismatchException : System.Exception
    {
        private string userName;

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private string _ErrorMessageKey;

        public string ErrorMessageKey
        {
            get { return _ErrorMessageKey; }
            set { _ErrorMessageKey = value; }
        }
        public PasswordMismatchException()
        {
        }

        public PasswordMismatchException(string message)
            : base(message)
        {
        }
        public PasswordMismatchException(string message, Exception innerException)
            : base(message, innerException)
        {
        }

        protected PasswordMismatchException(SerializationInfo info,
      StreamingContext context)
            : base(info, context)
        {
            if (info != null)
            {
                this.userName = info.GetString("userName");
            }
        }

        public override void GetObjectData(SerializationInfo info,
           StreamingContext context)
        {
            base.GetObjectData(info, context);

            if (info != null)
            {
                info.AddValue("userName", this.userName);
            }
        }
    }
}
