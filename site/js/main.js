let typedSequence = "";

window.addEventListener("keydown", (e) => {
  typedSequence += e.key.toLowerCase();

  const triggers = ["67", "6-7", "sixseven"];

  if (triggers.some((trigger) => typedSequence.includes(trigger))) {
    document.body.classList.add("signal-instability");

    setTimeout(() => {
      document.body.classList.remove("signal-instability");
    }, 450);

    typedSequence = "";

    triggerSignalWarning();
  }

  setTimeout(() => {
    typedSequence = "";
  }, 1200);
});

function triggerSignalWarning() {
  const warning = document.createElement("div");

  warning.textContent = "SIXXXXX SEVENNNNNN";

  warning.style.position = "fixed";
  warning.style.bottom = "20px";
  warning.style.right = "20px";
  warning.style.padding = "10px 14px";
  warning.style.background = "#111";
  warning.style.color = "#fff";
  warning.style.fontFamily = "JetBrains Mono, monospace";
  warning.style.fontSize = "12px";
  warning.style.letterSpacing = "0.08em";
  warning.style.zIndex = "99999";
  warning.style.opacity = "0";

  warning.style.transition = "opacity 0.2s ease";

  document.body.appendChild(warning);

  requestAnimationFrame(() => {
    warning.style.opacity = "1";
  });

  setTimeout(() => {
    warning.style.opacity = "0";

    setTimeout(() => {
      warning.remove();
    }, 200);
  }, 1200);
}

// Mobile nav toggle
document.addEventListener("DOMContentLoaded", () => {
  // Search toggle
  const searchBtn = document.querySelector(".search-btn");
  if (searchBtn) {
    searchBtn.addEventListener("click", () => {
      const existing = document.querySelector(".search-overlay");
      if (existing) {
        existing.remove();
        return;
      }

      const overlay = document.createElement("div");
      overlay.className = "search-overlay";
      overlay.style.cssText = `
        position: fixed; top: 42px; left: 0; right: 0; z-index: 999;
        background: #000; padding: 16px 20px;
        display: flex; align-items: center; gap: 12px;
        border-bottom: 2px solid #e8202e;
      `;
      overlay.innerHTML = `
        <input type="text" placeholder="Search systems, projects..." autofocus style="
          flex: 1; background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.3);
          color: #fff; padding: 10px 14px; font-family: 'Barlow',sans-serif; font-size: 15px; outline: none;
        ">
        <button onclick="this.closest('.search-overlay').remove()" style="
          background: none; border: none; color: #fff; font-size: 22px; cursor: pointer; line-height:1;
        ">×</button>
      `;
      document.body.appendChild(overlay);
      overlay.querySelector("input").focus();

      document.addEventListener("keydown", function esc(e) {
        if (e.key === "Escape") {
          overlay.remove();
          document.removeEventListener("keydown", esc);
        }
      });
    });
  }

  // Lazy image error fallback
  document.querySelectorAll("img").forEach((img) => {
    img.addEventListener("error", () => {
      img.style.background = "#e8e8e8";
      img.style.opacity = "0";
    });
  });

  // Smooth entrance animation
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = "1";
          entry.target.style.transform = "translateY(0)";
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.1 },
  );

  document
    .querySelectorAll(
      ".story-card, .themed-card, .feed-item, .musk-secondary-card",
    )
    .forEach((el) => {
      el.style.opacity = "0";
      el.style.transform = "translateY(16px)";
      el.style.transition = "opacity 0.4s ease, transform 0.4s ease";
      observer.observe(el);
    });

  // Newsletter form handling
  document.querySelectorAll("form").forEach((form) => {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const input = form.querySelector('input[type="email"]');
      const btn = form.querySelector("button");
      if (input && input.value.includes("@")) {
        const orig = btn.textContent;
        btn.textContent = "✓ Subscribed!";
        btn.style.background = "#28a745";
        input.value = "";
        setTimeout(() => {
          btn.textContent = orig;
          btn.style.background = "";
        }, 3000);
      } else if (input) {
        input.style.borderColor = "#e8202e";
        setTimeout(() => {
          input.style.borderColor = "";
        }, 1500);
      }
    });
  });

  // Mobile dropdown tap support
  document.querySelectorAll(".nav-item.dropdown > a").forEach((a) => {
    a.addEventListener("click", (e) => {
      if (window.innerWidth < 768) {
        e.preventDefault();
        const menu = a.nextElementSibling;
        if (menu) {
          const isOpen = menu.style.display === "block";
          document
            .querySelectorAll(".dropdown-menu")
            .forEach((m) => (m.style.display = ""));
          menu.style.display = isOpen ? "" : "block";
        }
      }
    });
  });
});

