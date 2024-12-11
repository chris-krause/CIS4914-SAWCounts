import matplotlib.pyplot as plt

def draw_vertical_slice(x, y, horz_arr, vert_arr):
    # Initialize height
    height = y
    
    # Draw horizontal lines
    for index in horz_arr:
        plt.plot([x, x+1], [height, height], color='black', linestyle='--', linewidth=2)
        if index == 1:
            plt.plot([x, x+1], [height, height], color='blue', linewidth=15)
        height -= 1
    
    # Reset height for vertical lines
    height = y
    
    # Draw vertical lines
    for index in vert_arr:
        plt.plot([x+1, x+1], [height, height-1], color='black', linestyle='--', linewidth=2)
        if index == 1:
            plt.plot([x+1, x+1], [height, height-1], color='blue', linewidth=15)
        height -= 1

# Create a plot
fig, ax = plt.subplots()

# Draw the slice
# [horizontal edges (1 if present, 0 if absent)], [vertical edges (1 if present, 0 if absent)]
draw_vertical_slice(0, 0, [1, 1, 1], [1, 1])

# Remove x and y ticks
ax.set_xticks([])
ax.set_yticks([])

# Set equal aspect ratio to prevent stretching
ax.set_aspect('equal', adjustable='box')

# Remove the plot border (spines)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['left'].set_visible(False)

# Display the plot
plt.show()