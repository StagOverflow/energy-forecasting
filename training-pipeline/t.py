# definition of the decorator function
def multiply_by_100_decorator(decorated_function):
    def wrapper(num1, num2):
        print("Actually, nope, not gonna do anything :) bye ybe")
        return

    return wrapper


# definition of the `add` function decorated with the `multiply_by_100_decorator`
@multiply_by_100_decorator
def add(num1, num2):
    return num1 + num2


# definition of the `subtract` function decorated with the `multiply_by_100_decorator`
@multiply_by_100_decorator
def subtract(num1, num2):
    return num1 - num2


# calling the decorated functions
print(add(1, 9))  # prints 1000
print(subtract(4, 2))  # prints 200