// ============================================================
// FOOTER CONFETTI — paste at bottom of main.js, after all
// existing code. Completely isolated. No nesting required.
// ============================================================
(function () {
  // ── CONFIGURATION ─────────────────────────────────────────
  var CFG = {
    COUNT: 190, // number of particles
    DURATION_MS: 3000, // total lifetime of animation
    GRAVITY: 0.03, // lower = floatier. try 0.02–0.06
    VY_MIN: -6.0, // max upward launch speed
    VY_MAX: -2.5, // min upward launch speed
    VX_SPREAD: 8.5, // horizontal spread
    FADE_SPEED: 0.005, // life deducted per frame. 0.004=slow, 0.008=fast
    DRAG: 0.987, // air resistance. 0.98=more drag, 0.995=less
    COLORS: [
      // monochrome ink palette
      "#f2f228",
      "#ea2d0c",
      "#08f17d",
      "#ff05d9",
      "#f30505",
      "#0bf0e8",
      "#6e0cf7",
    ],
    SHAPES: ["rect", "rect", "rect", "line", "tri", "dot"],
  };
  // ──────────────────────────────────────────────────────────

  if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

  function init() {
    var footer = document.querySelector("#contact");
    if (!footer) {
      console.warn("Confetti: no element with id='contact' found.");
      return;
    }

    // canvas
    var canvas = document.createElement("canvas");
    canvas.setAttribute("aria-hidden", "true");
    canvas.style.cssText = [
      "position:fixed",
      "top:0",
      "left:0",
      "width:100vw",
      "height:100vh",
      "pointer-events:none",
      "z-index:999999",
    ].join(";");
    document.body.appendChild(canvas);

    var ctx = canvas.getContext("2d");

    function resize() {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    }
    resize();
    window.addEventListener("resize", resize);

    // ── particle factory ──────────────────────────────────
    function makeParticle() {
      var shape = CFG.SHAPES[Math.floor(Math.random() * CFG.SHAPES.length)];
      return {
        x: window.innerWidth * (0.3 + Math.random() * 0.4),
        y: window.innerHeight * 0.92,
        vx: (Math.random() - 0.5) * CFG.VX_SPREAD * (0.6 + Math.random()),
        vy: CFG.VY_MIN + Math.random() * (CFG.VY_MAX - CFG.VY_MIN),
        life: 0.6 + Math.random() * 0.4,
        color: CFG.COLORS[Math.floor(Math.random() * CFG.COLORS.length)],
        shape: shape,
        w: shape === "line" ? 8 + Math.random() * 10 : 4 + Math.random() * 7,
        h: 3 + Math.random() * 4,
        rot: Math.random() * Math.PI * 2,
        rotSpeed: (Math.random() - 0.5) * 0.07,
        delay: Math.random() * 600, // stagger launch up to 600 ms
        born: performance.now(),
      };
    }

    // ── draw one particle ─────────────────────────────────
    function drawParticle(p) {
      ctx.save();
      ctx.globalAlpha = Math.max(0, p.life);
      ctx.fillStyle = p.color;
      ctx.strokeStyle = p.color;
      ctx.lineWidth = 0.8;
      ctx.translate(p.x, p.y);
      ctx.rotate(p.rot);

      ctx.beginPath();
      if (p.shape === "rect") {
        ctx.fillRect(-p.w / 2, -p.h / 2, p.w, p.h);
      } else if (p.shape === "line") {
        ctx.moveTo(-p.w / 2, 0);
        ctx.lineTo(p.w / 2, 0);
        ctx.stroke();
      } else if (p.shape === "tri") {
        var s = p.w * 0.5;
        ctx.moveTo(0, -s);
        ctx.lineTo(s * 0.87, s * 0.5);
        ctx.lineTo(-s * 0.87, s * 0.5);
        ctx.closePath();
        ctx.stroke();
      } else if (p.shape === "dot") {
        ctx.arc(0, 0, p.h * 0.6, 0, Math.PI * 2);
        ctx.fill();
      }

      ctx.restore();
    }

    // ── animation loop ────────────────────────────────────
    var particles = [];
    var animStart = null;
    var rafId = null;
    var triggered = false;

    function spawnAll() {
      particles = [];
      for (var i = 0; i < CFG.COUNT; i++) {
        particles.push(makeParticle());
      }
    }

    function tick(now) {
      if (!animStart) animStart = now;
      var elapsed = now - animStart;

      ctx.clearRect(0, 0, canvas.width, canvas.height);

      var alive = 0;
      for (var i = 0; i < particles.length; i++) {
        var p = particles[i];

        // staggered launch: skip physics until delay passed
        if (now - p.born < p.delay) {
          alive++;
          continue;
        }

        // physics
        p.vy += CFG.GRAVITY;
        p.vx *= CFG.DRAG;
        p.vy *= CFG.DRAG;
        p.x += p.vx;
        p.y += p.vy;
        p.rot += p.rotSpeed;

        // fade out — accelerate fade in last third of duration
        var remaining = CFG.DURATION_MS - elapsed;
        var fadeRate =
          remaining < CFG.DURATION_MS * 0.33
            ? CFG.FADE_SPEED * 2.5
            : CFG.FADE_SPEED;
        p.life -= fadeRate;

        if (p.life > 0) {
          drawParticle(p);
          alive++;
        }
      }

      if (alive > 0 && elapsed < CFG.DURATION_MS + 800) {
        rafId = requestAnimationFrame(tick);
      } else {
        // clean up
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        canvas.remove();
        window.removeEventListener("resize", resize);
        rafId = null;
      }
    }

    function burst() {
      if (triggered) return;
      triggered = true;
      spawnAll();
      animStart = null;
      rafId = requestAnimationFrame(tick);
    }

    // ── IntersectionObserver trigger ──────────────────────
    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            burst();
            observer.disconnect();
          }
        });
      },
      { threshold: 0.1 },
    );

    observer.observe(footer);
  }

  // safe DOM-ready guard — works whether pasted before or after DOMContentLoaded fires
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
