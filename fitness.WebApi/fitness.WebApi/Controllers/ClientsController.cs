using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using fitness.Data;

namespace fitness.WebApi.Controllers
{
    public class ClientsController : ApiController
    {
        private MyFitnessEntities db = new MyFitnessEntities();

        // GET: api/clients
        public IQueryable<client> Getclients()
        {
            return db.clients;
        }

        // GET: api/clients/5
        [ResponseType(typeof(client))]
        public IHttpActionResult Getclient(int id)
        {
            client client = db.clients.Find(id);
            if (client == null)
            {
                return NotFound();
            }

            return Ok(client);
        }

        // PUT: api/clients/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putclient(int id, client client)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != client.idClient)
            {
                return BadRequest();
            }

            db.Entry(client).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!clientExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/clients
        [ResponseType(typeof(client))]
        public IHttpActionResult Postclient(client client)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.clients.Add(client);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = client.idClient }, client);
        }

        // DELETE: api/clients/5
        [ResponseType(typeof(client))]
        public IHttpActionResult Deleteclient(int id)
        {
            client client = db.clients.Find(id);
            if (client == null)
            {
                return NotFound();
            }

            db.clients.Remove(client);
            db.SaveChanges();

            return Ok(client);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool clientExists(int id)
        {
            return db.clients.Count(e => e.idClient == id) > 0;
        }
    }
}