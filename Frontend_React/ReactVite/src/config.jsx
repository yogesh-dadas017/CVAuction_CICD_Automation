const isLocalhost = window.location.hostname === 'localhost';

const config = {
  API_URL: isLocalhost ? 'http://localhost:5087/api' : 'http://backend/api',
};

export default config;
