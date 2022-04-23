# Testing Node Red
The `node-red-test-assets` folder contains a docker compose file that will create a workable test of node red and an mqqt broker.

The `flows.json` file can be imported to automatically configure the flow, otherwise, the broker's address is http://broker:8883.

The echo service defined in `src/application.controller.ts` simply returns whatever value is added to the `echo` mqqt topic.
