using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace SBPatients.Controllers
{
    [Authorize(Roles = "Administrators")]
    public class SBRoleController : Controller
    {
        private readonly UserManager<IdentityUser> userManager;
        private readonly RoleManager<IdentityRole> roleManager;

        public SBRoleController(
              UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            this.userManager = userManager;
            this.roleManager = roleManager;
        }

        // list all current roles, links to manage roles
        public IActionResult Index()
        {
            var roles = roleManager.Roles.OrderBy(a => a.Name);
            return View(roles);
        }

        // POST: SBRole/Create/role
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(string role)
        {
            try
            {
                role = role.Trim();
                if (String.IsNullOrWhiteSpace(role) || role == "")
                {
                    TempData["Message"] = "Role name can't be empty or just blanks";
                }
                else if (await roleManager.RoleExistsAsync(role))
                {
                    TempData["Message"] = "'" + role + "'" + " role is already on file";
                }
                else
                {
                    var res = await roleManager.CreateAsync(new IdentityRole { Name = role });
                    TempData["Message"] = "Role added : " + role;
                }
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["Message"] = $"Exception while creating role : { ex.GetBaseException().Message }";
                return RedirectToAction(nameof(Index));
            }
        }

        // GET : Delete Role
        public async Task<IActionResult> Delete(string role)
        {
            HttpContext.Session.SetString("RoleName", role);
            var users = userManager.Users.OrderBy(a => a.UserName);
            var usersInRole = new List<IdentityUser>();
            List<SelectListItem> userNames = new List<SelectListItem>();
            foreach (var user in users)
            {
                if (await userManager.IsInRoleAsync(user, role))
                {
                    usersInRole.Add(user);
                }
            }

            if (usersInRole.Count == 0)
            {
                try
                {
                    if (await roleManager.RoleExistsAsync(role))
                    {
                        IdentityRole roleToDelete = await roleManager.FindByNameAsync(role);
                        await roleManager.DeleteAsync(roleToDelete);
                    }
                }
                catch (Exception ex)
                {
                    TempData["Message"] = $"Exception deleting role : {ex.GetBaseException().Message}";
                    return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
                }
                TempData["Message"] = $"'{role}' deleted successfully";
                return RedirectToAction(nameof(Index));
            }

            TempData["Role"] = role;
            return View(usersInRole);
        }

        //Delete User
        public async Task<IActionResult> DeleteUser(string userName)
        {
            IdentityResult result; 
            IdentityUser user = await userManager.FindByNameAsync(userName);
            string currentUser = User.Identity.Name;
            if (currentUser.Equals(userName))
            {
                TempData["Message"] = $"You can't delete yourself";
                return RedirectToAction(nameof(UserIndex));
            }
            try
            {
                if (user != null)
                {
                    result = await userManager.DeleteAsync(user);
                }
                TempData["Message"] = $"'{userName}' deleted successfully";
                return RedirectToAction(nameof(UserIndex));
            }
            catch (Exception ex)
            {
                TempData["Message"] = $"Exception deleting user {userName} : {ex.GetBaseException().Message}";
                return RedirectToAction(nameof(UserIndex));
            }
        }

        // Delete 
        [HttpPost]
        public async Task<IActionResult> DeleteConfirmed(string role)
        {
            if (String.IsNullOrWhiteSpace(role))
            {
                role = HttpContext.Session.GetString("RoleName");
            }
            try
            {
                if (await roleManager.RoleExistsAsync(role))
                {
                    IdentityRole roleToDelete = await roleManager.FindByNameAsync(role);
                    await roleManager.DeleteAsync(roleToDelete);
                }
                TempData["Message"] = $"'{role}' deleted successfully";
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                TempData["Message"] = $"Exception deleting role {role} : {ex.GetBaseException().Message}";
                return RedirectToAction(nameof(Delete), new { role = HttpContext.Session.GetString("RoleName") });
            }
        }

        // GET : Users
        public async Task<IActionResult> UserIndex(string role)
        {
            if (String.IsNullOrWhiteSpace(role))
            {
                var userContext = userManager.Users.OrderBy(a => a.UserName);
                TempData["UserMaintenance"] = "True";
                TempData["Role"] = $"List of users registered";
                return View(userContext);
            }
            HttpContext.Session.SetString("RoleName", role);
            var users = userManager.Users.OrderBy(a => a.UserName);
            var usersInRole = new List<IdentityUser>();
            List<SelectListItem> userNames = new List<SelectListItem>();
            foreach (var user in users)
            {
                if (await userManager.IsInRoleAsync(user, role))
                {
                    usersInRole.Add(user);
                }
                else
                {
                    userNames.Add(new SelectListItem() { Text = $"{user.UserName}", Value = $"{user.UserName}" });
                }
            }
            ViewData["UserNames"] = new SelectList(userNames.OrderBy(a => a.Text), "Value", "Text");
            TempData["Role"] = $"Users In Role '{role}'";
            TempData["UserMaintenance"] = "False";
            return View(usersInRole);
        }

        // Delete User
        public async Task<IActionResult> UserDelete(string userName)
        {
            IdentityResult result;
            IdentityUser user = await userManager.FindByNameAsync(userName);
            string currentUser = User.Identity.Name;
            if (currentUser.Equals(userName))
            {
                TempData["Message"] = $"You can't remove yourself from Administrators role";
                return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
            }
            try
            {
                if (user != null)
                {
                    result = await userManager.RemoveFromRoleAsync(user, HttpContext.Session.GetString("RoleName"));
                    TempData["Message"] = $"'{user.UserName}' removed successfully";
                }
                else
                {
                    TempData["Message"] = "Please try again";
                }
                return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
            }
            catch (Exception ex)
            {
                TempData["Message"] = $"Exception deleting user '{user.UserName}', {ex.GetBaseException().Message}";
                return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
            }
        }

        // Add User
        [HttpPost]
        public async Task<IActionResult> UserAdd(string userName)
        {
            IdentityResult result;
            IdentityUser user = await userManager.FindByNameAsync(userName);
            try
            {
                if (user != null)
                {
                    result = await userManager.AddToRoleAsync(user, HttpContext.Session.GetString("RoleName"));
                    TempData["Message"] = $"'{user.UserName}' added successfully";
                }
                else
                {
                    TempData["Message"] = "Please try again";
                }
                return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
            }
            catch (Exception ex)
            {
                TempData["message"] = $"Exception adding user '{user.UserName}' to role, {ex.GetBaseException().Message}";
                return RedirectToAction(nameof(UserIndex), new { role = HttpContext.Session.GetString("RoleName") });
            }
        }
    }
}