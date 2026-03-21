({
    getReviews: function(component, event, helper) {
        var action = component.get("c.fetchReviews");

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reviewList", response.getReturnValue());
            } else {
                console.error('Error fetching reviews', response.getError());
            }
        });
        $A.enqueueAction(action);
    }
})