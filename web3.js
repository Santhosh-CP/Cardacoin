Cardacoin.introductionComplete.watch({}, '', function(error, result) {
    if (!error) {
        console.log("Introduction Completed between " + results.args._sender + " and " + results.args._recipient +"\n");
        console.log(result.args._sender + "'s contacts = " + result.args._senderContacts + "\n");
        console.log(results.args._recipient + "'s contacts = " + results.args._recipientContacts + "\n");
    }
})