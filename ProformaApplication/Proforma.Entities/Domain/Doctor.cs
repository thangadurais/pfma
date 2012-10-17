using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Proforma.Entities.Domain
{
    public interface IDesignation
    {
        int Id { get; set; }
        string Name { get; set; }
        string Desc { get; set; }
    }
    public interface IhasDesignation
    {
        IDesignation Designation { get; set; }
    }
    public class Doctor : Person, IhasDesignation
    {
        public int AddedBy { get; set; }
        public int UpdatedBy { get; set; }
        public DateTime AddedDateTime { get; set; }
        public DateTime UpdatedDateTime { get; set; }

        public IDesignation Designation { get; set; }
    }
}
