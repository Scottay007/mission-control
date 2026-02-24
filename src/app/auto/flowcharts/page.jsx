'use client';
import { useState } from 'react';

const F = [
  {
    name: "Check Engine",
    steps: [
      {
        question: "Steady or flashing?",
        options: [
          { label: "Steady", next: 1 },
          { label: "Flashing", next: 1 }
        ]
      },
      {
        question: "Scan codes",
        conclusion: "Free scan at auto parts stores. Flashing = misfire, reduce speed."
      }
    ]
  },
  {
    name: "Won't Start",
    steps: [
      {
        question: "What happens?",
        options: [
          { label: "Nothing", next: 1 },
          { label: "Clicking", next: 1 },
          { label: "Cranks", next: 1 }
        ]
      },
      {
        question: "Check battery",
        conclusion: "Nothing: dead battery. Clicking: weak battery/bad starter. Cranks: check fuel pump, spark, crank sensor."
      }
    ]
  },
  {
    name: "Overheating",
    steps: [
      {
        question: "Pull over. Heater on full.",
        conclusion: "Wait 30 min. Check coolant WHEN COOL. Look for leaks. Never drive in red zone."
      }
    ]
  }
];

export default function AutoFlow() {
  const [af, setAf] = useState(0);
  const [st, setSt] = useState(0);
  const fl = F[af];
  const s = fl?.steps?.[st];

  const activeClass = 'px-3 py-1.5 rounded-full text-xs font-medium text-white';
  const inactiveClass = 'px-3 py-1.5 rounded-full text-xs font-medium bg-surface text-text-muted border border-border';

  return (
    <div className="min-h-screen bg-background">
      <header className="border-b border-border px-4 py-3">
        <div className="max-w-4xl mx-auto flex items-center gap-3">
          <a href="/auto" className="text-text-muted hover:text-text-primary text-sm">
            ← Auto
          </a>
          <span className="text-border">|</span>
          <h1 className="font-bold" style={{ color: '#8B5CF6' }}>
            🔀 Diagnostic Flowcharts
          </h1>
        </div>
      </header>
      <div className="max-w-4xl mx-auto px-4 py-8">
        <h2 className="text-2xl font-bold mb-2">Diagnostic Flowcharts</h2>
        <p className="text-text-muted text-sm mb-6">Step-by-step car diagnosis.</p>
        <div className="flex flex-wrap gap-2 mb-8">
          {F.map((f, i) => (
            <button
              key={i}
              onClick={() => { setAf(i); setSt(0); }}
              className={af === i ? activeClass : inactiveClass}
              style={af === i ? { backgroundColor: '#8B5CF6' } : {}}
            >
              {f.name}
            </button>
          ))}
        </div>
        {s && (
          <div className="mc-card p-6">
            <div className="text-text-dim text-xs mb-2">Step {st + 1}</div>
            <h3 className="text-xl font-bold mb-4">{s.question}</h3>
            <div className="space-y-2">
              {s.options?.map((o, j) => (
                <button
                  key={j}
                  onClick={() => setSt(o.next)}
                  className="mc-card-hover p-3 w-full text-left text-sm"
                >
                  {o.label}
                </button>
              ))}
            </div>
            {s.conclusion && (
              <div className="mt-4 p-4 rounded-mc border-2" style={{ borderColor: '#8B5CF640' }}>
                <p className="font-bold mb-1" style={{ color: '#8B5CF6' }}>Diagnosis:</p>
                <p className="text-text-secondary text-sm whitespace-pre-line">{s.conclusion}</p>
              </div>
            )}
            {st > 0 && (
              <button onClick={() => setSt(0)} className="mt-4 text-sm text-text-muted">
                ↩ Start Over
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}