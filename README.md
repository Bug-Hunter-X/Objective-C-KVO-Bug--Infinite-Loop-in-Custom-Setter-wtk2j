# Objective-C KVO Bug: Infinite Loop in Custom Setter

This repository demonstrates a subtle bug that can occur in Objective-C when using Key-Value Observing (KVO) with custom setters.  If a setter modifies other properties that also have KVO observers, it can lead to infinite recursion and crashes.

## Bug Description
The bug occurs when a custom setter modifies another property which is also being observed. This can create a loop where changes trigger each other infinitely.

## Solution
The solution is to avoid modifying other observed properties directly within a setter.  Instead, use separate methods or perform the modifications after removing the KVO observation.