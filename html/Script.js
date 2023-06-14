window.addEventListener("message", (Event) => {
    switch (Event.data.Action) {
        case "SetRequirements":
            if (Event.data.Display) {
                SetupRequirements(Event.data.Requirements)
            } else {
                $(".Main-Container").fadeOut(500)
            }
            break
        default:
            return;
    }
});

function SetupRequirements(Requirements) {
    $(".Main-Container").empty()
    $.each(Requirements, function(Index, Requirement) {
        $(".Main-Container").append(
            "<div class='Requirement-Slot'>" +
                "<span class='Amount'>" + Requirement["Amount"] + "x </span>" +
                "<img src='nui://" + Requirement["Image"] + "'>" +
                "<div class='Requirement-Label'>" +
                    "<span class='Item-Label'>" + Requirement["Label"] + "</span>" +
                "</div>" +
            "</div>"
        ).fadeIn(500)
    })
}