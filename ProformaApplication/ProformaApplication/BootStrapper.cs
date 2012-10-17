using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ProformaApplication.IoC;
using System.Web.Mvc;
using StructureMap;

namespace ProformaApplication
{
    public class BootStrapper
    {
        public static void ConfigureDependencies()
        {
            var container = new Container(x =>
            {
                x.Scan(scan =>
                {
                    scan.TheCallingAssembly();
                    scan.Assembly("Proforma.Repository");
                    scan.Assembly("Proforma.Services");
                    scan.Assembly("Proforma.Infrastructure");
                    scan.WithDefaultConventions();
                });

                x.For<IControllerActivator>().Use<StructureMapControllerActivator>();
            });
           

            DependencyResolver.SetResolver(new StructureMapDependencyResolver(container));
        }
    }
}