trigger Trigger1 on Account (before insert) {
    for(account ac:trigger.new)
    {
        if(ac.Type==Null)
        {
            ac.addError('Type should not be empty');
            ac.Type.addError('Type is mandatory');
        }
    }
}