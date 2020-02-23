using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SBPatients.Models;

namespace SBPatients.Controllers
{
    public class SBPatientController : Controller
    {
        private readonly PatientsContext _context;

        public SBPatientController(PatientsContext context)
        {
            _context = context;
        }

        // GET: SBPatient
        public async Task<IActionResult> Index()
        {
            var patientsContext = _context.Patient.OrderBy(a => a.FirstName).ThenBy(b => b.LastName);
            return View(await patientsContext.ToListAsync());
        }

        // GET: SBPatient/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patient
                .Include(p => p.ProvinceCodeNavigation)
                .FirstOrDefaultAsync(m => m.PatientId == id);
            HttpContext.Session.SetString("PatientName", patient.FirstName + ", " + patient.LastName);
            if (patient == null)
            {
                return NotFound();
            }
            TempData["PatientName"] = HttpContext.Session.GetString("PatientName");
            TempData["DateOfBirth"] = patient.DateOfBirth.HasValue ? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            return View(patient);
        }

        // GET: SBPatient/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: SBPatient/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PatientId,FirstName,LastName,Address,City,ProvinceCode,PostalCode,Ohip,DateOfBirth,Deceased,DateOfDeath,HomePhone,Gender")] Patient patient)
        {
            if (ModelState.IsValid)
            {
                _context.Add(patient);
                await _context.SaveChangesAsync();
                TempData["Message"] = "'" + patient.FirstName + ", " + patient.LastName + "' has been added successfully";
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProvinceCode"] = new SelectList(_context.Province, "ProvinceCode", "ProvinceCode", patient.ProvinceCode);
            TempData["Error"] = "Please try again after correcting all the displayed errors";
            TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            TempData["DateOfBirth"] = patient.DateOfBirth.HasValue ? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            return View(patient);
        }

        // GET: SBPatient/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patient.FindAsync(id);
            HttpContext.Session.SetString("PatientName", patient.FirstName + ", " + patient.LastName);
            if (patient == null)
            {
                return NotFound();
            }
            TempData["DateOfBirth"] = patient.DateOfBirth.HasValue? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            ViewData["ProvinceCode"] = new SelectList(_context.Province.OrderBy(a => a.Name), "ProvinceCode", "Name", patient.ProvinceCode);
            TempData["PatientName"] = HttpContext.Session.GetString("PatientName");
            return View(patient);
        }

        // POST: SBPatient/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PatientId,FirstName,LastName,Address,City,ProvinceCode,PostalCode,Ohip,DateOfBirth,Deceased,DateOfDeath,HomePhone,Gender")] Patient patient)
        {
            if (id != patient.PatientId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(patient);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PatientExists(patient.PatientId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                TempData["Message"] = "'" + patient.FirstName + ", " + patient.LastName + "' data has been updated successfully";
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProvinceCode"] = new SelectList(_context.Province.OrderBy(a => a.Name), "ProvinceCode", "Name", patient.ProvinceCode);
            TempData["PatientName"] = HttpContext.Session.GetString("PatientName");
            TempData["Error"] = "Please try again after correcting all the displayed errors";
            TempData["DateOfBirth"] = patient.DateOfBirth.HasValue ? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            return View(patient);
        }

        // GET: SBPatient/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patient
                .Include(p => p.ProvinceCodeNavigation)
                .FirstOrDefaultAsync(m => m.PatientId == id);
            HttpContext.Session.SetString("PatientName", patient.FirstName + ", " + patient.LastName);
            if (patient == null)
            {
                return NotFound();
            }
            TempData["PatientName"] = HttpContext.Session.GetString("PatientName");
            TempData["DateOfBirth"] = patient.DateOfBirth.HasValue ? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
            return View(patient);
        }

        // POST: SBPatient/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var patient = await _context.Patient.FindAsync(id);
            try
            {
                _context.Patient.Remove(patient);
                await _context.SaveChangesAsync();
                TempData["Message"] = "'" + patient.FirstName + ", " + patient.LastName + "' has been deleted successfully";
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                TempData["Error"] = "There are Medications or Treatments associated with this Patient, please delete them first to proceed.";
                TempData["PatientName"] = HttpContext.Session.GetString("PatientName");
                TempData["DateOfBirth"] = patient.DateOfBirth.HasValue ? patient.DateOfBirth.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
                TempData["DateOfDeath"] = patient.DateOfDeath.HasValue ? patient.DateOfDeath.Value.ToString("MM/dd/yyyy hh:mm tt") : "";
                return View(patient);
            }
        }

        private bool PatientExists(int id)
        {
            return _context.Patient.Any(e => e.PatientId == id);
        }
    }
}
