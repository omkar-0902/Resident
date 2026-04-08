# Design System Strategy: Eco-Tech Editorial

## 1. Overview & Creative North Star
The Creative North Star for this design system is **"The Digital Forest."** 

This system moves away from the sterile, "boxy" nature of traditional utility apps and instead embraces a high-end editorial aesthetic. By blending the organic depth of a dense forest with the sharp, high-tech precision of a smart city, we create a "Premium Eco-Tech" experience. 

To break the "template" look, we utilize **intentional asymmetry** and **tonal layering**. Elements are not just placed on a grid; they are curated. We use extreme typographic scales—massive, condensed headlines contrasted against tiny, precise labels—to create a sense of digital craftsmanship. The interface should feel like a living HUD (Heads-Up Display) for the modern, environmentally-conscious resident.

---

## 2. Colors & Surface Philosophy
The palette is rooted in `surface_container_low` (#0D1F1A) to provide a deep, immersive environment. The `primary` neon green is not just a color; it is a light source.

### The "No-Line" Rule
**Explicit Instruction:** Designers are prohibited from using 1px solid borders to section content. Traditional "dividers" are a sign of lazy architecture. Boundaries must be defined solely through:
- **Background Color Shifts:** Placing a `surface_container` card on a `surface` background.
- **Tonal Transitions:** Using the `surface_container_highest` (#263833) to naturally lift a high-priority proximity card.

### Surface Hierarchy & Nesting
Treat the UI as a series of physical layers. Use the Material tiers to define "importance" through depth:
- **Level 0 (Base):** `surface` (#051612) – The dark void.
- **Level 1 (Sections):** `surface_container_low` (#0D1F1A) – Broad content areas.
- **Level 2 (Cards):** `surface_container` (#11231E) – Standard information units.
- **Level 3 (Pop-outs):** `surface_container_highest` (#263833) – Active proximity alerts or critical updates.

### The "Glass & Glow" Rule
To achieve the "Smart City" feel, use **Glassmorphism** for floating action buttons or sticky headers. 
- **Effect:** 40% opacity of `surface_bright` with a 20px backdrop blur.
- **Signature Glow:** For active states (like a truck in close proximity), apply a `primary_container` (#00E676) outer glow with a 15% opacity spread to mimic a neon emission.

---

## 3. Typography
The typography strategy relies on the tension between the aggressive `Space Grotesk` (Display/Headline) and the functional `Inter` (Body/Labels).

*   **Display (Space Grotesk):** Use `display-lg` for proximity distances (e.g., "200M") to create an editorial impact.
*   **Headlines (Space Grotesk):** `headline-sm` should be used for section titles, set in All-Caps with +5% letter spacing to evoke a "technical manual" feel.
*   **Body (Inter):** Use `body-md` for status updates. The high x-height of Inter ensures legibility against the dark `surface`.
*   **Labels (Inter):** `label-sm` is your tool for metadata. Use `on_surface_variant` (#BACBB9) to keep these secondary.

---

## 4. Elevation & Depth

### The Layering Principle
Forget shadows for standard cards. Achieve "lift" by stacking `surface_container_lowest` objects on top of `surface_container_high` backgrounds. This creates a sophisticated, "soft" tactile feel.

### Ambient Shadows
Where floating elements (like a navigation bar) require true separation:
- **Shadow Color:** Use a tinted shadow based on `surface_container_lowest` (#02110D) at 40% opacity.
- **Blur:** Large values (30px-50px) with 0 offset to create an "ambient occlusion" effect rather than a directional drop shadow.

### The "Ghost Border" Fallback
If contrast is legally required for accessibility, use a **Ghost Border**:
- **Token:** `outline_variant` (#3B4A3D).
- **Opacity:** 15% Max. It should be felt, not seen.

---

## 5. Components

### Proximity Status Cards (The Hero Component)
- **Background:** `surface_container` (#11231E).
- **Corner Radius:** `xl` (1.5rem / 24px) for a consumer-friendly feel.
- **Interaction:** On hover/active, the card should transition to a `primary` (#75FF9E) "Ghost Border" and a subtle glow.
- **Spacing:** No dividers. Use `spacing-6` (2rem) between cards to let the "Deep Forest" background breathe.

### Buttons
- **Primary:** `primary_container` (#00E676) background with `on_primary` (#003918) text. Use `full` (9999px) roundedness for high-action items like "Request Pickup."
- **Secondary:** Transparent background with a `primary` (#75FF9E) Ghost Border (20% opacity).

### Live Update Lists
- **Structure:** Forbid 1px dividers. Use a `spacing-3` vertical gap.
- **Visual Cues:** Use a `primary` dot (4px) next to live updates to indicate "active" status.

### Input Fields
- **Surface:** `surface_container_lowest`.
- **Active State:** Instead of a border, use a 2px `primary` underline or a subtle `surface_bright` background shift.

---

## 6. Do's and Don'ts

### Do
- **DO** use asymmetry. Large typography on the left, small metadata on the right.
- **DO** lean into the "Deep Forest" palette. Use `secondary_container` for low-priority backgrounds to maintain the monochromatic green depth.
- **DO** use `spacing-16` or `spacing-20` for major section breathing room. Premium design is defined by what you leave out.

### Don't
- **DON'T** use pure black (#000000). It kills the "Eco-Tech" depth. Always use `surface_dim` or `surface_container_lowest`.
- **DON'T** use standard 1px lines. They make the app look like a spreadsheet.
- **DON'T** use maps. Represent proximity through large, bold typography and "Live Pulse" animations using the `primary` accent.
- **DON'T** use 90-degree corners. Everything must be `md` (0.75rem) or higher to maintain the "Consumer-Focused" softness.