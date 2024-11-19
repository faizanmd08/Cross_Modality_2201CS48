import os
import json
import random

# Define the base directories for nodes and edges
node_dir = "binary_graph_data/node"  # Replace with your nodes folder
edge_dir = "binary_graph_data/edge"  # Replace with your edges folder
train_file = "train.json"  # Output training JSON file
valid_file = "valid.json"  # Output validation JSON file
split_ratio = 0.8  # Ratio for splitting data into train/validation

# Function to parse node files and extract features
def parse_nodes(node_file):
    node_features = []
    block_map = {}  # Map block names to indices
    with open(node_file, 'r') as f:
        for line in f:
            if line.startswith("block_"):
                parts = line.split('[')
                block_name = parts[0].strip()
                block_map[block_name] = len(block_map)
                # Create a simple binary feature vector
                features = [1 if "PUSH" in part else 0 for part in parts[1].split("\\l")]
                node_features.append(features)
    return node_features, block_map

# Function to parse edge files and extract edges
def parse_edges(edge_file, block_map):
    graph = []
    with open(edge_file, 'r') as f:
        for line in f:
            if "->" in line:
                parts = line.split()
                source = parts[0]
                target = parts[2]
                color = parts[3].split('=')[1].strip('[]color="')
                edge_type = {"red": 1, "blue": 2, "green": 3, "cyan": 4}.get(color, 0)
                if source in block_map and target in block_map:
                    graph.append([block_map[source], block_map[target], edge_type])
    return graph

# Process all files and generate the dataset
output_data = []
for node_file in os.listdir(node_dir):
    if node_file.endswith(".txt"):
        contract_name = node_file.replace(".txt", "")
        edge_file = os.path.join(edge_dir, node_file)
        node_file_path = os.path.join(node_dir, node_file)
        
        if os.path.exists(edge_file):
            # Parse node and edge files
            node_features, block_map = parse_nodes(node_file_path)
            graph = parse_edges(edge_file, block_map)
            
            # Append to the final dataset
            output_data.append({
                "targets": "0",  # Placeholder, update as needed
                "graph": graph,
                "contract_name": contract_name,
                "node_features": node_features
            })

# Shuffle the data for randomness
random.shuffle(output_data)

# Split into train and validation sets
train_size = int(len(output_data) * split_ratio)
train_data = output_data[:train_size]
valid_data = output_data[train_size:]

# Save train and validation datasets
with open(train_file, 'w') as train_json:
    json.dump(train_data, train_json, indent=4)

with open(valid_file, 'w') as valid_json:
    json.dump(valid_data, valid_json, indent=4)

print(f"Data successfully split and saved:\n- Training data: {train_file}\n- Validation data: {valid_file}")
