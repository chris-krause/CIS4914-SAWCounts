import matplotlib.pyplot as plt

def draw_vertical_slice(x, y, horz_arr, vert_arr):
    # Initialize height
    height = y
    
    # Draw horizontal lines
    for index in horz_arr:
        if index == 1:
            plt.plot([x, x+1], [height, height], color='navy', linewidth=15)
        height -= 1
    
    # Reset height for vertical lines
    height = y
    
    # Draw vertical lines
    for index in vert_arr:
        if index == 1:
            plt.plot([x+1, x+1], [height, height-1], color='navy', linewidth=15)
        height -= 1

    offset = 0.05

    # Set limits to match the desired plot coordinates
    plt.xlim(0-offset, 1+offset)
    plt.ylim(-2-offset, 0+offset)

# Create a figure with the appropriate size to match the plot's coordinate space
offset = 0.05
fig, ax = plt.subplots(figsize=(1*2*(1+2*offset), 2*(2+2*offset)))  # Width: 1 unit, Height: 2 units

# Draw the slice
draw_vertical_slice(0, 0, [1, 1, 1], [1, 0])

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

# Adjust the layout to remove any extra space around the plot
plt.subplots_adjust(left=0, right=1, top=1, bottom=0)  # This makes sure the plot fits the whole figure window

# Display the plot
plt.show()

