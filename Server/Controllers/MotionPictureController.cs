using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Models;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MotionPictureController : ControllerBase
    {
        private CoreDbContext Context = new CoreDbContext();

        [HttpGet]
        public IEnumerable<MotionPicture> Get()
        {
            return Context.MotionPictures.ToList();
        }

        [HttpPut]
        public MotionPicture Put(string Name, string Description, int ReleaseYear)
        {
            var record = new MotionPicture
            {
                Name = Name,
                Description = Description,
                ReleaseYear = ReleaseYear
            };
            Context.Add(record);
            Context.SaveChanges();
            return record;

        }

        [HttpPost]
        public MotionPicture Post(int id, string Name, string Description, int ReleaseYear)
        {

            var record = Context.MotionPictures.Where(x => x.Id == id).FirstOrDefault();
            record.Name = Name;
            record.Description = Description;
            record.ReleaseYear = ReleaseYear;

            Context.SaveChanges();
            return record;
        }
        [HttpDelete]
        public bool Delete(int id)
        {
            var record = Context.MotionPictures.Where(x => x.Id == id).FirstOrDefault();
            if (record == null) return false;
            Context.Remove(record);
            Context.SaveChanges();

            return true;
        }
    }
}
