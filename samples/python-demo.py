# ═════════════════════════════════════════════════════════════
# 🐍 Python Integration in LUO OMNI
# Full Python 3.x support in the browser
# ═════════════════════════════════════════════════════════════

# ─── Basic Output ───
print("🐍 Python is running inside LUO!")
print("=" * 40)

# ─── Variables ───
name = "LUO User"
version = "1.0.0"
pi = 3.14159

print(f"Name: {name}")
print(f"Version: {version}")
print(f"Pi: {pi}")

# ─── Data Structures ───
users = [
    {"name": "Alice", "age": 30, "city": "NYC"},
    {"name": "Bob", "age": 25, "city": "LA"},
    {"name": "Charlie", "age": 35, "city": "Chicago"}
]

print("\n📋 User List:")
for user in users:
    print(f"  - {user['name']}, {user['age']} years old, {user['city']}")

# ─── Dictionary Operations ───
data = {
    "python": "awesome",
    "luo": "revolutionary",
    "javascript": "versatile"
}

print("\n🔑 Dictionary:")
for key, value in data.items():
    print(f"  {key} = {value}")

# ─── Functions ───
def calculate_stats(numbers):
    return {
        "sum": sum(numbers),
        "average": sum(numbers) / len(numbers),
        "min": min(numbers),
        "max": max(numbers)
    }

numbers = [10, 20, 30, 40, 50]
stats = calculate_stats(numbers)

print(f"\n📊 Statistics for {numbers}:")
print(f"  Sum: {stats['sum']}")
print(f"  Average: {stats['average']}")
print(f"  Min: {stats['min']}")
print(f"  Max: {stats['max']}")

# ─── Classes ───
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email
    
    def greet(self):
        return f"Hello, I'm {self.name}!"
    
    def __str__(self):
        return f"User({self.name}, {self.email})"

print("\n👤 User Class:")
user1 = User("John", "john@luo.dev")
user2 = User("Jane", "jane@luo.dev")
print(f"  {user1}")
print(f"  {user1.greet()}")
print(f"  {user2.greet()}")

# ─── Math & Random ───
import math
import random

print("\n🎲 Math & Random:")
print(f"  sqrt(16) = {math.sqrt(16)}")
print(f"  sin(0) = {math.sin(0)}")
print(f"  random.randint(1,100) = {random.randint(1, 100)}")
print(f"  random.choice(['red', 'green', 'blue']) = {random.choice(['red', 'green', 'blue'])}")

# ─── JSON ───
import json

config = {
    "app": "LUO OMNI",
    "version": "1.0.0",
    "features": ["python", "javascript", "sql", "bash", "ai"],
    "settings": {
        "theme": "dark",
        "font": "JetBrains Mono"
    }
}

print("\n📦 JSON:")
print(f"  {json.dumps(config, indent=2)}")

# ─── List Comprehensions ───
squares = [x**2 for x in range(1, 11)]
print(f"\n🔢 Squares [1..10]: {squares}")

evens = [x for x in range(20) if x % 2 == 0]
print(f"🔢 Even numbers [0..19]: {evens}")

# ─── String Operations ───
text = "LUO OMNI is amazing!"
print(f"\n📝 String: '{text}'")
print(f"  Upper: {text.upper()}")
print(f"  Lower: {text.lower()}")
print(f"  Words: {text.split()}")
print(f"  Length: {len(text)}")

print("\n✅ Python execution complete!")
