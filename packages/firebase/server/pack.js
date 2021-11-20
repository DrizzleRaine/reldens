/**
 *
 * Reldens - Firebase Server Package
 *
 */

const { Logger, sc } = require('@reldens/utils');
const { PackInterface } = require('../../features/pack-interface');

class FirebasePack extends PackInterface
{

    setupPack(props)
    {
        this.events = sc.getDef(props, 'events', false);
        if(!this.events){
            Logger.error('EventsManager undefined in FirebasePack.');
        }
        this.events.on('reldens.serverBeforeListen', (props) => {
            props.serverManager.app.get('/reldens-firebase', (req, res) => {
                let jsonResponse = {enabled: false};
                if(process.env.RELDENS_FIREBASE_ENABLE){
                    jsonResponse.enabled = true;
                    jsonResponse.firebaseConfig = {
                        apiKey: process.env.RELDENS_FIREBASE_API_KEY,
                        authDomain: process.env.RELDENS_FIREBASE_AUTH_DOMAIN,
                        databaseURL: process.env.RELDENS_FIREBASE_DATABASE_URL,
                        projectId: process.env.RELDENS_FIREBASE_PROJECT_ID,
                        storageBucket: process.env.RELDENS_FIREBASE_STORAGE_BUCKET,
                        messagingSenderId: process.env.RELDENS_FIREBASE_MESSAGING_SENDER_ID,
                        appId: process.env.RELDENS_FIREBASE_APP_ID
                    };
                    if(process.env.RELDENS_FIREBASE_MEASUREMENTID && process.env.RELDENS_FIREBASE_MEASUREMENTID.length){
                        jsonResponse.firebaseConfig['measurementId'] = process.env.RELDENS_FIREBASE_MEASUREMENTID;
                    }
                }
                res.json(jsonResponse);
            });
        });
    }

}

module.exports.FirebasePack = FirebasePack;
