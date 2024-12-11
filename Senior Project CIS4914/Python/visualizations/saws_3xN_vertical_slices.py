import matplotlib.pyplot as plt
import itertools

def generate_binary_arrays(n):
    # Create all binary combinations of length n
    binary_arrays = list(itertools.product([0, 1], repeat=n))
    return binary_arrays

def draw_vertical_slice(x, y, horz_arr, vert_arr):

    height = y
    for index in horz_arr:
        if index == 1:
            plt.plot([x, x+1], [height, height], color='blue', linewidth=2)
        height -= 1
    
    height = y
    for index in vert_arr:
        if index == 1:
            plt.plot([x+1, x+1], [height, height-1], color='blue', linewidth=2)
        height -= 1
    
    n = len(vert_arr)
    plt.plot([x-0.5, x+1.5, x+1.5, x-0.5, x-0.5], [y+0.5, y+0.5, y-n-0.5, y-n-0.5, y+0.5], color='black', linewidth=1)  

def draw_slices(n, invalid_slices):

    plt.figure(figsize=(5, 5))

    plt.xlim(-1, 2**(n-1)*2)
    plt.ylim(1, -2**(n)*3)

    plt.xticks([])
    plt.yticks([])

    plt.gca().set_aspect(1)
    plt.gca().invert_yaxis()

    plt.gca().spines['top'].set_visible(False)
    plt.gca().spines['right'].set_visible(False)
    plt.gca().spines['left'].set_visible(False)
    plt.gca().spines['bottom'].set_visible(False)

    vert_mat = generate_binary_arrays(n-1)
    horz_mat = generate_binary_arrays(n)

    x, y = 0, 0

    for horz_arr in horz_mat:
        x = 0
        for vert_arr in vert_mat:
            draw_vertical_slice(2*x, n*y, horz_arr, vert_arr)
            if (x, -y) in invalid_slices:
                plt.fill([2*x-0.5, 2*x+1.5, 2*x+1.5, 2*x-0.5], [n*y+0.5, n*y+0.5, n*y-n+0.5, n*y-n+0.5], color='red', alpha=0.3)
            x += 1
        y -= 1
    
    plt.title('Self-Avoiding Walks 3 X n')
    plt.suptitle('Valid Vertical Slices', fontsize=12, y=0.97)

    plt.show()

invalid_slices = [(3,2), (3,3), (3,6), (3,7)]

draw_slices(3, invalid_slices)

plt.figure(figsize=(5, 5))
plt.xticks([])
plt.yticks([])

plt.gca().set_aspect(1)
plt.gca().invert_yaxis()