using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Proforma.Entities.Domain;

namespace Proforma.Repository
{
    public interface IPatientRepository
    {
        Patient GetPatientDetails(int patientId);
        bool AddNewPatient(Patient patient);
    }
    public class PatientRepository : IPatientRepository
    {

        public Patient GetPatientDetails(int patientId)
        {
            SelectCommand cmd = new SelectCommand("GetPatientDetails");
            cmd["@PatientId"] = patientId;
            Patient patient = null;
            using (DBDataReaderWrapper reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    patient = new Patient
                      {
                          Id = reader.Int["Id"],
                          FirstName = reader.String["FirstName"],
                          LastName = reader.String["LastName"],
                          PersonalNumber = reader.String["PersonalNumber"],
                          ResponsibleDoctor = new Doctor
                          {
                              FirstName = reader.String["DoctorFirstName"],
                              LastName = reader.String["DoctorLastName"],
                              Id = reader.Int["ResponsibleDoctorId"]
                          },
                          ListComments = reader.String["ListComments"],
                          Comment = reader.String["Comment"],
                          Address = reader.String["Address"],
                          PostalNumber = reader.String["PostalNumber"],
                          City = reader.String["City"],
                          HomePhone = reader.String["HomePhone"],
                          OfficePhone = reader.String["OfficePhone"],
                          MobilePhone = reader.String["MobilePhone"],
                          PasswordId = reader.String["PasswordId"],
                          Email1 = reader.String["Email1"],
                          Email2 = reader.String["Email2"],
                          Gender = (Gender)Enum.Parse(typeof(Gender), reader.String["Gender"], true),
                          Relative = reader.String["Relative"],
                          WarningMessage = reader.String["WarningMessage"],
                          Cave = reader.String["Cave"],
                          SMS = reader.Bool["SMS"],
                          ThemeEveningSMS = reader.Bool["ThemeEveningSMS"],
                          Deceased = reader.Bool["Deceased"],
                          OPShortNotice = reader.Bool["OPShortNotice"],

                          AddedUser = new Entities.Application.User
                          {
                              Id = reader.Int["AddedBy"],
                              FirstName = reader.String["AddedUserFirstName"],
                              LastName = reader.String["AddedUserLastName"]
                          }
                      };//end of patient 
                }//while

            }//usin
            return patient;
        }




        public bool AddNewPatient(Patient patient)
        {
            throw new NotImplementedException();
        }
    }
}
