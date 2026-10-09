#!/usr/bin/env python3
"""Tiny popup calendar for tint2 clock click (Catppuccin Mocha)."""
import calendar
import datetime
import tkinter as tk
from tkinter import ttk

BG = "#1e1e2e"
SURFACE = "#313244"
TEXT = "#cdd6f4"
BLUE = "#89b4fa"
MUTED = "#6c7086"

class CalendarPopup:
    def __init__(self):
        self.root = tk.Tk()
        self.root.title("Calendar")
        self.root.configure(bg=BG)
        self.root.resizable(False, False)
        self.root.attributes("-topmost", True)
        try:
            self.root.attributes("-type", "dialog")
        except tk.TclError:
            pass

        today = datetime.date.today()
        self.year = today.year
        self.month = today.month
        self.today = today

        self.build()
        self.root.update_idletasks()
        self.center_top()

    def build(self):
        for w in self.root.winfo_children():
            w.destroy()

        header = tk.Frame(self.root, bg=BG)
        header.pack(fill="x", padx=10, pady=(10, 4))
        tk.Button(header, text="‹", command=self.prev_month, bg=SURFACE, fg=TEXT,
                  relief="flat", font=("JetBrainsMono Nerd Font", 12, "bold"),
                  width=3, cursor="hand2").pack(side="left")
        self.title_lbl = tk.Label(header, text="", bg=BG, fg=TEXT,
                                  font=("JetBrainsMono Nerd Font", 12, "bold"))
        self.title_lbl.pack(side="left", expand=True)
        tk.Button(header, text="›", command=self.next_month, bg=SURFACE, fg=TEXT,
                  relief="flat", font=("JetBrainsMono Nerd Font", 12, "bold"),
                  width=3, cursor="hand2").pack(side="right")

        grid = tk.Frame(self.root, bg=BG)
        grid.pack(padx=10, pady=4)
        for i, d in enumerate(["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]):
            tk.Label(grid, text=d, bg=BG, fg=BLUE, width=4,
                     font=("JetBrainsMono Nerd Font", 10, "bold")).grid(row=0, column=i, padx=1, pady=2)

        cal = calendar.Calendar(firstweekday=0)
        weeks = cal.monthdayscalendar(self.year, self.month)
        for r, week in enumerate(weeks, start=1):
            for c, day in enumerate(week):
                if day == 0:
                    tk.Label(grid, text="", bg=BG, width=4).grid(row=r, column=c, padx=1, pady=1)
                    continue
                is_today = (day == self.today.day and self.month == self.today.month
                            and self.year == self.today.year)
                tk.Label(grid, text=str(day), width=4, relief="flat",
                         bg=BLUE if is_today else SURFACE,
                         fg="#11111b" if is_today else TEXT,
                         font=("JetBrainsMono Nerd Font", 10, "bold" if is_today else "normal")).grid(row=r, column=c, padx=1, pady=1)

        tk.Button(self.root, text="Today", command=self.go_today, bg=SURFACE, fg=TEXT,
                  relief="flat", font=("JetBrainsMono Nerd Font", 9), cursor="hand2").pack(pady=(2, 10))

        self.title_lbl.configure(text=f"{calendar.month_name[self.month]} {self.year}")

    def prev_month(self):
        if self.month == 1:
            self.month, self.year = 12, self.year - 1
        else:
            self.month -= 1
        self.build()

    def next_month(self):
        if self.month == 12:
            self.month, self.year = 1, self.year + 1
        else:
            self.month += 1
        self.build()

    def go_today(self):
        self.year, self.month = self.today.year, self.today.month
        self.build()

    def center_top(self):
        self.root.update()
        w = self.root.winfo_width()
        sw = self.root.winfo_screenwidth()
        x = (sw - w) // 2
        self.root.geometry(f"+{x}+52")

    def run(self):
        self.root.bind("<Escape>", lambda e: self.root.destroy())
        self.root.bind("<FocusOut>", lambda e: self.root.after(200, self._maybe_close))
        self.root.mainloop()

    def _maybe_close(self):
        try:
            if self.root.focus_get() is None:
                # don't auto-close too aggressively; keep open
                pass
        except Exception:
            pass

if __name__ == "__main__":
    CalendarPopup().run()
