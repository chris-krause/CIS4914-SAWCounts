import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import os

class DragDropApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Drag and Drop Demo")

        # Define image paths
        self.slices = [
            "Python/images/saps_3xN/saps_3xN_A00.png",
            "Python/images/saps_3xN/saps_3xN_A01.png",
            "Python/images/saps_3xN/saps_3xN_A02.png",
            "Python/images/saps_3xN/saps_3xN_A03.png",
            "Python/images/saps_3xN/saps_3xN_A30.png",
            "Python/images/saps_3xN/saps_3xN_A31.png",
            "Python/images/saps_3xN/saps_3xN_A32.png",
            "Python/images/saps_3xN/saps_3xN_A50.png",
            "Python/images/saps_3xN/saps_3xN_A51.png",
            "Python/images/saps_3xN/saps_3xN_A52.png",
            "Python/images/saps_3xN/saps_3xN_A53.png",
            "Python/images/saps_3xN/saps_3xN_A60.png",
            "Python/images/saps_3xN/saps_3xN_A61.png",
            "Python/images/saps_3xN/saps_3xN_A62.png",
        ]

        # Load and resize images
        self.img_size = (25, 50)
        self.images = []
        for slice in self.slices:
            if os.path.exists(slice):
                try:
                    img = Image.open(slice)
                    img = img.resize(self.img_size, Image.Resampling.LANCZOS)
                    tk_img = ImageTk.PhotoImage(img)
                    self.images.append(tk_img)
                except Exception as e:
                    print(f"Error loading image {slice}: {e}")
                    self.images.append(None)
            else:
                print(f"Error: Image file '{slice}' not found.")
                self.images.append(None)

        if not any(self.images):
            print("Error: No valid images were loaded. Exiting.")
            root.quit()

        # Create canvas and scrollbar
        frame = tk.Frame(root)
        frame.pack(fill=tk.BOTH, expand=True)

        self.canvas = tk.Canvas(frame, bg="white", height=500)
        self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        self.scrollbar = ttk.Scrollbar(frame, orient="horizontal", command=self.canvas.xview)
        self.scrollbar.pack(side=tk.BOTTOM, fill=tk.X)
        self.canvas.config(xscrollcommand=self.scrollbar.set)

        self.undo_button = tk.Button(root, text="Undo", command=self.undo_last_action)
        self.undo_button.pack(side=tk.TOP, anchor=tk.W, padx=10, pady=10)

        # Calculate total width of all images including gaps
        num_images = len(self.images)
        gap = 20
        total_width = sum(self.img_size[0] for _ in range(num_images)) + gap * (num_images - 1)

        # Set starting x position to 0 (left-aligned)
        start_x = 0
        bottom_y = 450

        self.slice_items = []
        for i, img_obj in enumerate(self.images):
            if img_obj:
                x_position = start_x + i * (self.img_size[0] + gap)  # Position images left to right
                image_id = self.canvas.create_image(x_position, bottom_y, image=img_obj, anchor=tk.NW)
                self.slice_items.append(image_id)

        self.next_x = start_x
        self.y_position = 250

        self.dragged_items = []
        self.row_width = total_width
        self.window_width = 500

        self.canvas.bind("<Button-1>", self.on_click)
        self.canvas.bind("<B1-Motion>", self.on_drag)
        self.canvas.bind("<ButtonRelease-1>", self.on_release)

        self.dragging_item = None
        self.offset_x = 0
        self.offset_y = 0

        self.messages = {
        "empty": "Start by dragging a vertical slice onto the canvas!",
        "valid": "Great job! Your connections are valid.",
        "invalid": "Oops! That connection is invalid. Try again.",
        "sap": "You've created a self-avoiding polygon!"
        }
        self.current_message_id = None  # Tracks the ID of the current displayed message
        self.display_message("empty")

    def undo_last_action(self):
        # Undo the last image placed in the row
        if self.dragged_items:
            last_item = self.dragged_items.pop()  # Get the last dragged item
            self.canvas.delete(last_item)  # Remove it from the canvas
            print(f"Undo: Removed image {last_item}")
            # Recalculate the total row width
            self.row_width -= (self.img_size[0] + 20)  # Subtract the width of the removed image
            self.update_window_size()  # Update window size if needed

            # Revalidate the row
            self.validate_row()

    def update_window_size(self):
        # If the row width exceeds the current window width, update the window size
        if self.row_width > self.window_width:
            new_width = self.row_width + 50  # Add extra space for some padding
            self.root.geometry(f"{new_width}x500")  # Adjust window width (height remains the same)
            self.window_width = new_width  # Update the window width

            # Adjust the canvas width to match the window's new width
            self.canvas.config(width=new_width)
            print(f"Window size updated to: {new_width}x500")

    def on_click(self, event):
        # Check if an image at the bottom was clicked to start dragging (creating a new copy)
        for i, item in enumerate(self.slice_items):
            bbox = self.canvas.bbox(item)
            if bbox[0] <= event.x <= bbox[2] and bbox[1] <= event.y <= bbox[3]:
                # Create a new instance of the image at the click location
                new_item = self.canvas.create_image(event.x, event.y, image=self.images[i], anchor=tk.NW)
                self.dragging_item = new_item
                # Calculate offset to make the dragging smooth (based on where the click occurred)
                self.offset_x = event.x - bbox[0]
                self.offset_y = event.y - bbox[1]
                print(f"Created new item {new_item} at ({event.x}, {event.y})")
                break

    def on_drag(self, event):
        if self.dragging_item:
            # Move the image based on mouse position and offset
            new_x = event.x - self.offset_x
            new_y = event.y - self.offset_y
            self.canvas.coords(self.dragging_item, new_x, new_y)
    
    def display_message(self, key):
        # Map message keys to colors
        colors = {
            "valid": "green",
            "invalid": "red",
            "sap": "blue"
        }
        
        # Get the message and corresponding color
        message = self.messages.get(key, "Unknown message!")
        color = colors.get(key, "black")  # Default to black if key is unrecognized

        # Remove the current message if it exists
        if self.current_message_id:
            self.canvas.delete(self.current_message_id)

        # Display the new message in the specified color at fixed coordinates
        self.current_message_id = self.canvas.create_text(
            300, 50,  # Fixed position (x=250, y=50)
            text=message,
            fill=color,
            font=("Helvetica", 16, "bold")
        )

    
    def validate_row(self):

        image_objects = [self.canvas.itemcget(item, 'image') for item in self.dragged_items]

        if len(image_objects) == 0:
            self.display_message("empty")
            return

        slices_0 = ['pyimage1', 'pyimage2', 'pyimage3', 'pyimage4']
        slices_3 = ['pyimage5', 'pyimage6', 'pyimage7']
        slices_3_valid = ['pyimage2', 'pyimage5', 'pyimage10']
        slices_5 = ['pyimage8', 'pyimage9', 'pyimage10', 'pyimage11']
        slices_5_valid = ['pyimage4', 'pyimage7', 'pyimage8', 'pyimage13']
        slices_6 = ['pyimage12', 'pyimage13', 'pyimage14']
        slices_6_valid = ['pyimage3', 'pyimage9', 'pyimage12']
        end_slices = ['pyimage6', 'pyimage11', 'pyimage14']

        # Check for invalid connections
        if image_objects[0] not in slices_0:
            self.display_message("invalid")
            return

        for i in range(1, len(image_objects)):
            if image_objects[i] in slices_0 and image_objects[i - 1] != 'pyimage1':
                self.display_message("invalid")
                return
            elif image_objects[i] in slices_3 and image_objects[i - 1] not in slices_3_valid:
                self.display_message("invalid")
                return
            elif image_objects[i] in slices_5 and image_objects[i - 1] not in slices_5_valid:
                self.display_message("invalid")
                return
            elif image_objects[i] in slices_6 and image_objects[i - 1] not in slices_6_valid:
                self.display_message("invalid")
                return

        # If all checks pass
        if image_objects[-1] in end_slices:
            self.display_message("sap")
            return

        self.display_message("valid")


    def on_release(self, event):
        if self.dragging_item:
            # Snap the item to the next position in the row without a gap
            new_x = self.next_x
            new_y = self.y_position
            self.canvas.coords(self.dragging_item, new_x, new_y)
            print(f"Item {self.dragging_item} snapped to ({new_x}, {new_y})")

            # Update dragged items list and the total width of the row
            self.dragged_items.append(self.dragging_item)
            print(self.dragged_items)
            self.row_width += self.img_size[0]  # Remove the gap (no 20px)
            
            # Validate the row and display the appropriate message
            self.validate_row()

            # Set the starting x position to 0 (left-aligned)
            start_x = 20  # Removed centering logic
            self.next_x = start_x + self.img_size[0]  # Update next_x for the next dragged item

            # Shift the positions of all dragged items to keep them left-aligned
            for i, item in enumerate(self.dragged_items):
                self.canvas.coords(item, start_x + i * self.img_size[0], self.y_position)  # No gap between images

            # Update the window size if needed
            self.update_window_size()

            # Reset dragging item
            self.dragging_item = None



if __name__ == "__main__":
    root = tk.Tk()
    app = DragDropApp(root)
    root.mainloop()
