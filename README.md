# High Impedance Fault Detection Using Wavelet Transform and LSTM

## Overview
This project presents an intelligent High Impedance Fault (HIF) detection system for electrical power distribution networks using Wavelet Transform and Long Short-Term Memory (LSTM) neural networks.

The system is designed to improve the safety, reliability, and protection of smart distribution systems by detecting difficult-to-identify high impedance faults through advanced signal processing and artificial intelligence techniques.

---

# Project Objectives

- Detect High Impedance Faults in power distribution systems
- Extract transient fault features using Wavelet Transform
- Classify faults using LSTM neural networks
- Improve smart grid protection and reliability
- Develop an intelligent AI-based fault detection framework

---

# Technologies Used

## Simulation & Modeling
- MATLAB
- Simulink

## Signal Processing
- Wavelet Transform (DWT)

## Artificial Intelligence
- Python
- TensorFlow / Keras
- LSTM Neural Network

## Data Processing
- NumPy
- Pandas
- Scikit-learn

---

# System Workflow

```text
Power System Simulation
        ↓
Fault Signal Acquisition
        ↓
Wavelet Feature Extraction
        ↓
Dataset Preparation
        ↓
LSTM Model Training
        ↓
Fault Classification
        ↓
Detection Results
```

---

# Project Structure

```text
HIF-Detection-Using-Wavelet-and-LSTM/
│
├── MATLAB_Model/
│   ├── HIF_Model.slx
│   ├── Wavelet_Extraction.m
│
├── LSTM_Model/
│   ├── train_lstm.py
│   ├── predict.py
│   ├── requirements.txt
│
├── Dataset/
│   ├── training_data.csv
│   ├── testing_data.csv
│
├── Results/
│   ├── accuracy_graph.png
│   ├── confusion_matrix.png
│   ├── wavelet_results.png
│
├── Images/
│   ├── system_architecture.png
│   ├── pipeline.png
│   ├── lstm_model.png
│
├── Documentation/
│   ├── Final_Report.pdf
│   ├── Presentation.pptx
│
├── Video_Demo/
│   ├── linkedin_demo.mp4
│
└── README.md
```

---

# MATLAB/Simulink Model

The power distribution system is modeled using MATLAB/Simulink to simulate:

- Three-phase distribution network
- High impedance fault conditions
- Fault current waveforms
- Signal acquisition and monitoring

---

# Wavelet Feature Extraction

Discrete Wavelet Transform (DWT) is used to extract transient and high-frequency fault characteristics from the simulated current signals.

Features extracted:
- Approximation coefficients
- Detail coefficients
- Fault transient patterns

---

# LSTM-Based Fault Classification

An LSTM neural network is developed to classify HIF and non-HIF conditions using extracted wavelet features.

### Model Features
- Sequential learning
- Temporal pattern recognition
- High classification accuracy
- Real-time applicability

---

# Results

The proposed system successfully:
- Detects High Impedance Faults
- Extracts meaningful transient features
- Classifies faults using AI techniques
- Improves smart grid protection performance

---

# Future Improvements

- Real-time hardware implementation
- Integration with IoT monitoring systems
- Deep learning optimization
- Online fault prediction
- Smart grid automation integration

---

# Team Members

| Name | Registration Number |
|------|---------------------|
| JAYARATHNA H.M.M.N. | 2022/E/051 |
| SUPUNTHAKA W.H.S.S. | 2022/E/179 |
| THENNAKOON T.M.H.R. | 2022/E/156 |

---

# Department

Department of Electrical and Electronic Engineering  
Faculty of Engineering  
University of Jaffna

---

# Repository Highlights

✅ MATLAB/Simulink Modeling  
✅ Wavelet Transform Feature Extraction  
✅ LSTM Neural Network Training  
✅ AI-Based Fault Classification  
✅ Smart Grid Protection Research  

---

# Contact

For academic or research collaboration, feel free to contact the project team.

---

# Keywords

High Impedance Fault, HIF Detection, Wavelet Transform, LSTM, MATLAB, Simulink, Artificial Intelligence, Smart Grid, Power Systems, Deep Learning
