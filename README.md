
graph TD
    A[Developer Commit] --> B[Push to Feature Branch]
    B --> C[Open Pull Request / Merge to Develop]
    C --> D[CI Pipeline Triggered]
    D --> E[Run Linting / Code Quality Checks]
    E --> F[Run Security Scan]
    F --> G[Build Application / Create Artifact]
    G --> H[Store Artifact in Repository]
    H --> I{Manual Approval?}
    I -->|Yes| J[Notify Reviewer / Wait for Approval]
    I -->|No| K[Deploy to Staging]
    J --> K
    K --> L[Deploy to Production ]

    subgraph Branch Protection
        C
    end

    subgraph Quality Gate
        E --> F
    end

    style A fill:#e3f2fd,stroke:#2196f3,stroke-width:2px
    style L fill:#dcedc8,stroke:#7cb342,stroke-width:2px
    style I fill:#fff9c4,stroke:#fbc02d,stroke-width:2px
