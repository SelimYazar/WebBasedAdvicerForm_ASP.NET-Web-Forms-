<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_152120191023_SelimCanYazar_WebBasedTechnologies__HW_1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Advicer Form</title>
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>
        /* Arka plan videosu */
        #background-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -1;
            object-fit: cover;
        }

        /* Sayfa genel stili */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction:column;
            justify-content: center;
            align-items: center;
            
            margin: 0;
            box-sizing:border-box;
        }

        /* Form tasarımı */
        form {
            display:grid;
            grid-template-columns:1fr;
            justify-items:center;
            width: 70vh;
            margin: 20px auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.85); /* Saydam beyaz arka plan */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Giriş alanları */
        input[type="text"], .asp-TextBox {
            width: 90%;
            padding: 10px;
            font-size: 14px;
            border: 2px solid #ddd;
            border-radius: 5px;
            transition: all 0.7s ease-in-out;
        }

        input[type="text"]::placeholder {
            color: cornflowerblue;
            font-style: italic;
        }

        input[type="text"]:hover, input[type="text"]:focus {
            border-color: #3366cc;
            background-color: #e6f0ff;
            color: cornflowerblue;
        }
        input[type="text"].active {
            background-color: #004080; /* Koyu mavi */
            color: white; /* Yazıyı beyaz yap */
            border-color: #00264d; /* Kenar rengi */
        }



        /* Seçim kutuları ve butonlar */
        input[type="checkbox"], input[type="radio"], select, button {
            transition: background-color 0.7s, border-color 0.7s;
            margin-bottom: 15px;
        }

        button, .asp-Button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            border: 2px solid #4CAF50;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top:10px
        }

        button:hover, .asp-Button:hover {
            background-color: white;
            border: 2px solid #45a049;
            color: #45a049;

        }
        button:hover, .asp-Button:checked {
    background-color: #45a049;
    border: 2px solid #45a049;
    color:white ;

}

        /* Takvim */
        input[type="date"], .asp-Calendar {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 2px solid #ddd;
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }

        input[type="date"]:hover, .asp-Calendar:hover {
            border-color: #3366cc;
        }

        /* Etiketler */
        label, .asp-Label {
            font-family: Arial, sans-serif;
            font-style: italic;
            font-size: 16px;
            color: #333;
            /*background-color:rgba(255, 255, 255, 0.85);*/
            padding: 5px;
            border-radius: 5px;
            margin-top:15px;
            line-height: 1.5; /* Satır aralığı artırıldı */
            text-align: center; /* Metin ortalandı */
            margin-top: 20px; /* Butonla arasına mesafe koyuldu */
             padding: 10px; /* İç boşluğu artırıldı */
                

        }
        .asp-DropDownList {
            width: 90%;
             padding: 10px;
             font-size: 14px;
    border: 2px solid #ddd;
    border-radius: 5px;
    transition: all 0.5s ease-in-out;
    background-color: #f0f8ff; /* Açık mavi tonu */
}

.asp-DropDownList:hover {
    background-color: #cce6ff; /* Daha belirgin açık mavi */
    border-color: #3366cc;
}

.asp-DropDownList:focus {
    background-color: #004080; /* Seçim anında koyu mavi */
    color: white; /* Yazıyı daha görünür hale getirmek için */
    border-color: #00264d;
}

.asp-DropDownList.active {
    background-color: #004080;  /* Koyu mavi arka plan */
    color: white;                /* Beyaz metin rengi */
    border-color: #00264d;       /* Koyu mavi border */
}

/* CheckBoxList ve RadioButtonList için genel stil */
.asp-CheckBoxList input[type="checkbox"],
.asp-RadioButtonList input[type="radio"] {
    display: none; /* Varsayılan inputları gizle */
}

/* Label için stil */
.asp-CheckBoxList label,
.asp-RadioButtonList label {
    /*display: block;*/
    display: inline-block; /* Yan yana hizalama */
    padding: 8px;
    font-size: 14px;
    border-radius: 10px;
    transition: all 0.3s ease-in-out;
    cursor: pointer;
    background-color: white;
    border: 2px solid #ddd;
}

