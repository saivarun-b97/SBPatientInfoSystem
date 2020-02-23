using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SBPatients.Models;

namespace SBPatients.Controllers
{
    public class SBMedicationController : Controller
    {
        private readonly PatientsContext _context;

        public SBMedicationController(PatientsContext context)
        {
            _context = context;
        }

        // GET: SBMedication
        public async Task<IActionResult> Index(string id, string name)
        {
            //Validation for QueryString variables
            if (String.IsNullOrWhiteSpace(id) || String.IsNullOrWhiteSpace(name))
            {
                //If there is null data in ID or Name system tries to get them from saved sessions in browser
                id = HttpContext.Session.GetString("code");
                name = HttpContext.Session.GetString("name");
                if (String.IsNullOrWhiteSpace(HttpContext.Session.GetString("code")) || String.IsNullOrWhiteSpace(HttpContext.Session.GetString("name")))
                {
                    //If there is no data availables is sessions as well, an error message is returned to user
                    TempData["Error"] = "Please select one among the list of Medication Types to get its data!";
                    return RedirectToAction("Index", "SBMedicationType");
                }
                else
                {
                    //Available ID and Name are saved to sessions for future use
                    HttpContext.Session.SetString("code", id);
                    HttpContext.Session.SetString("name", name);
                }
            }
            else
            {
                //Available ID and Name are saved to sessions for future use
                HttpContext.Session.SetString("code", id);
                HttpContext.Session.SetString("name", name);
            }
            //Listing is filtered for specific Medication ID
            //Listing is in order by medication name and then by concentration
            var patientsContext = _context.Medication.Include(m => m.ConcentrationCodeNavigation)
                                                     .Include(m => m.DispensingCodeNavigation)
                                                     .Include(m => m.MedicationType)
                                                     .OrderBy(a => a.Name)
                                                     .ThenBy(a => a.Concentration)
                                                     .Where(a => a.MedicationTypeId == Convert.ToInt32(id));
            //TempData for heading
            TempData["MedicationTypeName"] = name;
            return View(await patientsContext.ToListAsync());
        }

        // GET: SBMedication/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var medication = await _context.Medication
                .Include(m => m.ConcentrationCodeNavigation)
                .Include(m => m.DispensingCodeNavigation)
                .Include(m => m.MedicationType)
                .FirstOrDefaultAsync(m => m.Din == id);
            if (medication == null)
            {
                return NotFound();
            }
            //TempData for heading
            TempData["MedicationTypeName"] = "Details of Medication " + HttpContext.Session.GetString("name");
            return View(medication);
        }

        // GET: SBMedication/Create
        public IActionResult Create()
        {
            //Select lists are ordered accordingly
            ViewData["ConcentrationCode"] = new SelectList(_context.ConcentrationUnit.OrderBy(a => a.ConcentrationCode), "ConcentrationCode", "ConcentrationCode");
            ViewData["DispensingCode"] = new SelectList(_context.DispensingUnit.OrderBy(a => a.DispensingCode), "DispensingCode", "DispensingCode");
            ViewData["MedicationTypeId"] = new SelectList(_context.MedicationType.Where(a => a.MedicationTypeId == Convert.ToInt32(HttpContext.Session.GetString("code"))), "MedicationTypeId", "Name");
            TempData["MedicationTypeName"] = "Create Medication for " + HttpContext.Session.GetString("name");
            return View();
        }

