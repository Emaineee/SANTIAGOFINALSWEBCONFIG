<%@ Page Title="Home | SoftDev Management System" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="SantiagoSoftDev225262V4.Landingpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ═══════════════════════════════════════════════════════
   LANDING PAGE  —  Feminine Light Blue Theme
═══════════════════════════════════════════════════════ */

.landing-wrap { max-width: 1080px; margin: 0 auto; }

/* ── HERO ── */
.hero {
    position: relative;
    background: linear-gradient(135deg, #bae6fd 0%, #e0f2fe 45%, #fce7f3 100%);
    border: 2px solid var(--border);
    border-radius: 28px;
    padding: 60px 48px 56px;
    margin-bottom: 36px;
    overflow: hidden;
    box-shadow: 0 8px 40px rgba(56,189,248,0.12);
}

/* Decorative blobs */
.hero::before {
    content: '🌸';
    position: absolute;
    top: 20px; right: 40px;
    font-size: 80px;
    opacity: .18;
    pointer-events: none;
}

.hero::after {
    content: '💙';
    position: absolute;
    bottom: 20px; left: 30px;
    font-size: 60px;
    opacity: .14;
    pointer-events: none;
}

.hero-tag {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    background: white;
    border: 2px solid var(--border);
    border-radius: 999px;
    padding: 6px 16px;
    font-size: .73rem;
    font-weight: 700;
    color: var(--sky-700);
    font-family: 'Quicksand', sans-serif;
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 18px;
    box-shadow: 0 2px 8px rgba(56,189,248,0.15);
}

.hero-tag .dot {
    width: 7px; height: 7px;
    border-radius: 50%;
    background: var(--sky-400);
    animation: blink 2s ease-in-out infinite;
}

@keyframes blink {
    0%,100% { opacity:1; transform:scale(1); }
    50%      { opacity:.4; transform:scale(.7); }
}

.hero h1 {
    font-family: 'Quicksand', sans-serif;
    font-size: clamp(1.8rem, 4vw, 2.8rem);
    font-weight: 700;
    color: var(--text-dark);
    line-height: 1.22;
    margin-bottom: 14px;
}

.hero h1 .accent {
    color: var(--sky-600);
    position: relative;
}

.hero h1 .accent::after {
    content: '';
    position: absolute;
    bottom: -2px; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, var(--sky-400), var(--blush-d));
    border-radius: 3px;
}

.hero p {
    font-size: 1rem;
    color: var(--text-mid);
    max-width: 540px;
    line-height: 1.72;
    margin-bottom: 32px;
    font-weight: 500;
}

.hero-btns {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
}

.hero-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px;
    border-radius: 12px;
    font-family: 'Nunito', sans-serif;
    font-size: .935rem;
    font-weight: 700;
    text-decoration: none;
    transition: all .22s ease;
    letter-spacing: .1px;
}

.hero-btn:hover { transform: translateY(-3px); text-decoration: none; }

.hero-btn-primary {
    background: linear-gradient(135deg, var(--sky-400) 0%, var(--sky-600) 100%);
    color: white;
    box-shadow: 0 4px 20px rgba(56,189,248,0.38);
}

.hero-btn-primary:hover {
    box-shadow: 0 8px 28px rgba(56,189,248,0.52);
    color: white;
}

.hero-btn-outline {
    background: white;
    color: var(--sky-700);
    border: 2px solid var(--border);
    box-shadow: 0 2px 10px rgba(56,189,248,0.1);
}

.hero-btn-outline:hover { background: var(--sky-50); color: var(--sky-700); }

/* ── ABOUT / STUDENT CARD ── */
.about-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 24px;
    padding: 32px 36px;
    margin-bottom: 32px;
    box-shadow: var(--shadow);
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 32px;
    align-items: start;
}

.about-left {}

.about-label {
    font-family: 'Quicksand', sans-serif;
    font-size: .68rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    color: var(--sky-400);
    margin-bottom: 10px;
}

.student-name {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.45rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 6px;
}

.student-meta {
    font-size: .85rem;
    color: var(--text-muted);
    font-weight: 500;
    line-height: 1.7;
}

.student-meta strong {
    color: var(--text-mid);
    font-weight: 700;
}

/* Portfolio info table */
.portfolio-table {
    width: 100%;
    border-collapse: collapse;
    font-size: .83rem;
    background: var(--sky-50);
    border-radius: 14px;
    overflow: hidden;
    border: 2px solid var(--border);
}

