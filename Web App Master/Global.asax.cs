﻿using Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml;
using Web_App_Master.Account;
using Notification;
using static Notification.NotificationSystem;
using System.IO;
using System.Threading.Tasks;
using Microsoft.ApplicationInsights.Extensibility;

namespace Web_App_Master
{

    public class Global : HttpApplication
    {
        public static async Task RefreshAssetCacheAsync()
        {
           // Global.AssetCache = await Pull.AssetsAsync();
        }
        public System.Timers.Timer Cleanup;
        public static NotificationSystem NoticeSystem { get { return Library.NotificationSystem; } set { Library.NotificationSystem = value; } }
        public static List<Asset> PullAssets
        { get
            {
                var masterlist = new List<Asset>();
                foreach (var an in Global.Library.Settings.AssetNumbers)
                {
                    masterlist.Add(Pull.Asset(an));
                }
                return masterlist;
            } }
        public static List<Asset> AssetCache
        {
            get {
                var a = HttpContext.Current.Application[HttpContext.Current.Session["guid"] as string] as List<Asset>;
                if (a == null) return new List<Asset>();
                return a;
            }
            set {
                if (HttpContext.Current.Session["guid"] as string == null)
                {
                    HttpContext.Current.Session["guid"] = Guid.NewGuid();
                }
                    HttpContext.Current.Application[HttpContext.Current.Session["guid"] as string] = value;
            }
        }
        public static void RefreshAssetCache()
        {
            AssetCache = Pull.Assets();
        }

        public static DataStore Library;
        public static UPSaccount _UPSAccount
        {
            get
            {
                return Global.Library.Settings.UpsAccount;
            }
            set
            {
                Global.Library.Settings.UpsAccount = value;
            }
        }
        void Application_Start(object sender, EventArgs e)
        {
            TelemetryConfiguration.Active.DisableTelemetry = true;
            DeveloperAction();
           // Error += Global_Error;
           // Cleanup = new System.Timers.Timer();
           // Cleanup.Interval = (60000 * 30);
           // Cleanup.Elapsed += Cleanup_Elapsed;
           //Cleanup.Enabled = true;
            LoadLibrary();
            LoadSettings();
            LoadNotificationSystem();
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        private void DeveloperAction()
        {


        }
        private static void Refresh_Complete()
        {

        }
        private void Global_Error(object sender, EventArgs e)
        {
           
        }

        void Application_Error(object sender, EventArgs e)
        {

        }

        private void Cleanup_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            try
            {
                var files = Directory.GetFiles(Server.MapPath("/Zip/"));
                foreach (var file in files)
                {
                    File.Delete(file);
                }
            }
            catch { }
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["SessionUserData"] = new Data.UserData();
           
            var list = new List<MenuAlert>();
            MenuAlert n = new MenuAlert();
            n.Name = User.Identity.Name;
            n.Text = "Session Started";
            list.Add(n);
            Session["Notifications"] = list;
            var guid = Guid.NewGuid().ToString();
            Session["guid"] = guid;
            AssetCache = Pull.Assets();
         
        }
        public static void LoadLibrary()
        {
            Library = new DataStore();
            try
            {
                //Pull.Library();             
            }
            catch { }
        }
        private static void LoadSettings()
        {
            Library.Settings = new Settings();
            try
            {
                Pull.Globals();
                if(Library.Settings==null)
                {
                    Library.Settings = new Settings();
                }
            }
            catch { }
        }
        private static void LoadNotificationSystem()
        {
            //Loads and Starts Notification System
            NoticeSystem = new NotificationSystem();
            try
            {
                Pull.NotificationSystem();
                if (NoticeSystem == null)
                {
                    NoticeSystem = new NotificationSystem("AWP_Notification_System");
                }
            }
            catch { }
           
                NoticeSystem.Interval = 60000;
                NoticeSystem.OnTimerTick += NoticeSystem_OnTimerTick;
            
            
            NoticeSystem.OnNoticeAdded += NoticeSystem_OnNoticeAdded;
            NoticeSystem.OnNoticeChanged += NoticeSystem_OnNoticeChanged;
            NoticeSystem.OnScheduledTime += NoticeSystem_OnNoticeScheduled;
            NoticeSystem.OnNoticeRemoved += NoticeSystem_OnNoticeRemoved;
            
            
        }

        private static void NoticeSystem_OnTimerTick(object sender, NotificationSystem.TimerTickEvent e)
        {
            
        }

        private static void NoticeSystem_OnNoticeRemoved(object sender, NotificationSystem.NotificationEvent e)
        {
            
        }

        private static void NoticeSystem_OnNoticeScheduled(object sender, NotificationSystem.NotificationEvent e)
        {
            try
            {
                if (!Global.Library.Settings.TESTMODE)
                {
                    EmailHelper.SendNotificationSystemNotice(e.Notice);
                }                
            }
            catch { }
        }

        private static void NoticeSystem_OnNoticeChanged(object sender, NotificationSystem.NotificationEvent e)
        {
          
        }

        private static void NoticeSystem_OnNoticeAdded(object sender, NotificationSystem.NotificationEvent e)
        {
          
        }
        public static Notice CheckoutAction(Notice n)
        {

            return n;
        }
        public static Notice CalibrationAction(Notice n)
        {

            return n;
        }
    }
}