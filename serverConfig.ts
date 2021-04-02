// Read Me:
// These are Server Connection Options for the Jitsi library
// Best is to Keep them as a reference
// Just duplicate the file and name it serverConfig.ts to adjust to your likings

export const connectionOptions = {
  hosts: {
    // curl -s https://$JITSI_MEET_WEB_DOMAIN/index.html | grep config.hosts.domain
    domain: 'meet.jitsi',
    // curl -s https://$JITSI_MEET_WEB_DOMAIN/index.html | grep config.hosts.muc
    muc: 'muc.meet.jitsi',
    // curl -s https://$JITSI_MEET_WEB_DOMAIN/index.html | grep config.hosts.anonymousdomain
    anonymousdomain: 'guest.meet.jitsi',
    // curl -s https://$JITSI_MEET_WEB_DOMAIN/index.html | grep config.hosts.authdomain
    authdomain: 'meet.jitsi',
    // focus: 'focus.meet.jitsi',
  },

  externalConnectUrl: 'https://meet.n-fi.de/http-pre-bind',
  enableP2P: true,
  p2p: {
    enabled: true,
    preferH264: true,
    disableH264: true,
    useStunTurn: true,
  },
  useStunTurn: true,
  //bosh: `http://xmpp.meet.jitsi:5280`, // ! if you make your own please omit the "?room=chatmosphere1234" part

  // set to https://$JITSI_MEET_WEB_DOMAIN/http-bind
  serviceUrl: 'https://meet.n-fi.de/http-bind',
  websocket: 'wss://meet.n-fi.de/xmpp-websocket',
  // leave this as is
  clientNode: 'http://jitsi.org/jitsimeet',
}
