import os
import pandas as pd
import shutil

def organize_bytecode(csv_path, bytecode_folder, output_folder):
    """
    Organizes bytecode files into specific folders based on vulnerabilities listed in an Excel file.
    
    Args:
    csv_path (str): Path to the Excel file with filenames and vulnerability flags.
    bytecode_folder (str): Folder containing bytecode files for each Solidity (.sol) file.
    output_folder (str): Destination folder to store organized bytecode files.
    """
    # Load the Excel file
    data = pd.read_excel(csv_path)
    
    # Create the main output folder if it doesn't exist
    os.makedirs(output_folder, exist_ok=True)
    
    # Define the subfolders for each vulnerability type
    folders = {
        'Reentrancy': 'reentrance',
        'Timestamp_Dependence': 'timestamp',
        'Integer_Overflow_Underflow': 'overflow'
    }
    
    # Create subfolders for each vulnerability type
    for folder_name in folders.values():
        os.makedirs(os.path.join(output_folder, folder_name), exist_ok=True)
    
    # Iterate through each row in the Excel file
    for index, row in data.iterrows():
        # Get the filename from the Excel file and remove the .sol extension if present
        filename = row['filename'].replace('.sol', '')
        bytecode_path = os.path.join(bytecode_folder, f"{filename}.bin")  # Assuming bytecodes are stored as .txt files
        
        # Check if the bytecode file exists
        if os.path.isfile(bytecode_path):
            # Check each vulnerability type and copy the bytecode file to the appropriate folder
            for col, folder in folders.items():
                if row[col] == 1:  # Check if vulnerability is present
                    target_path = os.path.join(output_folder, folder, f"{filename}.txt")
                    
                    # Copy the bytecode file to the target folder
                    shutil.copy(bytecode_path, target_path)
        else:
            print(f"Bytecode file for {filename} not found in {bytecode_folder}.")

    print("Bytecode organized successfully!")

if __name__ == "__main__":
    # Define paths for the Excel file and bytecode folder
    csv_file_path = "inp.xlsx"           # Path to your Excel file
    bytecode_folder_path = "bytecode"  # Path to your bytecode folder
    output_folder_path = "bytecode_labelled"      # Desired result folder path
    
    # Ensure the result directory exists
    os.makedirs(output_folder_path, exist_ok=True)
    
    # Call the function to organize bytecode
    organize_bytecode(csv_file_path, bytecode_folder_path, output_folder_path)