/* Hover efekti (Artık çalışacak!) */
.asp-CheckBoxList label:hover,
.asp-RadioButtonList label:hover {
    background-color: #cce6ff; /* Açık mavi */
    border-radius: 10px;
    color: gray;
}

/* Seçili olan öğeler için (Focus yerine Checked kullanıyoruz) */
.asp-CheckBoxList input[type="checkbox"]:checked + label,
.asp-RadioButtonList input[type="radio"]:checked + label {
    background-color: #004080; /* Koyu mavi */
    color: white;
    border-radius: 10px;
    border-color: #00264d;
}

/* Checkbox'tan işaretleme kaldırıldığında rengi eski haline getir */
.asp-CheckBoxList input[type="checkbox"]:not(:checked) + label {
    background-color: white;
    color: black;
    border-color: #ddd;
}
.asp-CheckBoxList tr,
.asp-RadioButtonList tr {
    display: inline-block; /* Her satırı yan yana hizala */
}
.asp-CheckBoxList {
    display:grid;
    justify-items:center;
}
h3 {
    font-size: 20px;  /* Font büyüklüğü */
    font-weight: bold; /* Kalın yazı */
    color: #004080;    /* Koyu mavi renk */
    text-align: center; /* Ortaya hizalama */
    margin-top: 20px;  /* Yukarıdan boşluk */
    margin-bottom: 10px; /* Aşağıdan boşluk */
}
input[type="date"] {
    font-size: 16px;
    padding: 10px;
    margin: 10px;
    border-radius: 5px;
    text-align:center;
}

input[type="date"].active {
    background-color: #dcdcdc; /* Seçili olduğunda farklı bir arka plan */

}
/* Mobil cihazlar için (0px - 600px) */
@media (max-width: 600px) {
    body {
        flex-direction: column;
        align-items: center;
        padding: 10px;
    }

    form {
        width: 90%; /* Form genişliğini azalt */
        padding: 15px;
    }

    input[type="text"], 
    input[type="date"],
    .asp-TextBox,
    .asp-DropDownList {
        width: 100%; /* Form elemanlarını tam genişlik yap */
        font-size: 14px;
    }

    button, .asp-Button {
        width: 100%; /* Butonları genişlet */
        padding: 12px;
        font-size: 14px;
    }

    label, .asp-Label {
        font-size: 14px;
    }
    
    h3 {
        font-size: 18px;
    }

    /* Video her zaman ekranı kaplasın ve merkezde dursun */
    #background-video {
        width: 100vw;
        height: 100vh;
        object-fit: cover;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
}

/* Tabletler için (601px - 1024px) */
@media (min-width: 601px) and (max-width: 1024px) {
    form {
        width: 80%;
    }

    input[type="text"], 
    input[type="date"], 
    .asp-TextBox, 
    .asp-DropDownList {
        width: 95%;
        font-size: 16px;
    }

    button, .asp-Button {
        width: 95%;
        padding: 12px;
        font-size: 16px;
    }

    h3 {
        font-size: 20px;
    }

    /* Video ekranı tam kaplasın ve merkezde kalsın */
    #background-video {
        width: 100vw;
        height: 100vh;
        object-fit: cover;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
}

/* Geniş ekranlar için (1025px ve üstü) */
@media (min-width: 1025px) {
    form {
        width: 60vh;
    }

    input[type="text"], 
    input[type="date"], 
    .asp-TextBox, 
    .asp-DropDownList {
        width: 90%;
        font-size: 18px;
    }

    button, .asp-Button {
        width: auto;
        padding: 14px 20px;
        font-size: 18px;
    }

    h3 {
        font-size: 22px;
    }

    /* Video ekranı tam kaplasın ve merkezde kalsın */
    #background-video {
        width: 100vw;
        height: 100vh;
        object-fit: cover;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
}

    </style>