.portfolio-table th {
    background: var(--sky-100);
    color: var(--text-dark);
    padding: 10px 14px;
    text-align: left;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .72rem;
    letter-spacing: .4px;
    border-bottom: 1.5px solid var(--border);
}

.portfolio-table td {
    padding: 10px 14px;
    border-bottom: 1px solid var(--border-s);
    color: var(--text-body);
    font-weight: 500;
}

.portfolio-table tr:last-child td { border-bottom: none; }

/* Instructor badge */
.instructor-badge {
    display: flex;
    align-items: center;
    gap: 12px;
    background: linear-gradient(135deg, var(--blush) 0%, var(--sky-100) 100%);
    border: 2px solid var(--border);
    border-radius: 14px;
    padding: 16px 18px;
    margin-bottom: 32px;
    box-shadow: var(--shadow);
}

.instructor-avatar {
    width: 48px; height: 48px;
    background: linear-gradient(135deg, var(--sky-300) 0%, var(--blush-d) 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    flex-shrink: 0;
    border: 3px solid white;
    box-shadow: 0 2px 10px rgba(56,189,248,0.2);
}

.instructor-info {}

.instructor-label {
    font-size: .68rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: .8px;
    color: var(--sky-500);
    font-family: 'Quicksand', sans-serif;
    margin-bottom: 3px;
}

.instructor-name {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.05rem;
    font-weight: 700;
    color: var(--text-dark);
}

.instructor-creds {
    font-size: .78rem;
    color: var(--text-muted);
    font-weight: 500;
}

@media (max-width: 640px) {
    .about-card { grid-template-columns: 1fr; gap: 20px; }
}

/* ── SECTION HEADING ── */
.sec-head {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 4px;
}

.sec-sub {
    font-size: .845rem;
    color: var(--text-muted);
    margin-bottom: 22px;
    font-weight: 500;
}

/* ── STAT CARDS ── */
.stats-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 18px;
    margin-bottom: 36px;
}

.stat-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 18px;
    padding: 24px 20px;
    text-align: center;
    box-shadow: var(--shadow);
    transition: transform .22s, box-shadow .22s;
    cursor: default;
}

.stat-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-md);
}

.stat-icon { font-size: 28px; margin-bottom: 10px; }

.stat-val {
    font-family: 'Quicksand', sans-serif;
    font-size: 2rem;
    font-weight: 700;
    color: var(--sky-600);
    line-height: 1;
    margin-bottom: 6px;
}

.stat-lbl {
    font-size: .72rem;
    font-weight: 700;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: .6px;
    font-family: 'Quicksand', sans-serif;
}

/* ── MODULE CARDS ── */
.modules-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 22px;
    margin-bottom: 36px;
}

.module-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 20px;
    padding: 28px 24px;
    box-shadow: var(--shadow);
    position: relative;
    overflow: hidden;
    transition: transform .22s, box-shadow .22s;
    display: flex;
    flex-direction: column;
}

.module-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 5px;
    border-radius: 20px 20px 0 0;
}

.module-card.sky::before   { background: linear-gradient(90deg, var(--sky-400), var(--sky-300)); }
.module-card.rose::before  { background: linear-gradient(90deg, #fb7185, #fbbf24); }
.module-card.mint::before  { background: linear-gradient(90deg, #34d399, #0ea5e9); }

.module-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow-md);
}

.module-icon {
    width: 52px; height: 52px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    margin-bottom: 16px;
}

.module-icon.sky  { background: var(--sky-100); }
.module-icon.rose { background: var(--blush); }
.module-icon.mint { background: var(--mint); }

.module-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1.05rem;
    color: var(--text-dark);
    margin-bottom: 8px;
}

.module-desc {
    font-size: .845rem;
    color: var(--text-muted);
    line-height: 1.65;
    flex: 1;
    margin-bottom: 20px;
    font-weight: 500;
}

.module-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-size: .83rem;
    font-weight: 700;
    color: var(--sky-600);
    text-decoration: none;
    font-family: 'Quicksand', sans-serif;
    transition: gap .18s, color .18s;
}

.module-link:hover { gap: 10px; color: var(--sky-700); text-decoration: none; }

/* ── FEATURES ── */
.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 16px;
    margin-bottom: 36px;
}

.feature-item {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 14px;
    padding: 18px 16px;
    display: flex;
    align-items: flex-start;
    gap: 13px;
    box-shadow: var(--shadow);
    transition: transform .2s;
}

.feature-item:hover { transform: translateY(-2px); }

