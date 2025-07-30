#!/bin/bash
if [ -f "index.html" ]; then
  echo "✅ Test passed: index.html found"
  exit 0
else
  echo "❌ Test failed: index.html missing"
  exit 1
fi
