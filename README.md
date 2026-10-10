# Jeevan ( जीवन ) | Verified, Tamper-Evident Patient Health Record Platform

> **Hackathon Prototype Notice**: Synthetic data only, not medical advice.

Jeevan is a mobile-first, accessible patient health record platform designed for clinical safety, tamper-evident record keeping, emergency break-glass access, and intelligent prescription safety cross-checking.

## Project Overview

Jeevan is a prototype for managing patient health information and giving patients control over which clinicians can view it. It provides patient and doctor dashboards, a health-record timeline, condition and allergy summaries, consent controls, and an access log.

### How It Works

1. **Patients** review their health records, conditions, allergies, and clinician access from their dashboard. They can manage existing consent, review access requests, and revoke an active grant.
2. **Verified doctors** can request access by entering a registered patient's exact name and date of birth, together with a reason for care. Unverified doctors cannot request or view patient records.
3. **Patients receive an in-app notification** with the requesting clinician's name, hospital, medical council, registration number, and stated reason. The patient can approve a time-limited grant or decline the request.
4. **The doctor can view the patient's chart only after approval.** Chart access is logged so the patient can see which clinician viewed records and when.
5. **Emergency break-glass access** is a separate flow. The clinician must provide a reason, receives only the minimal emergency information, and the event is logged.
6. **Clinical safety and record integrity features** demonstrate prescription interaction checks and tamper-evident record hashes.

> **Prototype limitation:** The included patient accounts and records are synthetic. Access requests are held in browser-session memory and are lost on refresh; the app does not connect to a global patient registry or send persistent, cross-device notifications. This is a demonstration, not a production medical records system or medical advice.

---

## 🌟 Key Features

### 1. Cryptographic Tamper-Evident Ledger
- Each record is cryptographically signed with a SHA-256 block hash linked to previous block signatures.
- Provenance badges differentiate **Verified by Doctor** vs **Patient-Uploaded, Unverified** records.
- Live **Simulate Tamper** testing button allows reviewers to verify integrity checksum mismatch detection.

### 2. Clinical Prescription Safety Cross-Checking Engine
- Automated real-time checking when adding medicines against:
  1. Patient documented allergies (e.g., Penicillin, Sulfa, Aspirin).
  2. **Active AND Past / Resolved conditions** (e.g., Chronic Kidney Disease + NSAID, Asthma + Beta Blocker).
  3. Current active prescriptions (e.g., Warfarin + Aspirin, Lisinopril + Spironolactone).
  4. Interaction matrix database with plain-language reasons and scientific mechanisms.
- Exact required safety advice wording: *"Discuss alternatives with the prescriber before dispensing or administering."*
- **Unknown drug rule**: Shows *"Not checked"*, never *"No conflict"*.
- **Non-blocking workflow**: Clinicians retain final authority to proceed with a mandatory written override rationale.

### 3. Role-Based Verification & Access Control
- **Patients**: Full control over time-limited clinician consent (grant or revoke anytime), audit access log tracking, lab trend charts (HbA1c, BP, TSH, Creatinine), and emergency QR code card.
- **Doctors**: Signup requires medical council registration and hospital details. Unverified doctors are strictly locked out of patient data until approved by an administrator against the National Medical Register (NMR).
- **Admins**: Verification queue to approve/reject doctor credentials, and compliance audit trail of all Emergency Break-Glass access events.

### 4. Patient-Approved Clinician Access Requests
- Verified doctors can submit a patient's exact name and date of birth with a care purpose to request access.
- The patient can open the notification bell from any page to review pending requests and recent doctor chart views, including the clinician's name, hospital, medical council, registration number, and stated purpose.
- Records remain unavailable until the patient approves a time-limited grant; patients can decline or revoke access, and chart access requires a current grant.
- This synthetic-data prototype searches only its in-app demo accounts. Requests are held in browser-session memory and are lost on refresh; there is no worldwide patient registry, persistent cross-device notification service, or production identity verification. Real deployment requires a secured backend and appropriate patient identity/consent workflows.

### 5. Emergency Break-Glass Mode
- Search by Patient Name + Date of Birth or QR scan.
- Requires typed mandatory justification (e.g. *"Unconscious patient admitted to ER Trauma Bay"*).
- Displays **ONLY the minimal emergency set**: Allergies, Current Medicines, Active Conditions, Blood Group, Implants, Emergency Contacts.
- Prominent persistent warning: *"Emergency access is logged and the patient is notified"*.

### 6. AI Prescription Digitization (`ai-assist`)
- Calls Supabase Edge Function `ai-assist` to parse uploaded prescription images or lab PDFs.
- Extracts medicines, dosages, ICD diagnoses, and allergies with confidence ratings for user review before saving.

---

## 🛠 Tech Stack

- **Frontend Framework**: React 18 + TypeScript + Vite
- **Styling**: Tailwind CSS + Lucide React Icons
- **Routing**: React Router v6
- **Data Visualization**: Recharts
- **Backend & Auth**: Supabase (`@supabase/supabase-js`)
- **Edge AI**: Supabase Edge Function (`ai-assist`)

---

## 🚀 Running Locally

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

## 🔐 Environment Variables

Create a `.env` file in the root directory:

```env
VITE_SUPABASE_URL=https://your-supabase-project.supabase.co
VITE_SUPABASE_ANON_KEY=your-supabase-anon-key
```