.feature-dot {
    width: 36px; height: 36px;
    border-radius: 10px;
    background: var(--sky-100);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 16px;
    flex-shrink: 0;
    border: 2px solid var(--border);
}

.feature-title {
    font-weight: 700;
    font-size: .875rem;
    color: var(--text-dark);
    margin-bottom: 4px;
    font-family: 'Quicksand', sans-serif;
}

.feature-desc {
    font-size: .795rem;
    color: var(--text-muted);
    line-height: 1.55;
    font-weight: 500;
}

/* ── REQUIREMENTS TABLE ── */
.req-table {
    width: 100%;
    border-collapse: collapse;
    font-size: .845rem;
    margin-bottom: 36px;
}

.req-table th {
    background: var(--sky-100);
    color: var(--text-dark);
    padding: 12px 16px;
    text-align: left;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: .75rem;
    letter-spacing: .4px;
    border-bottom: 2px solid var(--border);
}

.req-table td {
    padding: 11px 16px;
    border-bottom: 1px solid var(--border-s);
    font-weight: 500;
    color: var(--text-body);
    vertical-align: top;
}

.req-table tr:hover td { background: var(--sky-50); }
.req-table tr:last-child td { border-bottom: none; }

.req-num {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 24px; height: 24px;
    background: var(--sky-400);
    color: white;
    border-radius: 50%;
    font-size: .72rem;
    font-weight: 700;
    flex-shrink: 0;
    font-family: 'Quicksand', sans-serif;
}

/* ── CTA BANNER ── */
.cta-banner {
    background: linear-gradient(135deg, var(--sky-100) 0%, var(--blush) 100%);
    border: 2px solid var(--border);
    border-radius: 22px;
    padding: 36px 40px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 20px;
    flex-wrap: wrap;
    margin-bottom: 24px;
    box-shadow: var(--shadow);
}

.cta-banner h3 {
    font-family: 'Quicksand', sans-serif;
    font-size: 1.2rem;
    font-weight: 700;
    color: var(--text-dark);
    margin-bottom: 5px;
}

.cta-banner p {
    font-size: .845rem;
    color: var(--text-muted);
    font-weight: 500;
}

.cta-actions { display: flex; gap: 12px; flex-wrap: wrap; }

.cta-btn {
    padding: 11px 22px;
    border-radius: 10px;
    font-size: .875rem;
    font-weight: 700;
    text-decoration: none;
    font-family: 'Nunito', sans-serif;
    transition: all .2s;
}

.cta-btn:hover { transform: translateY(-2px); text-decoration: none; }

.cta-btn-primary {
    background: linear-gradient(135deg, var(--sky-400), var(--sky-600));
    color: white;
    box-shadow: 0 4px 16px rgba(56,189,248,0.35);
}

.cta-btn-ghost {
    background: white;
    color: var(--sky-700);
    border: 2px solid var(--border);
}

/* Responsive */
@media (max-width: 680px) {
    .hero { padding: 38px 22px; }
    .stats-row { grid-template-columns: 1fr; }
    .cta-banner { padding: 26px 22px; }
}
</style>

