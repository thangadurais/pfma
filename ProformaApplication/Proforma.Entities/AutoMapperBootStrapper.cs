using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AutoMapper;

namespace Proforma.Entities
{
    public class AutoMapperBootStrapper
    {
        public static void ConfigureAutoMapper()
        {
            //Mapper.CreateMap<OrderView, OrderPaymentRequest>()
            //    .ForMember(o => o.Total, ov => ov.ResolveUsing<OrderTotalResolver>())
            //    .ForMember(o => o.ShippingCharge, ov => ov.ResolveUsing<ShippingChargeResolver>());//test

            //Mapper.CreateMap<OrderItemView, OrderItemPaymentRequest>()
            //    .ForMember(o => o.Price, ov => ov.ResolveUsing<ItemPriceResolver>());
        }
    }
}
