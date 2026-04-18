// ===================== CONTACT FORM =====================
const contactForm = document.getElementById("contactForm");

if (contactForm) {
    contactForm.addEventListener("submit", function (event) {
        event.preventDefault();

        let name = document.getElementById("name").value.trim();
        let email = document.getElementById("email").value.trim();
        let message = document.getElementById("message").value.trim();

        // Validation
        if (!name || !email || !message) {
            alert("⚠️ Please fill in all fields.");
            return;
        }

        if (!email.includes("@")) {
            alert("⚠️ Please enter a valid email.");
            return;
        }

        // Show Bootstrap modal
        const modalEl = document.getElementById("successModal");
        if (modalEl) {
            const successModal = new bootstrap.Modal(modalEl);
            successModal.show();
        }

        this.reset();
    });
}

// ===================== SMOOTH SCROLL NAV =====================
document.querySelectorAll("a.nav-link").forEach(link => {
    link.addEventListener("click", function (e) {
        e.preventDefault();

        const targetId = this.getAttribute("href");

        if (!targetId || !targetId.startsWith("#")) return;

        const targetSection = document.querySelector(targetId);

        if (targetSection) {
            const offset = 70;

            window.scrollTo({
                top: targetSection.offsetTop - offset,
                behavior: "smooth"
            });
        }
    });
});

// ===================== VIEW MORE BUTTON =====================
const viewMoreBtn = document.getElementById("viewMoreBtn");
const moreInfo = document.getElementById("moreInfo");

if (viewMoreBtn && moreInfo) {
    viewMoreBtn.addEventListener("click", function () {
        const isHidden = moreInfo.style.display === "none" || !moreInfo.style.display;

        moreInfo.style.display = isHidden ? "block" : "none";
        this.innerText = isHidden ? "Hide" : "👁 View More";
    });
}

// ===================== CARD ANIMATION ON SCROLL =====================
const cards = document.querySelectorAll(".card");

cards.forEach(card => {
    card.style.transform = "translateY(50px)";
    card.style.opacity = "0";
    card.style.transition = "0.5s ease";
});

window.addEventListener("scroll", () => {
    cards.forEach(card => {
        const rect = card.getBoundingClientRect();

        if (rect.top < window.innerHeight - 50) {
            card.style.transform = "translateY(0)";
            card.style.opacity = "1";
        }
    });
});