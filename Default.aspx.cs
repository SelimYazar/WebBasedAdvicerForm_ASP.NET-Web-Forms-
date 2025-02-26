using System;
using System.Web.UI;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace _152120191023_SelimCanYazar_WebBasedTechnologies__HW_1
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Sayfa yüklendiğinde herhangi bir işlem yapmıyoruz
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userName = TextBox1.Text;
            string selectedCountry = DropDownList1.SelectedItem.Text;
            string selectedGender = RadioButtonList1.SelectedItem.Text;
            string selectedBirthday = Request.Form["Birthday"]; // Yeni date input'unun değeri
            string selectedHobbies = GetSelectedHobbies();

            // Kullanıcının yaşını hesapla
            DateTime birthDate;
            bool isValidDate = DateTime.TryParse(selectedBirthday, out birthDate);

            // Eğer tarih geçerli değilse veya gelecekteyse hata ver
            if (!isValidDate || birthDate > DateTime.Now)
            {
                Label1.Text = "<span style='color: red;'>Error: Please enter a valid birth date.</span>";
                return; // İşlemi burada durdur
            }

            int birthYear = birthDate.Year;
            int currentYear = DateTime.Now.Year;
            int age = currentYear - birthYear;
            string ageGroup = GetAgeGroup(age);

            // Kullanıcıya özel öneri listesi oluştur
            List<string> recommendations = GetRecommendations(selectedCountry, selectedGender, ageGroup, selectedHobbies);

            // Sonuçları Label1'de göster
            Label1.Text = $"Name: {userName}<br/>" +
                          $"Country: {selectedCountry}<br/>" +
                          $"Gender: {selectedGender}<br/>" +
                          $"Birthday: {selectedBirthday}<br/>" +
                          $"Age Group: {ageGroup}<br/>" +
                          $"Hobbies: {selectedHobbies}<br/><br/>" +
                          "Recommended places:<br/>";

            foreach (var recommendation in recommendations)
            {
                Label1.Text += "- " + recommendation + "<br/>";
            }
        }



        // Seçilen hobileri döndüren yardımcı fonksiyon
        private string GetSelectedHobbies()
        {
            string hobbies = "";
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    if (!string.IsNullOrEmpty(hobbies))
                    {
                        hobbies += ", ";
                    }
                    hobbies += item.Text;
                }
            }
            return hobbies;
        }

        // Yaş grubunu belirleyen fonksiyon
        private string GetAgeGroup(int age)
        {
            if (age >= 50)
                return "50 and above";
            else if (age >= 40)
                return "40-49";
            else if (age >= 30)
                return "30-39";
            else if (age >= 20)
                return "20-29";
            else
                return "Under 20";
        }

        // Kullanıcıya özel önerileri döndüren fonksiyon
        private List<string> GetRecommendations(string country, string gender, string ageGroup, string hobbies)
        {
            List<string> recommendations = new List<string>();

            // Hobiye göre öneriler
            if (hobbies.Contains("chess"))
            {
                recommendations.Add("International Chess Club, " + country);
                recommendations.Add("Strategic Minds Café, " + country);
                if (hobbies.Split(',').Length == 1) // Sadece chess seçilmişse 4 öneri ver
                {
                    recommendations.Add("Grandmasters Lounge, " + country);
                    recommendations.Add("Open Chess Tournament Venue, " + country);
                }
            }

            if (hobbies.Contains("Football"))
            {
                recommendations.Add("Local Football Academy, " + country);
                recommendations.Add("Community Soccer Field, " + country);
                if (hobbies.Split(',').Length == 1)
                {
                    recommendations.Add("Professional Football Training Camp, " + country);
                    recommendations.Add("Historic Football Museum, " + country);
                }
            }

            if (hobbies.Contains("Coding"))
            {
                recommendations.Add("Tech Innovation Hub, " + country);
                recommendations.Add("Startup Incubator, " + country);
                if (hobbies.Split(',').Length == 1)
                {
                    recommendations.Add("AI & Robotics Lab, " + country);
                    recommendations.Add("Cyber Security Training Center, " + country);
                }
            }

            // Ülkeye göre öneriler
            if (country == "Turkey")
            {
                recommendations.Add("Hagia Sophia, Istanbul");
                recommendations.Add("Topkapi Palace, Istanbul");
                recommendations.Add("Pamukkale, Denizli");
                recommendations.Add("Cappadocia, Nevşehir");
            }
            else if (country == "Germany")
            {
                recommendations.Add("Brandenburg Gate, Berlin");
                recommendations.Add("Neuschwanstein Castle, Bavaria");
                recommendations.Add("Black Forest, Baden-Württemberg");
                recommendations.Add("Cologne Cathedral, Cologne");
            }
            else if (country == "Poland")
            {
                recommendations.Add("Wawel Castle, Krakow");
                recommendations.Add("Auschwitz Memorial, Oświęcim");
                recommendations.Add("Old Town, Warsaw");
                recommendations.Add("Białowieża Forest, Podlasie");
            }
            else if (country == "Greece")
            {
                recommendations.Add("Acropolis of Athens, Athens");
                recommendations.Add("Santorini, Cyclades");
                recommendations.Add("Meteora Monasteries, Thessaly");
                recommendations.Add("Delphi, Central Greece");
            }
            else if (country == "Italy")
            {
                recommendations.Add("Colosseum, Rome");
                recommendations.Add("Venice Grand Canal, Venice");
                recommendations.Add("Leaning Tower of Pisa, Pisa");
                recommendations.Add("Amalfi Coast, Campania");
            }
            else if (country == "Iraq")
            {
                recommendations.Add("Babylon Ruins, Hillah");
                recommendations.Add("Erbil Citadel, Erbil");
                recommendations.Add("Ziggurat of Ur, Dhi Qar");
                recommendations.Add("Al-Mutanabbi Street, Baghdad");
            }
            else if (country == "Other Country")
            {
                recommendations.Add("Skyline Viewpoint ");
                recommendations.Add("Interactive Science & Technology Center");
                recommendations.Add("Hidden Gem Street Food Market");
                recommendations.Add("Underground Cultural Hub");
            }
            // Yaş grubuna göre öneriler
            if (ageGroup == "30-39")
            {
                recommendations.Add("Wellness Retreat, " + country);
                recommendations.Add("Business Networking Hub, " + country);
            }
            else if (ageGroup == "40-49")
            {
                recommendations.Add("Luxury Golf Resort, " + country);
                recommendations.Add("Exclusive Wine Tasting, " + country);
            }
            else if (ageGroup == "50 and above")
            {
                recommendations.Add("Cultural Heritage Tour, " + country);
                recommendations.Add("Luxury Cruise Experience, " + country);
            }
            else if (ageGroup == "Under 20")
            {
                recommendations.Add("Amusement Park, " + country);
                recommendations.Add("Music Festival, " + country);
            }
            else if (ageGroup == "20-29")
            {
                recommendations.Add("Adventure Sports Destination, " + country);
                recommendations.Add("Digital Nomad Hotspot, " + country);
            }


            // Cinsiyete göre öneriler
            if (gender == "Male")
            {
                recommendations.Add("Sports Bar, " + country);
                recommendations.Add("Adventure Park, " + country);
            }
            else if (gender == "Female")
            {
                recommendations.Add("Fashion Mall, " + country);
                recommendations.Add("Spa Retreat, " + country);
            }
            else if (gender == "Prefer not to say")
            {
                recommendations.Add("Botanic Garden, " + country);
                recommendations.Add("Cultural Experience Center, " + country);
            }

            // En az 10 öneri sağlamak için ek öneriler ekle
            while (recommendations.Count == 12)
            {
                recommendations.Add("Explore new places in" + country + " (with your friends)");
            }
            while (recommendations.Count == 13)
            {
                recommendations.Add("Explore natural beauty in" + country + " (with your family)");
            }
            return recommendations.GetRange(0, 14);
        }

    }
}
