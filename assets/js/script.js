$(
  (function () {
    // Navigation
    $(".site-navigation").affix({
      offset: {
        top: $(".hero").height(),
      },
    });

    var $window = $(window);
    function checkWidth() {
      var windowsize = $window.width();
      if (windowsize < 768) {
        $(".nav a").on("click", function () {
          $(".navbar-toggle").click();
        });
      }
    }
    checkWidth();
    $(window).resize(checkWidth);

    $("body").scrollspy({
      target: ".site-header",
      offset: 10,
    });

    if ($(".counter-start").length > 0) {
      $(".counter-start").each(function () {
        var stat_item = $(this),
          offset = stat_item.offset().top;
        $(window).scroll(function () {
          if (
            $(window).scrollTop() > offset - 1000 &&
            !stat_item.hasClass("counting")
          ) {
            stat_item.addClass("counting");
            stat_item.countTo();
          }
        });
      });
    }

    $("#services-carousel").carousel({ interval: false });

    if ($(".carousel-inner").length) {
      $(".carousel-inner").swipe({
        swipeLeft: function (
          event,
          direction,
          distance,
          duration,
          fingerCount
        ) {
          $(this).parent().carousel("next");
        },
        swipeRight: function () {
          $(this).parent().carousel("prev");
        },
        threshold: 50,
      });
    }

    // Slick.js
    $(".review-carousel").slick({
      nextArrow:
        '<button class="slick rectangle slick-next"><i class="fa fa-angle-right" aria-hidden="true"></button>',
      prevArrow:
        '<button class="slick rectangle slick-prev"><i class="fa fa-angle-left" aria-hidden="true"></button>',
    });

    $(".clients-carousel").slick({
      arrows: false,
      slidesToShow: 5,
      responsive: [
        {
          breakpoint: 992,
          settings: {
            slidesToShow: 2,
          },
        },
        {
          breakpoint: 480,
          settings: {
            slidesToShow: 1,
          },
        },
      ],
    });

    var shuffleme = (function ($) {
      "use strict";
      var $grid = $("#grid"),
        $filterOptions = $(".portfolio-sorting li"),
        init = function () {
          setTimeout(function () {
            listen();
            setupFilters();
          }, 100);

          $grid.shuffle({
            itemSelector: '[class*="col-"]',
            group: Shuffle.ALL_ITEMS,
          });
        },
        setupFilters = function () {
          var $btns = $filterOptions.children();
          $btns.on("click", function (e) {
            e.preventDefault();
            var $this = $(this),
              isActive = $this.hasClass("active"),
              group = isActive ? "all" : $this.data("group");

            if (!isActive) {
              $(".portfolio-sorting li a").removeClass("active");
            }

            $this.toggleClass("active");

            $grid.shuffle("shuffle", group);
          });

          $btns = null;
        },
        listen = function () {
          var debouncedLayout = $.throttle(300, function () {
            $grid.shuffle("update");
          });

          $grid.find("img").each(function () {
            var proxyImage;

            if (this.complete && this.naturalWidth !== undefined) {
              return;
            }

            proxyImage = new Image();
            $(proxyImage).on("load", function () {
              $(this).off("load");
              debouncedLayout();
            });

            proxyImage.src = this.src;
          });

          setTimeout(function () {
            debouncedLayout();
          }, 500);
        };

      return {
        init: init,
      };
    })(jQuery);

    if ($("#grid").length > 0) {
      shuffleme.init();
    }
  })()
);

function showMenu(menuId) {
  var menus = document.querySelectorAll(".menu-menu");
  menus.forEach(function (menu) {
    menu.classList.remove("active");
  });

  var selectedMenu = document.getElementById(menuId);
  if (selectedMenu) {
    selectedMenu.classList.add("active");
  }
}

