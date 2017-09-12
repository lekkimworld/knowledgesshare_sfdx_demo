({
    doinit: function(component, event, helper) {
        // get user based on record id
        const action = component.get("c.getOwner");
        action.setParams({"recordId": component.get("v.recordId")});
        action.setCallback(this, (response) => {
            if (response.getState() === "SUCCESS") {
                const u = response.getReturnValue();
                component.set("v.user", u);
                component.set("v.headline", `${u.FirstName} ${u.LastName}`);
            } else {
                component.set("v.headline", "Error... Booh!!!");
                const toast = $A.get("e.force:showToast")
                toast.setParams({
                    "title": "Error",
                    "message": "Something went wrong..."
                })
                toast.fire();
            }
        });
        $A.enqueueAction(action);
    }
})
