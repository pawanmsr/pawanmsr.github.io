---
layout: post
title:  "Electronics Adventures: Hardware Description"
description:    "Guide to VHDL for Digital Systems' Design."
date:   2023-08-24 17:28 +0530
categories: [blog]
---

# VHDL

[Very high-speed integrated circuit Hardware Description Language](https://en.wikipedia.org/wiki/VHDL){:target="_blank"} is a used to describe programmable digital [Systems On Chip](https://en.wikipedia.org/wiki/System_on_a_chip){:target="_blank"}.  

I created this guide out of  to act as a cheat sheet for my *personal use*.  
There were many high quality guides for Verilog, but not so many for VHDL.  

## Overview  

VHDL is neither case sensitive nor sensitive to spaces.  
It is a reasonable practice to adhere to consistent syntactic styling.  
Hardware Description is largely concurrent instead of largely procedural.  

Schematic capture is **not** a recommended method for digital design.  

### Operators  

Operator groups follow precedence: *exponential*, *logical*, *multiplication*, *addition*, *unary*, *shift*, *relational*. There is no precedence within operator groups. A good practice will be to strongly type the description and rely as little on the precedence order.  

- `**` Exponential.
- `ABS` Absolute value.
- `AND` Logical AND.
- `OR` Logical OR.
- `NOT` Logical NOT.
- `NAND` Logical Not of AND.
- `NOR` Logical Not of OR.
- `XOR` Logical eXclusive OR.
- `XNOR` Logical eXclusive Not of OR.
- `*` Multiplication.
- `/` Division.
- `MOD` Modulus.
- `REM` Remainder.
- `+` Addition. Unary Identity.
- `-` Subtraction. Unary Negation.
- `&` Concatenation (of bits).
- `SLL` Shift Left Logically.
- `SRL` Shift Right Logically.
- `SRA` Shift Right Arithmetically.
- `SLA` Shift Left Arithmetically.
- `ROL` ROtate Left.
- `ROR` ROtate Right.
- `=` Equality.
- `/=` Inequality.
- `<` Less than.
- `<=` Less than or equal to.
- `>` Greater than.
- `>=` Greater than or equal to.
- `--` Single line comments. No method for block comments.

Use 'single' quotes for single bit value; "double quotes" for bit sequence.  

## Library  

Use standard libraries for cross compiler compatibility.

```vhdl
LIBRARY name_of_library;
USE name_of_library.module.all;

-- example
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.numeric_bit.all;
USE ieee.std_logic_1164.all;

```

## Entity

Entity is model interface.

```vhdl
ENTITY name_of_entity IS
    PORT (
        name_of_first_port, name_of_second_port: IN data_type;
        name_of_third_port: OUT data_type;
        name_of_fourth_port: INOUT data_type;
        -- decare more ports
    );

    GENERIC (
        name_of_generic: data_type := value;
        -- declare more generics
    );

    CONSTANT: name_of_constant: data_type := value;
END name_of_entity;

```

## Architecture

Architecture is model behavior.  

Implementation can follow **data-flow model** (or **functional model**), **behavioural model**, **structural model** or a combination of one or more of the three. Functional model uses more of concurrent, conditional and selective signal assignments. Behavioural model uses more of process statements. Hierarchical design and reuse of design units follow the structural model.

```vhdl
ARCHITECTURE behavior OF name_of_entity IS
    SIGNAL name_of_signal: data_type; -- optional local declaration
    COMPONENT name_of_component IS
        -- define ports
    END
BEGIN
    -- architecture behavior
END behavior;

```

*Signals* are like wires inside the model. *Delay* cannot be synthesized, but they can be assigned to signals for simulation. *Variables* are much more abstract.  

```vhdl
-- inertial delay
output <= input_after_processing AFTER few ns; -- replace "few" with a number

-- transport delay
output <= TRANSPORT input_after_processing AFTER few ns; -- replace "few" with a number

-- delays are used only for simulation purpose
-- transport delay assumes that the signal needs some time to transmit
-- inertial delay assumes the time to process the input

```

### Process

Basic functional units.

```vhdl
PROCESS (first_variable_to_watch, second_variable_to_watch)
    VARIABLE name_of_local_variable : data_type;
    BEGIN
        -- process behavior
END PROCESS;

-- process can be named with an optional label as well
label : PROCESS (first_variable_to_watch, second_variable_to_watch) IS
    -- variables_to_watch form the sensitivity list
    VARIABLE name_of_local_variable : data_type;
    BEGIN
        -- process behavior
END PROCESS label;

```

### When-Else

```vhdl
name_of_target_signal <= value_or_source_signal WHEN first_expression ELSE
                         another_value_or_source_signal WHEN second_expression ELSE
                         default_value_or_source_signal;

```

### With-Select-When

```vhdl
WITH expression_to_evaluate SELECT
    name_of_target_signal <= value_or_source_signal WHEN value_of_evaluated_expression,
                             another_value_or_source_signal WHEN another_value_of_evaluated_expression,
                             yet_another_value_or_source_signal WHEN OTHERS;

-- there can be multiple values of evaluated expression in a single WHEN statement
-- multiple values need to be listed using '|' separator
-- value_or_source_signal WHEN first_value | second_value | third_value,

```

### Case-When

```vhdl
PROCESS (variable_to_watch)
BEGIN
    CASE variable_to_watch IS
        WHEN value => ; -- do something
        WHEN another_value => ; -- do something else
        WHEN OTHERS => ; -- do everything else
    END CASE;
END PROCESS;

```

### If-Then-Else

```vhdl
IF (condition) THEN
    ; -- statements
ELSIF (condition) THEN
    ; -- statements
ELSE
    ; -- statements
END IF;

```

### For

```vhdl
FOR loopvar IN start TO finish LOOP
    -- loop statements
END LOOP;

FOR loopvar IN start DOWNTO finish LOOP
    -- loop statements
    IF (condition) THEN
        NEXT;
    ELSE
        EXIT;
    END IF;
    -- more loop statements
END LOOP;

```

### Functions

Reusable behaviours.

```vhdl
FUNCTION name_of_function (first_parameter, second_parameter : data_type) RETURN data_type IS
    variables: data_type
BEGIN
    -- do something
END;

-- some standard functions
rising_edge()  
falling_edge()  

```

### Packages

Packages disseminate reusable behaviours.

```vhdl
PACKAGE name_of_package IS
    -- header which maybe function declaration
END PACKAGE;

PACKAGE BODY name_of_package IS
    -- body which maybe function definition
END PACKAGE BODY;

```

### Procedures

Procedures can use directional parameters.

```vhdl
PROCEDURE name_of_procedure (parameters : IN data_type; parameters : OUT data_type) IS
BEGIN
    -- do something
END PROCEDURE;

```

### Assertion

```vhdl
ASSERT value <= max_value
    REPORT "assertion failed";

```

## Data Types

Derived or User-Defined data types can be derived from Native or Standard data types or other derived data types.  
'Single' quote can be used to access the properties of data.

```vhdl
-- length property
unsigned_data <= to_unsigned(value, unsigned_data'LENGTH);

-- range property
FOR i IN test_data'RANGE LOOP
    ; -- do something
END LOOP;

```

### Native or Standard Data Types

- `BIT` '0' or '1'. Use `STD_LOGIC` instead.  
- `BIT_VECTOR` Use `STD_LOGIC_VECTOR` instead.  
- `BOOLEAN`  
- `INTEGER`  
  - `NATURAL` Greater than equal to zero.  
  - `POSITIVE` Greater than zero.  
- `REAL`  
- `TIME`  
- `CHARACTER`  
- `STRING`  

### Common Derived Data Types  

Use `ieee.std_logic_1164` for common derived data types.

- `STD_LOGIC` 9 values.
  - `0` Low.
  - `1` High.
  - `L` Weak low.
  - `H` Weak high.
  - `U` Uninitialized.
  - `X` High (forced) unknown.
  - `Z` High impedance. Tri-state.
  - `W` Weak unknown.
  - `-` Do not care.
- `SIGNED`
- `UNSIGNED`
- `STD_LOGIC_VECTOR` A bundle of `STD_LOGIC` data.

#### Type Conversion

Use `ieee.numeric_std` for type conversions.  
Use of alternatives such as `ieee.std_logic_arith` are discouraged as it is not as strongly evaluating as the former: extensive overloading of operators that may lead to incorrect operations without any warning.  

```vhdl
-- integer to signed
signed_data <= TO_SIGNED(integer_data, signed_data'LENGTH);

-- integer to unsigned
unsigned_data <= TO_UNSIGNED(integer_data, unsigned_data'LENGTH);

-- integer to std_logic_vector
-- convert to signed or unsigned before converting to std_logic_vector
std_logic_vector_data <= STD_LOGIC_VECTOR(TO_SIGNED(integer_data, std_logic_vector_data'LENGTH));
-- conversion does not change the sign of data
-- replace TO_SIGNED with TO_UNSIGNED for positive only conversion

-- std_logic_vector to signed
integer_data <= SIGNED(std_logic_vector_data)

-- std_logic_vector to unsigned
integer_data <= UNSIGNED(std_logic_vector_data)

-- std_logic_vector to integer
-- convert to signed or unsigned before converting to integer
integer_data <= TO_INTEGER(SIGNED(std_logic_vector_data));
-- conversion does not change the sign of data
-- replace SIGNED with UNSIGNED for positive only conversion

-- signed to integer
integer_data <= TO_INTEGER(signed_data);

-- signed to unsigned
unsigned_data <= UNSIGNED(signed_data);

-- signed to std_logic_vector
std_logic_vector_data <= STD_LOGIC_VECTOR(signed_data);

-- unsigned to integer
integer_data <= TO_INTEGER(unsigned_data);

-- unsigned to signed
unsigned_data <= SIGNED(unsigned_data);

-- unsigned to std_logic_vector
std_logic_vector_data <= STD_LOGIC_VECTOR(unsigned_data);

```

### User-Defined Types

```vhdl
TYPE name_of_type IS ; -- define the type

-- example
TYPE ram IS ARRAY (0 to memory_size) OF STD_LOGIC_VECTOR (data_size downto 0);
-- replace "memory_size" by number of registers
-- replace "data_size" by number of flip-flops in each register

```

### Enumerated Type

```vhdl
-- enumerated type has similar declaration to user-defined types
TYPE state_type IS (ST0, ST1, ST2, ST3);

```

## Notes

[GHDL](https://github.com/ghdl/ghdl) and other tools can be used to simulate designs on a general purpose computer but it is better to use an actual programmable chip set. Moreover, the chip set associated softwares are often shipped with common digital blocks that can be imported for higher level design.  

### Verilog

Verilog is case sensitive and similarly typed as C. There are greater number of resources available for Verilog HDL including quick references and guide.  

## References

Not exhaustive.

- Hamblen, Hall, Furman. Rapid Prototyping of Digital Systems. SOPC Edition. Springer.

Verilog is a great alternative and commonly used.

- Palnitkar. Verilog HDL: A Guide to Digital Design and Synthesis. Pearson.
