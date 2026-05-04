<%@ Page Title="Home" Language="C#" MasterPageFile="~/MySite.Master"
    AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="SantiagoSoftDev225262V4.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
/* ═══════════════════════════════════════
   HOME PAGE
═══════════════════════════════════════ */
.home-wrap { max-width: 1060px; margin: 0 auto; }

/* Hero */
.home-hero {
    background: linear-gradient(135deg, #bae6fd 0%, #e0f2fe 50%, #fce7f3 100%);
    border: 2px solid var(--border);
    border-radius: 24px;
    padding: 52px 44px;
    margin-bottom: 32px;
    position: relative;
    overflow: hidden;
    box-shadow: var(--shadow);
    animation: fadeUp .45s cubic-bezier(.22,1,.36,1) both;
}

@keyframes fadeUp {
    from { opacity:0; transform:translateY(20px); }
    to   { opacity:1; transform:translateY(0); }
}

.home-hero::before {
    content: '🌸';
    position: absolute;
    top: 16px; right: 36px;
    font-size: 72px;
    opacity: .16;
    pointer-events: none;
}

.hero-tag {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    background: white;
    border: 2px solid var(--border);
    border-radius: 999px;
    padding: 5px 14px;
    font-size: .72rem;
    font-weight: 700;
    color: var(--sky-700);
    font-family: 'Quicksand', sans-serif;
    letter-spacing: .5px;
    text-transform: uppercase;
    margin-bottom: 16px;
}

.hero-dot {
    width: 7px; height: 7px;
    border-radius: 50%;
    background: var(--sky-400);
    animation: blink 2s ease-in-out infinite;
    display: inline-block;
}

@keyframes blink {
    0%,100% { opacity:1; transform:scale(1); }
    50%      { opacity:.4; transform:scale(.7); }
}

.home-hero h1 {
    font-family: 'Quicksand', sans-serif;
    font-size: clamp(1.7rem, 4vw, 2.5rem);
    font-weight: 700;
    color: var(--text-dark);
    line-height: 1.22;
    margin-bottom: 12px;
}

.home-hero h1 .acc {
    color: var(--sky-600);
}

.home-hero p {
    font-size: .975rem;
    color: var(--text-mid);
    max-width: 500px;
    line-height: 1.7;
    margin-bottom: 28px;
    font-weight: 500;
}

.hero-btns { display: flex; gap: 12px; flex-wrap: wrap; }

.hbtn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 13px 26px;
    border-radius: 11px;
    font-family: 'Nunito', sans-serif;
    font-size: .915rem;
    font-weight: 700;
    text-decoration: none;
    transition: all .22s;
}

.hbtn:hover { transform: translateY(-2px); text-decoration: none; }

.hbtn-primary {
    background: linear-gradient(135deg, var(--sky-400) 0%, var(--sky-600) 100%);
    color: white;
    box-shadow: 0 4px 18px rgba(56,189,248,0.38);
}

.hbtn-primary:hover { box-shadow: 0 7px 26px rgba(56,189,248,0.5); color: white; }

.hbtn-ghost {
    background: white;
    color: var(--sky-700);
    border: 2px solid var(--border);
}

.hbtn-ghost:hover { background: var(--sky-50); color: var(--sky-700); }

/* Section divider */
.sec-div {
    display: flex;
    align-items: center;
    gap: 12px;
    color: var(--text-muted);
    font-size: .7rem;
    font-weight: 700;
    letter-spacing: .8px;
    text-transform: uppercase;
    margin: 0 0 20px;
    font-family: 'Quicksand', sans-serif;
}

.sec-div::before, .sec-div::after {
    content: '';
    flex: 1;
    height: 1.5px;
    background: var(--border-s);
}

/* Stats */
.stats-row {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 16px;
    margin-bottom: 36px;
    animation: fadeUp .5s .08s cubic-bezier(.22,1,.36,1) both;
}

.stat-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 18px;
    padding: 24px 18px;
    text-align: center;
    box-shadow: var(--shadow);
    transition: transform .22s, box-shadow .22s, border-color .22s;
}

.stat-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-md);
    border-color: var(--border);
}

.stat-icon { font-size: 28px; margin-bottom: 10px; }

.stat-val {
    font-family: 'Quicksand', sans-serif;
    font-size: 2.1rem;
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

/* Feature cards */
.feat-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 20px;
    margin-bottom: 32px;
    animation: fadeUp .55s .12s cubic-bezier(.22,1,.36,1) both;
}

