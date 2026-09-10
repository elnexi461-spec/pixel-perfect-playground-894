import { createFileRoute, redirect } from "@tanstack/react-router";

// No head() here: the home route inherits title/description/og/twitter from
// __root.tsx, and ships no og:image so serve-time hosting can inject the
// project's social preview (explicit og:image or latest screenshot).
export const Route = createFileRoute("/")({
  beforeLoad: () => { throw redirect({ to: "/auth" }); },
  head: () => ({ meta: [{ title: "Mifugo Farm Estate" }, { name: "description", content: "Manage your farm estate, animal packages and M-Pesa wallet." }, { property: "og:title", content: "Mifugo Farm Estate" }, { property: "og:description", content: "A premium digital farm estate experience." }, { property: "og:type", content: "website" }, { name: "twitter:card", content: "summary_large_image" }] }),
  component: Index,
});

// IMPORTANT: Replace this placeholder. See ./README.md for routing conventions.
function Index() {
  return null;
}
