abstract class InternetEvent{}  // this class is made to connect both the events // we can mark it abstract as we will not
                      // create its instant 

class InternetLostEvent extends InternetEvent{}

class InternetGainedEvent extends InternetEvent{}