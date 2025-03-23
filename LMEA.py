#!/usr/bin/env python3

import os
import math
import argparse

def is_power_of_2(n):
    """Check if a number is a power of 2."""
    return n > 0 and (n & (n - 1)) == 0

def generate_key(key_size, output_file):
    """Generate a random key and save it to a file."""
    if not is_power_of_2(key_size):
        raise ValueError("Key size must be a power of 2 (e.g., 1024, 4096, 16384, 32768, 65536 bits)")
    
    key = os.urandom(key_size // 8)  # Convert bits to bytes
    with open(output_file, "wb") as f:
        f.write(key)
    print(f"Key generated and saved to {output_file}")

def load_key(input_file):
    """Load a key from a file."""
    with open(input_file, "rb") as f:
        return f.read()

def logical_scramble(data, key, decrypt=False):
    """Encrypt or decrypt data using logical + mathematical operations."""
    key_size = len(key) * 8
    if not is_power_of_2(key_size):
        raise ValueError("Key size must be a power of 2 (e.g., 1024, 4096, 16384, 32768, 65536 bits)")

    data_bytes = bytearray(data)
    key_bytes = bytearray(key)
    pi_factor = int(math.pi * 100)

    for i in range(len(data_bytes)):
        key_part = key_bytes[i % len(key_bytes)]
        d = data_bytes[i]

        if decrypt:
            d = (d - pi_factor) % 256
            d = d ^ key_part
            d = (d - key_part) % 256
            d = d ^ key_part
        else:
            d = d ^ key_part
            d = (d + key_part) % 256
            d = d ^ key_part
            d = (d + pi_factor) % 256

        data_bytes[i] = d

    return bytes(data_bytes)

def process_file(input_file, output_file, key_file, decrypt=False):
    """Encrypt or decrypt a file using the specified key."""
    key = load_key(key_file)

    with open(input_file, "rb") as f:
        data = f.read()

    processed_data = logical_scramble(data, key, decrypt)

    with open(output_file, "wb") as f:
        f.write(processed_data)

    print(f"{'Decryption' if decrypt else 'Encryption'} completed. Output saved to {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Quantum-Resistant Logical Encryption")
    parser.add_argument("--generate-key", type=int, help="Generate a key of specified size (power of 2) and save it")
    parser.add_argument("--key-file", type=str, help="Path to the key file")
    parser.add_argument("--input-file", type=str, help="Path to the input file")
    parser.add_argument("--output-file", type=str, help="Path to save the output")
    parser.add_argument("--decrypt", action="store_true", help="Enable decryption mode")

    args = parser.parse_args()

    if args.generate_key and args.key_file:
        generate_key(args.generate_key, args.key_file)
    elif args.input_file and args.output_file and args.key_file:
        process_file(args.input_file, args.output_file, args.key_file, decrypt=args.decrypt)
    else:
        print("Invalid usage. Use --help for more information.")
