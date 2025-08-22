import axios from "axios";
import config from "../config";

const url = config.API_URL;

class ConnectionService {

  checkHeaalth = () => {
    return axios.get(`${url}/healthcheck;`);
  };

  checkBackendConnection = () => {
    return axios.get(`${url}/con`);
  };

}

export default new ConnectionService();
