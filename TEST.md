# Testing Node Red
The `node-red-test-assets` folder contains a docker compose file that will create a workable test of node red and an mqqt broker.

The `flows.json` file can be imported to automatically configure the flow, otherwise, the broker's address is http://broker:8883.

The echo service defined in `src/application.controller.ts` simply returns whatever value is added to the `echo` mqqt topic.

## Steps
### Using flows.json
1. `cd node-red-test-assets && docker compose up`
2. Navigate to localhost:8881 to access the Node-RED UI
3. In the top right menu select import nodes and upload `node/node-red-test-assets/flows.json`


### Not Using flows.json
1. Instead of step 3 in the above list, create a MQQT receiver node. The service listens to the `echo` topic and returns any data sent
