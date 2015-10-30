(function (CompaniesViewModel, $, undefined) {
    

    StoreUpdatesViewModel.dataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: "/api/StoreUpdate/Stores",
                cache: false
            }
        },
        pageSize: 5,
        schema: {
            model: {
                id: "ID",
                "ID": { type: "number" },
                "Name": { type: "string" },
                "StoreId": { type: "string" },
                "Street": { type: "string" },
                "City": { type: "string" },
                "Chain": { type: "string" },
                "ChainID": { type: "string" },
                "Zipcode": { type: "string" }
            }
        }
    });

    this.findStore = function () {
        var id = StoreUpdatesViewModel.RetailerStoreID();

        $.ajax({
            type: "POST",
            url: '/api/StoreUpdate/StoreInfoById',
            contentType: "application/json; charset = utf-8",
            data: JSON.stringify({ StoreID: id }),
            dataType: "json",
            success: function (data) {
                if (data) {

                    StoreUpdatesViewModel.SapId(data.SapId);
                    StoreUpdatesViewModel.StoreName(data.StoreName);
                    StoreUpdatesViewModel.ChainID(data.ChainID);
                    StoreUpdatesViewModel.ChainName(data.ChainName);
                    StoreUpdatesViewModel.RetailerStoreID(data.RetailerStoreID);
                    StoreUpdatesViewModel.StoreManager(data.StoreManager);
                    StoreUpdatesViewModel.StoreManager_FirstName(data.StoreManager_FirstName);
                    StoreUpdatesViewModel.StoreManager_LastName(data.StoreManager_LastName);
                    StoreUpdatesViewModel.StoreManager_CellPhone(data.StoreManager_CellPhone);
                    StoreUpdatesViewModel.Address_PObox(data.Address_PObox);
                    StoreUpdatesViewModel.Address_Street(data.Address_Street);
                    StoreUpdatesViewModel.Address_Zip(data.Address_Zip);
                    StoreUpdatesViewModel.Address_City(data.Address_City);
                    StoreUpdatesViewModel.Phone(data.Phone);
                    StoreUpdatesViewModel.Email(data.Email);
                    StoreUpdatesViewModel.IsActive(data.IsActive);
                    StoreUpdatesViewModel.Country(data.Country);
                    StoreUpdatesViewModel.CountryCode(data.CountryCode);
                    StoreUpdatesViewModel.BHNID(data.BHNID);
                    StoreUpdatesViewModel.DataArea(data.DataArea);
                    StoreUpdatesViewModel.DateModified(data.DateModified);
                    //  StoreUpdatesViewModel.ImplementDate(new Date()); //(data.ImplementDate.toLocalDate);
                    StoreUpdatesViewModel.Version(data.Version);

                } else {
                    messageToUser("Can't ");

                }
            },
            error: function (error) {
                messageToUser("Controller method StoreInfoById failed to return correctly");
            }
        });
    };

    this.createStoreUpdate = function () {
        
        
        $.ajax({
            type: "POST",
            url: '/api/StoreUpdate/PlanStoreUpdate',
            contentType: "application/json; charset = utf-8",
            data: JSON.stringify({
                RetailerStoreID: StoreUpdatesViewModel.RetailerStoreID(),
                SapId: StoreUpdatesViewModel.SapId(),
                StoreName: StoreUpdatesViewModel.StoreName(),
                ChainID: StoreUpdatesViewModel.ChainID(),
                ChainName: StoreUpdatesViewModel.ChainName(),
                StoreManager: StoreUpdatesViewModel.StoreManager(),
                StoreManager_FirstName: StoreUpdatesViewModel.StoreManager_FirstName(),
                StoreManager_LastName: StoreUpdatesViewModel.StoreManager_LastName(),
                StoreManager_CellPhone: StoreUpdatesViewModel.StoreManager_CellPhone(),
                Address_PObox: StoreUpdatesViewModel.Address_PObox(),
                Address_Street: StoreUpdatesViewModel.Address_Street(),
                Address_Zip: StoreUpdatesViewModel.Address_Zip(),
                Address_City: StoreUpdatesViewModel.Address_City(),
                Phone: StoreUpdatesViewModel.Phone(),
                Email: StoreUpdatesViewModel.Email(),
                IsActive: StoreUpdatesViewModel.IsActive(),
                Country: StoreUpdatesViewModel.Country(),
                CountryCode: StoreUpdatesViewModel.CountryCode(),
                BHNID: StoreUpdatesViewModel.BHNID(),
                DataArea: StoreUpdatesViewModel.DataArea(),
                DateModified: StoreUpdatesViewModel.DateModified(),
                ImplementDate: StoreUpdatesViewModel.ImplementDate(),
                Version: StoreUpdatesViewModel.Version()
            }),
            dataType: "json",
            success: function (data) {
                if (data) {
                    alert("store update added to database");
                }
            }
        });
    };

    this.clearFields = function () {
        cardhistID("");
        teleSerialNum("");
        paysafeNum("");
    };

    this.onEnter = function (d, e) {
        if (e.keyCode === 13) {
            //alert("enter");
            // findCard();
        };
        return true;
    };

    this.onChange = function (e) {
        var selectedDataItem = e != null ? e.sender.dataItem(e.sender.select()) : null;
        var num = selectedDataItem.StoreId;
        StoreUpdatesViewModel.RetailerStoreID(num);
        findStore();
    }

   
    CompaniesViewModel.init = function () {
        ko.applyBindings(window.CompaniesViewModel);

    };

}(window.CompaniesViewModel = window.CompaniesViewModel || {}, jQuery));

$(document).ready(function () {
    CompaniesViewModel.init();
});