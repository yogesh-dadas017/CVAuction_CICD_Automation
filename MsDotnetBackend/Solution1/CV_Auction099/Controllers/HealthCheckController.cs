using System.Security.Cryptography;
using CV_Auction099.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CV_Auction099.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HealthCheckController : ControllerBase
    {

        [HttpGet]
        public async Task<ActionResult<string>> GetBids()
        {
            return Ok("API Working ...");
        }

        [HttpGet("/api/con")]
        public async Task<ActionResult<string>> GetConnection()
        {
            Console.WriteLine("Request incoming from frontend..");
            return Ok("Connection Working with backed ...");
        }
    }
}
