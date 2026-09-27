# Kenyatta National Hospital (KNH) Digital Infrastructure

## Project Overview

This project is a Shell Scripting and Git collaboration project for the Kenyatta National Hospital (KNH) Digital Infrastructure.

The system manages data generated from critical hospital sensors, including:

* Heart Rate
* Temperature
* Water Usage

The project uses Shell scripts to set up the hospital environment, secure sensitive data, analyze sensor information, and archive completed logs.

## Project Files

| File                   | Description                                                                         |
| ---------------------- | ----------------------------------------------------------------------------------- |
| `hospital_system.py`   | Python engine that generates simulated hospital sensor data                         |
| `hospital_admin.sh`    | Creates the required directories and applies permissions to protect sensitive data  |
| `hospital_analysis.sh` | Analyzes live sensor data and generates reports                                     |
| `hospital_archive.sh`  | Moves completed logs to the archive and creates new empty logs                      |
| `.gitignore`           | Prevents generated logs, reports, and temporary files from being uploaded to GitHub |
| `README.md`            | Project documentation                                                               |

## Group Members and Roles

| Member   | Role             | Responsibility                                                 |
| -------- | ---------------- | -------------------------------------------------------------- |
| Belinda  | Architect        | Developed the `initialize_system()` function                   |
| Brasen   | Security Lead    | Developed the `secure_data()` function and handled permissions |
| Yanice   | Orchestrator     | Implemented the execution logic for `hospital_admin.sh`        |
| Rurenzi  | Archivist        | Developed `hospital_archive.sh`                                |
| Dickson  | Clinical Analyst | Developed `process_vitals()` for critical alerts               |
| Aldo     | Facility Auditor | Developed `water_audit()` for water usage analysis             |

## How to Run the Project

### 1. Start the Hospital Data Engine

Run:

```bash
python3 hospital_system.py start
```

This starts generating simulated sensor data in the `active_logs` directory.

### 2. Set Up and Secure the Environment

Run:

```bash
./hospital_admin.sh
```

This creates the required directories and applies the required permissions.

### 3. Analyze the Sensor Data

Run:

```bash
./hospital_analysis.sh
```

This analyzes the live data in `active_logs` and generates the required report.

### 4. Archive the Logs

Run:

```bash
./hospital_archive.sh
```

This moves the current logs from `active_logs` to `archived_logs`, adds a timestamp to the archived files, and recreates empty log files for continued data collection.

### 5. Stop the Data Engine

When finished, run:

```bash
python3 hospital_system.py stop
```

## Directory Structure

The system uses the following directories:

```text
active_logs/
    ├── heart_rate.log
    ├── temperature.log
    └── water_usage.log

archived_logs/

reports/
```

These directories contain generated data and reports and are excluded from GitHub using `.gitignore`.

## Git Collaboration

Each group member works on their own Git branch.

Example:

```bash
git checkout -b feature-name
```

After completing the assigned work, changes are committed and pushed to GitHub. The branches are then merged into the group's `main` or `master` branch.

Each member is required to make at least three commits showing their contribution to the project.

## Data Protection

The project does not upload generated hospital logs or reports to GitHub.

The following are excluded using `.gitignore`:

```text
active_logs/
archived_logs/
reports/
/tmp/hospital_system.pid
```

This helps prevent generated or sensitive simulated medical data from being committed to the repository.

## Learning Objectives

This project demonstrates the use of:

* Shell scripting
* Functions
* `select` and `case`
* Linux file permissions using `chmod`
* File ownership using `chown`
* Text processing with `grep` and `awk`
* Log management
* Git branching and merging
* Collaborative software development
