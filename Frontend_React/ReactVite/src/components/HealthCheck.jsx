import React, { useState, useEffect } from 'react';
import ConnectionService from '../services/ConnectionService';

function HealthCheck() {
  const [message, setMessage] = useState('Waiting...');

  useEffect(() => {
    const getStatus = async () => {
      try {
        const response = await ConnectionService.checkBackendConnection();
        setMessage(response.data); 
      } catch (error) {
        console.error('Error connecting to backend:', error);
        setMessage('Connection failed');
      }
    };

    getStatus();
  }, []);

  return (
    <>
      <h1>{message}</h1>
    </>
  );
}

export default HealthCheck;
