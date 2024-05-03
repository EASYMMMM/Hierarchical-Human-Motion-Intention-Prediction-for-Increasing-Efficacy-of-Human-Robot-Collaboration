# Hierarchical Human Motion Intention Prediction for Increasing Efficacy of Human-Robot Collaboration



This repository is used to publicly share the experimental data from our work "Hierarchical Human Motion Intention Prediction for Increasing Efficacy of Human-Robot Collaboration". It includes experimental data as well as MATLAB scripts for processing the data.

## Repository Structure

The file structure of the repository:

```
Repository/
│
├── RawExperimentalData/
│   ├── ... 
│   └── subjectx_Mw.mat   # x: 1-10, w: 1-4
├── SawingDataSelect.m
├── SubjectiveMetricsAnalysis.m
├── ObjectiveMetricsAnalysis.m
└── CaseResult_S1M4.m
```

`RawExperimentalData/` includes all experimental data. There were forty .mat files in total (10 subjects, four trials each).

`SawingDataSelect.m` is used to plot a rough presentation of the experimental data for each trial. In each trial, only the “fast sawing section” was used for analysis (see our work for details).

`CaseResult_S1M4.m` is used to plot the detailed case result of subject1 in Mode4 (right part of Fig.3 in our work).

`ObjectiveMetricsAnalysis`  is used to plot the results of the objective metrics of the experiment (Fig.4 in our work).

`SubjectiveMetricsAnalysis.m` is used to plot the results of the subjective metrics of the experiment (Fig.5 in our work).

