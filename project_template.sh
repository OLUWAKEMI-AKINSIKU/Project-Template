#!/bin/bash
# Display a menu
echo "Select an option:"
echo "1. Enter project name"
echo "2. Exit"
read -p "Enter your choice: " choice

# Handle choices with if-elif-else
if [ "$choice" = "1" ]; then
    # Prompt for project name
    read -p "Enter the project name (no spaces or special characters except - or _): " project_name

    # Validate project name
    if [[ "$project_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
        # Create project folder structure
        mkdir -p "$project_name"/{data/raw,data/versions,notebooks,models,metrics,deployments,logs,bash-scripts,src,reports}

        # Create necessary files
        touch "$project_name"/{.gitignore,README.md,requirements.txt,.env,params.yml}
        touch "$project_name"/notebooks/"$project_name".ipynb  # Create the notebook file

        # Add directories to .gitignore
        echo -e ".env\nbash-scripts/\ndata/" > "$project_name"/.gitignore

        # Create empty Python files in src directory
        touch "$project_name"/src/{__init__.py,eval.py,deploy.py,feature.py,train.py,cleaning.py,split.py,processor.py}

        echo "Project '$project_name' created successfully with the following structure:"
    else
        echo "Invalid project name. Only letters, numbers, hyphens (-), and underscores (_) are allowed."
    fi
elif [ "$choice" = "2" ]; then
    echo "Exiting the script."
    exit 0
else
    echo "Invalid selection."
fi

chmod +x project_template.sh