</head>
<body>

    <!-- Arka plan videosu -->
    <video autoplay muted loop id="background-video">
        <source src="https://videos.pexels.com/video-files/30755436/13156194_640_360_60fps.mp4" type="video/mp4">
    </video>
        
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div></div>
        <h3 class="animate__animated animate__bounceInLeft animate__slow">Your Name:</h3>
        <%--<br /><br />--%>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="asp-TextBox animate__animated animate__bounceInRight animate__slower" placeholder="Your Name..."></asp:TextBox>
        <%--<br /><br />--%>
        <h3 class="animate__animated animate__bounceInLeft animate__slow">Your Country:</h3>
        <%--<br /><br />--%>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="asp-DropDownList animate__animated animate__bounceInRight animate__slower">
            <asp:ListItem>Other Country</asp:ListItem>
            <asp:ListItem>Turkey</asp:ListItem>
            <asp:ListItem>Germany</asp:ListItem>
            <asp:ListItem>Poland</asp:ListItem>
            <asp:ListItem>Greece</asp:ListItem>
            <asp:ListItem>Italy</asp:ListItem>
            <asp:ListItem>Iraq</asp:ListItem>
        </asp:DropDownList>
        <%--<br />--%>
        <h3 class="animate__animated animate__bounceInLeft animate__slow">Your Hobbies:</h3>
        <%--<br />--%>
        &nbsp;<asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="70px" Width="300px" CssClass="asp-CheckBoxList animate__animated animate__bounceInRight animate__slower">
            <asp:ListItem>chess</asp:ListItem>
            <asp:ListItem>Football</asp:ListItem>
            <asp:ListItem>Coding</asp:ListItem>
        </asp:CheckBoxList>
        <%--<br />--%>
        <h3 class="animate__animated animate__bounceInLeft animate__slow">Your Gender:</h3> <%--<br />--%>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="asp-RadioButtonList animate__animated animate__bounceInRight animate__slower">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Prefer not to say</asp:ListItem>
        </asp:RadioButtonList> <%--<br />--%>
        <h3 class="animate__animated animate__bounceInLeft animate__slow">Your Birthday:</h3>
<%--<br /><br />--%>
        <input type="date" id="Birthday" runat="server" class="asp-Calendar animate__animated animate__bounceInRight animate__slower" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <asp:Button ID="Button1" runat="server" Text="Submit" CssClass="asp-Button animate__animated animate__wobble animate__slow animate__infinite" OnClick="Button1_Click" />
        
            </ContentTemplate>
            </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <ContentTemplate>

        <asp:Label ID="Label1" runat="server" CssClass="asp-Label"></asp:Label>
             </ContentTemplate>
            </asp:UpdatePanel>
    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Sayfa yüklendikten sonra tüm inputları kontrol et
            document.querySelectorAll('input[type="text"], .asp-TextBox').forEach(function (input) {
                // Eğer input'un değeri varsa 'active' sınıfını ekle
                if (input.value.trim() !== "") {
                    input.classList.add('active');
                }

                // Focus olunca 'active' class'ını kaldır
                input.addEventListener('focus', function () {
                    this.classList.remove('active');
                });

                // Blur olunca, eğer içerik varsa 'active' class'ını ekle
                input.addEventListener('blur', function () {
                    if (this.value.trim() !== "") {
                        this.classList.add('active');
                    }
                });
            });
        });


    </script>



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // DropDownList için kontrol
            document.querySelectorAll('.asp-DropDownList').forEach(function (select) {
                // İlk başta, eğer seçilen değer "Other Country" dışında bir şeyse, 'active' sınıfını ekle
                if (select.value !== "Other Country") {
                    select.classList.add('active');
                }

                // DropDownList seçim değiştikçe kontrol et
                select.addEventListener('change', function () {
                    if (this.value !== "Other Country") {
                        this.classList.add('active');
                    } else {
                        this.classList.remove('active');
                    }
                });

                // DropDownList focus kaybolduğunda (blur) kontrol et
                select.addEventListener('blur', function () {
                    if (this.value !== "Other Country") {
                        this.classList.add('active');
                    }
                });
            });
        });


    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const dateInput = document.querySelector('input[type="date"]');
            if (dateInput) {
                if (dateInput.value) {
                    dateInput.classList.add('active');
                }

                dateInput.addEventListener('focus', function () {
                    this.classList.remove('active');
                });

                dateInput.addEventListener('blur', function () {
                    if (this.value) {
                        this.classList.add('active');
                    }
                });
            }
        });

    </script>


</body>
</html>
