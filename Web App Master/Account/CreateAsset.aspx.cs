using Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_App_Master.Account
{
    public partial class CreateAsset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var asset = new Asset();
                asset.Images = "";
                asset.AssetName = "none";
                Session["CreatorAsset"] = asset;
            }
        }        
        protected void CreateAssetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                foreach(var a in AssetController.GetAllAssets())
                {
                    if (AssetNumber.Text==a.AssetNumber)
                    {
                        Page.SiteMaster().ShowError("Please use an unique [Asset Number]");
                        return;
                    }
                }

                var asset = Session["CreatorAsset"] as Asset;
                if (asset == null) asset = new Asset();
                asset.AssetName = AssetName.Text;
                asset.AssetNumber = AssetNumber.Text;
                try
                {
                    asset.weight = Convert.ToDecimal(Weight.Text);
                }
                catch { asset.weight = 1; }
                if (CalibratedCheckBox.Checked)
                {
                    asset.IsCalibrated = true;
                    asset.CalibrationCompany = CalCompanyText.Text;
                    asset.CalibrationPeriod = CalPeriodText.Text;
                }
                asset.Description = DescriptionText.Text;
                try
                {
                    SQL_Request req = new SQL_Request().OpenConnection();
                    req.AddAsset(asset);
                    Global.Library.Assets.Add(asset.Clone() as Asset);
                    if (req.Success != true)
                    {
                        Page.SiteMaster().ShowError("Problem uplaoding Asset to SQl Database");
                    }
                    //saveBtnPlaceholder.Visible = false;
                }
                catch
                {
                    Page.SiteMaster().ShowError("Problem uplaoding Asset to SQl Database");
                }
            }
            catch
            {
                Page.SiteMaster().ShowError("Problem creating new asset");
            }
        }

        protected void UploadImg_Click(object sender, EventArgs e)
        {
            try
            {
                if (creatorImageUploader.PostedFile!=null)
                {

                
               var asset = Session["CreatorAsset"] as Asset;
                    if (asset == null) asset = new Asset();
                var filename = Guid.NewGuid().ToString();
                var ext = Path.GetExtension(creatorImageUploader.FileName);
                creatorImageUploader.SaveAs(Server.MapPath("/Account/Images/"+filename+ext));
                AssetImgBox.ImageUrl = "/Account/Images/" + filename + ext;
                asset.Images += filename + ext + ",";
                    Session["CreatorAsset"] = asset;
                //ImagePlaceHolder.Visible = true;
                }
            }
            catch
            {
                Page.SiteMaster().ShowError("Problem uploading image");
            }
        }
    }
}