.feat-card {
    background: white;
    border: 2px solid var(--border-s);
    border-radius: 20px;
    padding: 26px 24px;
    box-shadow: var(--shadow);
    transition: transform .22s, box-shadow .22s, border-color .22s;
    position: relative;
    overflow: hidden;
}

.feat-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 4px;
    border-radius: 20px 20px 0 0;
}

.feat-card.sky::before  { background: linear-gradient(90deg, var(--sky-300), var(--sky-500)); }
.feat-card.rose::before { background: linear-gradient(90deg, #fb7185, #fbbf24); }
.feat-card.mint::before { background: linear-gradient(90deg, #34d399, #0ea5e9); }

.feat-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow-md);
    border-color: var(--border);
}

.feat-icon {
    width: 48px; height: 48px;
    border-radius: 13px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    margin-bottom: 15px;
    border: 2px solid var(--border-s);
}

.feat-icon.sky  { background: var(--sky-100); }
.feat-icon.rose { background: var(--blush); }
.feat-icon.mint { background: var(--mint); }

.feat-title {
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
    font-size: 1rem;
    color: var(--text-dark);
    margin-bottom: 7px;
}

.feat-desc {
    font-size: .845rem;
    color: var(--text-muted);
    line-height: 1.65;
    font-weight: 500;
    margin-bottom: 16px;
}

.feat-link {
    display: inline-flex;
    align-items: center;
    gap: 5px;
    font-size: .82rem;
    font-weight: 700;
    color: var(--sky-600);
    text-decoration: none;
    font-family: 'Quicksand', sans-serif;
    transition: gap .18s;
}

.feat-link:hover { gap: 9px; color: var(--sky-700); text-decoration: none; }

@media (max-width: 600px) {
    .home-hero { padding: 36px 20px; }
    .stats-row { grid-template-columns: 1fr; }
}
</style>

<div class="home-wrap">

    <!-- HERO -->
    <div class="home-hero">
        <div class="hero-tag"><span class="hero-dot"></span> SoftDev System v4</div>
        <h1>Manage Your <span class="acc">Academic Records</span><br>With Confidence 💙</h1>
        <p>A centralized platform for colleges, programs, and student information. Clean, secure, and always up to date.</p>
        <div class="hero-btns">
            <a href="Login.aspx" class="hbtn hbtn-primary">🔑 Sign In &rarr;</a>
            <a href="Login.aspx" class="hbtn hbtn-ghost">✨ Create Account</a>
        </div>
    </div>

    <!-- STATS -->
    <div class="sec-div">At a Glance</div>
    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-icon">🏛️</div>
            <div class="stat-val"><asp:Literal ID="litCollegeCount" runat="server">0</asp:Literal></div>
            <div class="stat-lbl">Colleges</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📚</div>
            <div class="stat-val"><asp:Literal ID="litProgramCount" runat="server">0</asp:Literal></div>
            <div class="stat-lbl">Programs</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">👩‍🎓</div>
            <div class="stat-val"><asp:Literal ID="litStudentCount" runat="server">0</asp:Literal></div>
            <div class="stat-lbl">Students</div>
        </div>
    </div>

    <!-- FEATURES -->
    <div class="sec-div">What You Can Do</div>
    <div class="feat-grid">
        <div class="feat-card sky">
            <div class="feat-icon sky">🏛️</div>
            <div class="feat-title">College Management</div>
            <div class="feat-desc">Add, update, and organize colleges. Keep your institutional structure clean and accurate.</div>
            <a href="CollegeCrud.aspx" class="feat-link">Go to Colleges →</a>
        </div>
        <div class="feat-card rose">
            <div class="feat-icon rose">📚</div>
            <div class="feat-title">Program Management</div>
            <div class="feat-desc">Manage academic programs linked to their respective colleges with full CRUD support.</div>
            <a href="ProgramCrud.aspx" class="feat-link">Go to Programs →</a>
        </div>
        <div class="feat-card mint">
            <div class="feat-icon mint">👩‍🎓</div>
            <div class="feat-title">Student Records</div>
            <div class="feat-desc">Maintain complete student profiles: ID, name, birthday, sex, program, and year level.</div>
            <a href="StudentInfoCrud.aspx" class="feat-link">Go to Students →</a>
        </div>
    </div>

</div>

</asp:Content>