fetch("api.php")
  .then((response) => response.json())
  .then((data) => {
    console.log(data);
    const user = data.biodata[0];

    // Pertama
    document.title = `${user.nickname} Personal`;
    document.querySelector(".hero-job-desc").textContent = user.short_desc;
    document.querySelector(".hero-job").textContent = user.nickname;
    document.querySelector("h1").textContent = user.nama;
    document.querySelector(".page-scroll.site-logo a").textContent =
      user.nickname;

    // Intro
    document.querySelector(".section-subtitle span").textContent = user.nama;
    document.querySelector(
      ".col-md-6:nth-child(1) ul li:nth-child(1)"
    ).textContent = `Name: ${user.nama}`;
    document.querySelector(
      ".col-md-6:nth-child(1) ul li:nth-child(2)"
    ).textContent = `Tempat, Tanggal Lahir: ${user.tempat_lahir}, ${user.tanggal_lahir}`;
    document.querySelector(
      ".col-md-6:nth-child(2) ul li:nth-child(1)"
    ).textContent = user.keyakinan;
    document.querySelector(
      ".col-md-6:nth-child(2) ul li:nth-child(2)"
    ).textContent = `Alamat: ${user.alamat}`;
    document.querySelector(".row.mt-3 p").textContent = user.deskripsi;

    const socialMediaData = data.media_sosial;
    const socialMediaElements = document.querySelectorAll(".medium-rectangle");

    socialMediaData.forEach((socialMedia, index) => {
      const platform = socialMedia.platform;
      const username = socialMedia.username;

      let iconClass = "";
      if (platform === "Instagram") {
        iconClass = "fa-instagram";
      } else if (platform === "Telegram") {
        iconClass = "fa-telegram";
      } else if (platform === "WhatsApp") {
        iconClass = "fa-whatsapp";
      }

      const socialMediaElement = socialMediaElements[index];
      socialMediaElement.querySelector("i").classList.add(iconClass);
      socialMediaElement.nextElementSibling.textContent = platform;
      socialMediaElement.nextElementSibling.nextElementSibling.textContent =
        username;
    });

    const blogData = data.blog;
    const blogContainer = document.querySelector(".blog-container");

    blogData.forEach((blog) => {
      const title = blog.judul;
      const content = blog.isi;
      const publicationDate = blog.tanggal_publikasi;

      const blogElement = document.createElement("div");
      blogElement.className = "col-md-6";
      blogElement.innerHTML = `
    <div class="feature-about">
      <h3>${title}</h3>
      <p>${content}</p>
      <p><strong>Published on:</strong> ${publicationDate}</p>
    </div>
  `;

      blogContainer.appendChild(blogElement);
    });

    const experiences = data.pengalaman;
    const timelineElement = document.querySelector(".timeline");

    experiences.forEach((experience, index) => {
      const li = document.createElement("li");

      const deskripsiFormatted = experience.deskripsi_pekerjaan
        .split("•")
        .filter((item) => item.trim() !== "")
        .map((item) => item.trim())
        .join("<br>");

      if (index % 2 === 0) {
        li.innerHTML = `
          <div class="rectangle timeline-rectangle"></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <div class="timeline-date">
                <p>${experience.tahun_mulai}</p>
              </div>
              <div class="timeline-position">
                <p>${experience.posisi}</p>
              </div> |
              <div class="timeline-position">
                <p>${experience.nama_pt}</p>
              </div>
            </div>
            <div class="timeline-body">
              <div class="timeline-body-thumb">
                <img src="assets/img/timeline-img.jpg" class="img-res" alt="" />
              </div>
              <p>${deskripsiFormatted}</p>
            </div>
          </div>
        `;
      } else {
        li.className = "timeline-inverted";
        li.innerHTML = `
          <div class="rectangle timeline-rectangle"></div>
          <div class="timeline-panel">
            <div class="timeline-heading">
              <div class="timeline-position">
                <p>${experience.posisi}</p>
              </div>|
              <div class="timeline-position">
                <p>${experience.nama_pt}</p>
              </div>
              <div class="timeline-date">
                <p>${experience.tahun_mulai}</p>
              </div>
            </div>
            <div class="timeline-body">
              <div class="timeline-body-thumb">
                <img src="assets/img/timeline-img.jpg" class="img-res" alt="" />
              </div>
              <p>${deskripsiFormatted}</p>
            </div>
          </div>
        `;
      }

      timelineElement.appendChild(li);
    });
  })
  .catch((error) => {
    console.error("Terjadi kesalahan:", error);
  });
