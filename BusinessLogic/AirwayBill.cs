﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL = DataAccess;
namespace BusinessLogic
{
    public class AirwayBill
    {
        public static DataSet GetAwbInfoByAwbNo(string awbNo, string conSTR)
        {
            return DAL.AirwayBill.GetAwbInfoByAwbNo(awbNo, conSTR);
        }

        public static DataSet GetDetailsAwbNo(string awbNo, string conSTR)
        {
            return DAL.AirwayBill.GetDetailsAwbNo(awbNo, conSTR);
        }

        //public static DataTable awbDatatable(DataTable datatable)
        //{
        //    return DAL.AirwayBill.awbDatatable(datatable);
        //}
    }
}