        // POST: SBMedication/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Din,Name,Image,MedicationTypeId,DispensingCode,Concentration,ConcentrationCode")] Medication medication)
        {
            //Exception handling for model if user enters duplicate Din
            try
            {
                if (ModelState.IsValid)
                {
                    var existingMedications = await _context.Medication.Include(m => m.ConcentrationCodeNavigation).ToListAsync();

                    //Validation to see whether user entered unique data for Name, Concentration and ConcentrationCode
                    foreach (var em in existingMedications)
                    {
                        if (em.ConcentrationCode == medication.ConcentrationCode && em.Concentration == medication.Concentration && em.Name == medication.Name)
                        {
                            ModelState.AddModelError("", "Please create a unique medication");
                            ModelState.AddModelError("Name", "There is already a medication with this Name");
                            ModelState.AddModelError("Concentration", "There is already a medication with this Concentration");
                            ModelState.AddModelError("ConcentrationCode", "There is already a medication with this Concentration Unit");
                            ViewData["ConcentrationCode"] = new SelectList(_context.ConcentrationUnit, "ConcentrationCode", "ConcentrationCode", medication.ConcentrationCode);
                            ViewData["DispensingCode"] = new SelectList(_context.DispensingUnit, "DispensingCode", "DispensingCode", medication.DispensingCode);
                            ViewData["MedicationTypeId"] = new SelectList(_context.MedicationType.Where(a => a.MedicationTypeId == Convert.ToInt32(HttpContext.Session.GetString("code"))), "MedicationTypeId", "Name", medication.MedicationTypeId);
                            TempData["MedicationTypeName"] = "Create Medication for " + HttpContext.Session.GetString("name");
                            return View(medication);
                        }
                    }
                    _context.Add(medication);
                    await _context.SaveChangesAsync();
                    TempData["UpdateMessage"] = $"Medications updated: {medication.Name}";
                    return RedirectToAction(nameof(Index));
                }
            }
            catch (Exception)
            {
                ModelState.AddModelError("Din", "Din number already exists");
            }
            ViewData["ConcentrationCode"] = new SelectList(_context.ConcentrationUnit, "ConcentrationCode", "ConcentrationCode", medication.ConcentrationCode);
            ViewData["DispensingCode"] = new SelectList(_context.DispensingUnit, "DispensingCode", "DispensingCode", medication.DispensingCode);
            ViewData["MedicationTypeId"] = new SelectList(_context.MedicationType.Where(a => a.MedicationTypeId == Convert.ToInt32(HttpContext.Session.GetString("code"))), "MedicationTypeId", "Name", medication.MedicationTypeId);
            TempData["MedicationTypeName"] = "Create Medication for " + HttpContext.Session.GetString("name");
            return View(medication);
        }

        // GET: SBMedication/Edit/5
        public async Task<IActionResult> Edit(string id, string code)
        {
            if (id == null || code == null)
            {
                return NotFound();
            }

            var medication = await _context.Medication.FindAsync(id);
            if (medication == null)
            {
                return NotFound();
            }
            //Select lists are ordered accordingly and ConcentrationCode is filtered
            ViewData["ConcentrationCode"] = new SelectList(_context.ConcentrationUnit.Where(a => a.ConcentrationCode == code), "ConcentrationCode", "ConcentrationCode", medication.ConcentrationCode);
            ViewData["DispensingCode"] = new SelectList(_context.DispensingUnit.OrderBy(a => a.DispensingCode), "DispensingCode", "DispensingCode", medication.DispensingCode);
            ViewData["MedicationTypeId"] = new SelectList(_context.MedicationType, "MedicationTypeId", "Name", medication.MedicationTypeId);
            TempData["MedicationTypeName"] = "Edit Medication for " + HttpContext.Session.GetString("name");
            return View(medication);
        }

        // POST: SBMedication/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Din,Name,Image,MedicationTypeId,DispensingCode,Concentration,ConcentrationCode")] Medication medication)
        {
            if (id != medication.Din)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(medication);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MedicationExists(medication.Din))
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
            ViewData["ConcentrationCode"] = new SelectList(_context.ConcentrationUnit, "ConcentrationCode", "ConcentrationCode", medication.ConcentrationCode);
            ViewData["DispensingCode"] = new SelectList(_context.DispensingUnit, "DispensingCode", "DispensingCode", medication.DispensingCode);
            ViewData["MedicationTypeId"] = new SelectList(_context.MedicationType, "MedicationTypeId", "Name", medication.MedicationTypeId);
            return View(medication);
        }

        // GET: SBMedication/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var medication = await _context.Medication
                .Include(m => m.ConcentrationCodeNavigation)
                .Include(m => m.DispensingCodeNavigation)
                .Include(m => m.MedicationType)
                .FirstOrDefaultAsync(m => m.Din == id);
            if (medication == null)
            {
                return NotFound();
            }
            TempData["MedicationTypeName"] = "Delete Medication for " + HttpContext.Session.GetString("name");
            return View(medication);
        }

        // POST: SBMedication/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            try
            {
                var medication = await _context.Medication.FindAsync(id);
                _context.Medication.Remove(medication);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch (Exception)
            {
                TempData["DeleteError"] = "There are Patients or Treatments associated with this Medication, please delete them first to proceed.";
                return RedirectToAction(nameof(Index));
            }
        }

        private bool MedicationExists(string id)
        {
            return _context.Medication.Any(e => e.Din == id);
        }
    }
}
