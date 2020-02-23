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
    public class SBPatientTreatmentController : Controller
    {
        private readonly PatientsContext _context;

        public SBPatientTreatmentController(PatientsContext context)
        {
            _context = context;
        }

        // GET: SBPatientTreatment
        public async Task<IActionResult> Index(string patientdiagnosisid, string patientname, string diagnosisname, string diagnosisid)
        {
            //Validation for QueryString variables
            if (String.IsNullOrWhiteSpace(patientdiagnosisid) || String.IsNullOrWhiteSpace(patientname) || String.IsNullOrWhiteSpace(diagnosisname) || String.IsNullOrWhiteSpace(diagnosisid))
            {
                if (String.IsNullOrWhiteSpace(HttpContext.Session.GetString("patientDiagnosisId")) ||
                    String.IsNullOrWhiteSpace(HttpContext.Session.GetString("patientName")) ||
                    String.IsNullOrWhiteSpace(HttpContext.Session.GetString("diagnosisName")) ||
                    String.IsNullOrWhiteSpace(HttpContext.Session.GetString("diagnosisId")))
                {
                    //If there is no data availables is sessions as well, an error message is returned to user
                    TempData["Error"] = "Please select one among the list of Diagnosis to get its data!";
                    return RedirectToAction("Index", "SBPatientDiagnosis");
                }
                else
                {
                    //If there is null data in parameters system tries to get them from saved sessions in browser
                    patientdiagnosisid = HttpContext.Session.GetString("patientDiagnosisId");
                    patientname = HttpContext.Session.GetString("patientName");
                    diagnosisname = HttpContext.Session.GetString("diagnosisName");
                    diagnosisid = HttpContext.Session.GetString("diagnosisId");
                }
            }
            else
            {
                //Available parameters are saved to sessions for future use
                HttpContext.Session.SetString("patientDiagnosisId", patientdiagnosisid);
                HttpContext.Session.SetString("patientName", patientname);
                HttpContext.Session.SetString("diagnosisName", diagnosisname);
                HttpContext.Session.SetString("diagnosisId", diagnosisid);
            }
            var patientsContext = _context.PatientTreatment.Include(p => p.PatientDiagnosis)
                .Include(p => p.Treatment)
                .Where(a => a.PatientDiagnosisId == Convert.ToInt32(patientdiagnosisid))
                .OrderByDescending(a => a.DatePrescribed);
            TempData["PatientTreatmentHeader"] = "Treatments for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(await patientsContext.ToListAsync());
        }

        // GET: SBPatientTreatment/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patientTreatment = await _context.PatientTreatment
                .Include(p => p.PatientDiagnosis)
                .Include(p => p.Treatment)
                .FirstOrDefaultAsync(m => m.PatientTreatmentId == id);
            if (patientTreatment == null)
            {
                return NotFound();
            }
            TempData["PatientTreatmentHeader"] = "Details of a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(patientTreatment);
        }

        // GET: SBPatientTreatment/Create
        public IActionResult Create()
        {
            int diagnosisId = Convert.ToInt32(HttpContext.Session.GetString("diagnosisId"));
            ViewData["TreatmentId"] = new SelectList(_context.Treatment.Where(a => a.DiagnosisId == diagnosisId), "TreatmentId", "Name");
            ViewData["Date"] = DateTime.Now;
            TempData["PatientTreatmentHeader"] = "Add a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View();
        }

        // POST: SBPatientTreatment/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PatientTreatmentId,TreatmentId,DatePrescribed,Comments,PatientDiagnosisId")] PatientTreatment patientTreatment)
        {
            //PatientDiagnosisId id rerieved from session
            patientTreatment.PatientDiagnosisId = Convert.ToInt32(HttpContext.Session.GetString("patientDiagnosisId"));
            if (ModelState.IsValid)
            {
                _context.Add(patientTreatment);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            int diagnosisId = Convert.ToInt32(HttpContext.Session.GetString("diagnosisId"));
            ViewData["TreatmentId"] = new SelectList(_context.Treatment.Where(a => a.DiagnosisId == diagnosisId), "TreatmentId", "Name", patientTreatment.TreatmentId);
            ViewData["Date"] = DateTime.Now;
            TempData["PatientTreatmentHeader"] = "Add a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(patientTreatment);
        }

        // GET: SBPatientTreatment/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patientTreatment = await _context.PatientTreatment.FindAsync(id);
            if (patientTreatment == null)
            {
                return NotFound();
            }
            int diagnosisId = Convert.ToInt32(HttpContext.Session.GetString("diagnosisId"));
            ViewData["TreatmentId"] = new SelectList(_context.Treatment.Where(a => a.DiagnosisId == diagnosisId), "TreatmentId", "Name", patientTreatment.TreatmentId);
            ViewData["Date"] = patientTreatment.DatePrescribed;
            TempData["PatientTreatmentHeader"] = "Edit a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(patientTreatment);
        }

        // POST: SBPatientTreatment/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PatientTreatmentId,TreatmentId,DatePrescribed,Comments,PatientDiagnosisId")] PatientTreatment patientTreatment)
        {
            if (id != patientTreatment.PatientTreatmentId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                //PatientDiagnosisId id rerieved from session
                patientTreatment.PatientDiagnosisId = Convert.ToInt32(HttpContext.Session.GetString("patientDiagnosisId"));
                try
                {
                    _context.Update(patientTreatment);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PatientTreatmentExists(patientTreatment.PatientTreatmentId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            int diagnosisId = Convert.ToInt32(HttpContext.Session.GetString("diagnosisId"));
            ViewData["TreatmentId"] = new SelectList(_context.Treatment.Where(a => a.DiagnosisId == diagnosisId), "TreatmentId", "Name", patientTreatment.TreatmentId);
            ViewData["Date"] = patientTreatment.DatePrescribed;
            TempData["PatientTreatmentHeader"] = "Edit a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(patientTreatment);
        }

        // GET: SBPatientTreatment/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patientTreatment = await _context.PatientTreatment
                .Include(p => p.PatientDiagnosis)
                .Include(p => p.Treatment)
                .FirstOrDefaultAsync(m => m.PatientTreatmentId == id);
            if (patientTreatment == null)
            {
                return NotFound();
            }
            TempData["PatientTreatmentHeader"] = "Delete a Treatment for " + HttpContext.Session.GetString("diagnosisName") + ", Patient: " + HttpContext.Session.GetString("patientName");
            return View(patientTreatment);
        }

        // POST: SBPatientTreatment/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var patientTreatment = await _context.PatientTreatment.FindAsync(id);
            _context.PatientTreatment.Remove(patientTreatment);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PatientTreatmentExists(int id)
        {
            return _context.PatientTreatment.Any(e => e.PatientTreatmentId == id);
        }
    }
}
