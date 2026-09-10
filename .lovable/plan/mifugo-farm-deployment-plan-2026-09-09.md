# Mifugo Farm deployment plan

## Goal
Rebuild the uploaded farm investment app here as a production-ready, responsive web app using the selected **Kijiji Estate Premium** direction. It will retain the colorful farm identity and familiar animal imagery from the references, while improving hierarchy, spacing, trust, accessibility, and desktop usability.

## Experience and visual system
- Create an immersive illustrated farm panorama and polished animal visuals matching the friendly, recognizable style in the supplied screenshots.
- Use deep natural green, field green, warm cream, harvest gold, and terracotta with Inter-style display typography and clear tabular figures.
- Build a collapsible desktop navigation rail and a compact mobile bottom navigation that never covers content.
- Adapt every screen for mobile, tablet, and desktop; desktop becomes a purposeful multi-column workspace rather than a stretched phone layout.
- Add restrained entrances, progress animation, loading feedback, confirmation states, and reduced-motion support.

## Accounts and security
- Enable Lovable Cloud for persistent data, secure accounts, and server-side payment processing.
- Build complete sign-up, sign-in, sign-out, forgot-password, reset-password, and protected-page flows.
- Keep user profiles for phone number, avatar animal, points, referral identity, preferences, and account status.
- Store administrator roles separately from profiles and enforce all access on the server.
- Apply row-level access rules so customers only see and change their own private records.

## Customer app
- **Overview:** live balances, points, unclaimed income, daily yield, active packages, progress, and recent activity.
- **Animal shop:** real package catalog with friendly animal pictures, KES price, daily income, cycle length, total return, affordability state, and confirmed purchase flow.
- **My farm:** active and completed animals, elapsed-cycle progress, daily earnings, and income collection.
- **Wallet:** real M-Pesa deposit initiation and callback confirmation, withdrawal requests, status tracking, and transaction history.
- **Referrals:** copyable personal invite link, Level 1 and Level 2 team views, and commission totals using only live account data.
- **Profile:** balances, points, avatar selection, account details, security actions, and sign out.

## Administration
- Build a protected desktop-friendly administration area for overview metrics, customers, animal packages, balance adjustments, transactions, and withdrawal review.
- Preserve package management and role controls while replacing the insecure seeded administrator credentials with a secure role-assignment process.
- Ensure financial changes are atomic, validated, auditable, and never trusted from the browser.

## Real data and M-Pesa
- Migrate the uploaded PostgreSQL model into Lovable Cloud with tables for profiles, roles, packages, investments, commissions, points, and transactions.
- Treat the animal package catalog as real product configuration; do not add fake users, balances, transactions, referrals, or dashboard metrics.
- Replace the simulated deposit confirmation with Safaricom Daraja STK Push and a verified public callback endpoint.
- Keep M-Pesa secrets server-only and record provider references, callback status, and failure reasons safely.
- Make withdrawal processing reflect real administrator-reviewed payout status; automated B2C payout can be connected if the supplied Daraja account supports it.
- Replace the always-running Node cron worker with a deployment-compatible scheduled income-accrual mechanism that prevents duplicate daily credits.

## Technical migration
- Recreate the app in the existing TanStack Start structure rather than copying the incompatible React Router/Express setup directly.
- Use typed server functions for private app operations and a secured public server route only for M-Pesa callbacks.
- Add route-specific page titles and descriptions, resilient error/empty/loading states, and accessible forms and controls.
- Generate and integrate the farm panorama and cohesive animal image set; the screenshots remain references and are not embedded as app content.

## Verification and launch
- Verify sign-up, sign-in, sign-out, password recovery, package purchase, income collection, referrals, wallet history, role restrictions, and administrator actions.
- Test the real M-Pesa flow in Daraja sandbox first, then switch to live credentials only after successful callback and reconciliation checks.
- Visually test at phone, tablet, laptop, and wide desktop sizes, including long values and empty/error states.
- Run build, runtime, security, and responsive checks, then publish the frontend when ready.

## External requirements
- Real M-Pesa requires Safaricom Daraja credentials, registered callback configuration, and the appropriate production approval. These credentials must be added securely before the live payment flow can be completed.
- A real-money investment product may require local licensing, disclosures, terms, privacy documentation, and financial/legal review before public launch; implementation does not itself provide regulatory approval.
