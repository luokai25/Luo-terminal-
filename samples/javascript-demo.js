// ═════════════════════════════════════════════════════════════
// 🟨 JavaScript Integration in LUO OMNI
// Full JS execution in browser
// ═════════════════════════════════════════════════════════════

// ─── Basic Output ───
console.log("🟨 JavaScript is running inside LUO!");
console.log("=".repeat(40));

// ─── Variables ───
const name = "LUO User";
let version = "1.0.0";
var pi = 3.14159;

console.log(`Name: ${name}`);
console.log(`Version: ${version}`);
console.log(`Pi: ${pi}`);

// ─── Objects ───
const user = {
    name: "John Doe",
    email: "john@luo.dev",
    age: 30,
    skills: ["LUO", "Python", "JavaScript", "SQL"],
    address: {
        city: "New York",
        country: "USA"
    },
    greet() {
        return `Hello, I'm ${this.name}!`;
    }
};

console.log("\n📋 User Object:");
console.log(`  Name: ${user.name}`);
console.log(`  Email: ${user.email}`);
console.log(`  Skills: ${user.skills.join(", ")}`);
console.log(`  City: ${user.address.city}`);
console.log(`  ${user.greet()}`);

// ─── Arrays ───
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

console.log("\n🔢 Array Operations:");
console.log(`  Original: ${numbers}`);
console.log(`  Filtered (>5): ${numbers.filter(n => n > 5)}`);
console.log(`  Mapped (*2): ${numbers.map(n => n * 2)}`);
console.log(`  Reduced (sum): ${numbers.reduce((a, b) => a + b, 0)}`);
console.log(`  Find (first >7): ${numbers.find(n => n > 7)}`);
console.log(`  Some (>10): ${numbers.some(n => n > 10)}`);
console.log(`  Every (<20): ${numbers.every(n => n < 20)}`);

// ─── Arrow Functions ───
const add = (a, b) => a + b;
const multiply = (a, b) => a * b;
const greet = name => `Hello, ${name}!`;

console.log("\n⚡ Arrow Functions:");
console.log(`  add(5, 3) = ${add(5, 3)}`);
console.log(`  multiply(4, 7) = ${multiply(4, 7)}`);
console.log(`  greet("World") = ${greet("World")}`);

// ─── Classes ───
class Animal {
    constructor(name, sound) {
        this.name = name;
        this.sound = sound;
    }
    
    speak() {
        return `${this.name} says: ${this.sound}!`;
    }
}

class Dog extends Animal {
    constructor(name, breed) {
        super(name, "Woof");
        this.breed = breed;
    }
    
    fetch() {
        return `${this.name} fetches the ball!`;
    }
}

console.log("\n🐕 Class Inheritance:");
const dog = new Dog("Buddy", "Golden Retriever");
console.log(`  ${dog.speak()}`);
console.log(`  ${dog.fetch()}`);

// ─── Async/Await ───
const fetchData = () => {
    return new Promise(resolve => {
        setTimeout(() => {
            resolve({ data: "Sample data", status: "success" });
        }, 100);
    });
};

console.log("\n⏱️ Async/Promise:");
fetchData().then(result => {
    console.log(`  Fetch result: ${JSON.stringify(result)}`);
});

// ─── Destructuring ───
const [first, second, ...rest] = [1, 2, 3, 4, 5];
console.log("\n📦 Destructuring:");
console.log(`  First: ${first}, Second: ${second}, Rest: ${rest}`);

const { name: userName, email } = user;
console.log(`  Destructured: ${userName}, ${email}`);

// ─── Template Literals ───
const template = `
🎉 Template Literals
────────────────────
User: ${user.name}
Email: ${user.email}
Skills: ${user.skills.join(" | ")}
Date: ${new Date().toLocaleDateString()}
`;
console.log(template);

// ─── Map & Set ───
const userMap = new Map();
userMap.set("john", { name: "John", age: 30 });
userMap.set("jane", { name: "Jane", age: 25 });

console.log("🗺️ Map Operations:");
console.log(`  Has 'john': ${userMap.has("john")}`);
console.log(`  Get 'jane': ${JSON.stringify(userMap.get("jane"))}`);

const uniqueNumbers = new Set([1, 2, 2, 3, 3, 3, 4]);
console.log(`  Set (unique): ${[...uniqueNumbers]}`);

// ─── Spread Operator ───
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const combined = [...arr1, ...arr2];
console.log("\n🔀 Spread:");
console.log(`  Combined: ${combined}`);

const obj1 = { a: 1, b: 2 };
const obj2 = { b: 3, c: 4 };
const merged = { ...obj1, ...obj2 };
console.log(`  Merged: ${JSON.stringify(merged)}`);

console.log("\n✅ JavaScript execution complete!");