<div class="landing-wrap">

    <%-- ══ HERO ══ --%>
    <div class="hero">
        <div class="hero-tag"><span class="dot"></span> Academic Information System</div>
        <h1>
            Manage Your Institution<br />
            with <span class="accent">SoftDev MS</span> ✨
        </h1>
        <p>
            A centralized platform for managing Students, Academic Programs, and Colleges —
            built for efficiency, clarity, and ease of use. Designed with care by Ulrica Loraine Santiago. 💙
        </p>
        <div class="hero-btns">
            <a href="Login.aspx" class="hero-btn hero-btn-primary">🔑 Login to Dashboard</a>
            <a href="Login.aspx" class="hero-btn hero-btn-outline">✨ Create Account</a>
        </div>
    </div>

    <%-- ══ INSTRUCTOR + STUDENT INFO ══ --%>
    <div class="instructor-badge">
        <div class="instructor-avatar">👩‍🏫</div>
        <div class="instructor-info">
            <div class="instructor-label">Course Instructor</div>
            <div class="instructor-name">Jerome Refran</div>
            <div class="instructor-creds">CPE, MIt, DIt (Cand.) &nbsp;·&nbsp; Software Development 2</div>
        </div>
    </div>

    <div class="about-card">
        <div class="about-left">
            <div class="about-label">👩‍🎓 Student Developer</div>
            <div class="student-name">Ulrica Loraine Santiago</div>
            <div class="student-meta">
                <strong>Course:</strong> BS Computer Engineering<br />
                <strong>Year Level:</strong> 3rd Year &nbsp;|&nbsp; <strong>Section:</strong> BsCpe<br />
                <strong>Semester:</strong> 2nd Semester, S.Y. 2025–2026<br />
                <strong>Subject:</strong> Elective 2 – Software Development 2
            </div>
        </div>
        <div class="about-right">
            <div class="about-label">📋 Portfolio Requirements</div>
            <table class="portfolio-table">
                <thead>
                    <tr><th>#</th><th>Requirement</th><th>Status</th></tr>
                </thead>
                <tbody>
                    <tr><td>1</td><td>Landing Page (Public)</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>2</td><td>Login &amp; Sign-up Page</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>3</td><td>Secured Web App (After Login)</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>4</td><td>CRUD Functionality</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>5</td><td>Validation &amp; Error Handling</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>6</td><td>Security / Session Auth</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>7</td><td>Logout Functionality</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                    <tr><td>8</td><td>Responsive UI/CSS</td><td><span style="color:var(--emerald);font-weight:700;">✔ Done</span></td></tr>
                </tbody>
            </table>
        </div>
    </div>

    <%-- ══ STATS ══ --%>
    <div class="sec-head">System Overview</div>
    <div class="sec-sub">A quick look at what's inside the system.</div>

    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-icon">🏛️</div>
            <div class="stat-val">—</div>
            <div class="stat-lbl">Colleges</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📚</div>
            <div class="stat-val">—</div>
            <div class="stat-lbl">Programs</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">👩‍🎓</div>
            <div class="stat-val">—</div>
            <div class="stat-lbl">Students</div>
        </div>
    </div>

    <%-- ══ MODULES ══ --%>
    <div class="sec-head">System Modules 🌸</div>
    <div class="sec-sub">Access all management tools from a single, unified platform.</div>

    <div class="modules-grid">
        <div class="module-card sky">
            <div class="module-icon sky">👩‍🎓</div>
            <div class="module-title">Student Information</div>
            <div class="module-desc">Manage student profiles, academic records, and personal details with full CRUD support.</div>
            <a href="StudentInfoCrud.aspx" class="module-link">Open Module →</a>
        </div>
        <div class="module-card rose">
            <div class="module-icon rose">📚</div>
            <div class="module-title">Program Management</div>
            <div class="module-desc">Create, update, and organize academic programs linked to colleges in your institution.</div>
            <a href="ProgramCrud.aspx" class="module-link">Open Module →</a>
        </div>
        <div class="module-card mint">
            <div class="module-icon mint">🏛️</div>
            <div class="module-title">College Management</div>
            <div class="module-desc">Maintain college records, codes, and hierarchical structures for your institution.</div>
            <a href="CollegeCrud.aspx" class="module-link">Open Module →</a>
        </div>
    </div>

    <%-- ══ FEATURES ══ --%>
    <div class="sec-head">Why SoftDev MS? 💙</div>
    <div class="sec-sub">Built to meet modern academic administration standards.</div>

    <div class="features-grid">
        <div class="feature-item">
            <div class="feature-dot">🔒</div>
            <div>
                <div class="feature-title">Secure Access</div>
                <div class="feature-desc">Session-based auth with automatic logout on inactivity.</div>
            </div>
        </div>
        <div class="feature-item">
            <div class="feature-dot">📦</div>
            <div>
                <div class="feature-title">Full CRUD</div>
                <div class="feature-desc">Create, Read, Update, Delete with proper validation.</div>
            </div>
        </div>
        <div class="feature-item">
            <div class="feature-dot">📱</div>
            <div>
                <div class="feature-title">Responsive</div>
                <div class="feature-desc">Works on desktop, tablet, and mobile seamlessly.</div>
            </div>
        </div>
        <div class="feature-item">
            <div class="feature-dot">📬</div>
            <div>
                <div class="feature-title">OTP Verification</div>
                <div class="feature-desc">Email-based OTP for registration and password recovery.</div>
            </div>
        </div>
    </div>

    <%-- ══ CTA ══ --%>
    <div class="cta-banner">
        <div>
            <h3>Ready to get started? 🌸</h3>
            <p>Log in to access your dashboard, or create an account to join the system.</p>
        </div>
        <div class="cta-actions">
            <a href="Login.aspx" class="cta-btn cta-btn-primary">🔑 Login Now</a>
            <a href="Login.aspx" class="cta-btn cta-btn-ghost">✨ Register</a>
        </div>
    </div>

</div>

</asp:Content>
