#ifndef FLAG_H
#define FLAG_H

#include <string>
#include <functional>
#include <any>
#include <typeindex>

/**
 * @struct Args
 * @brief Represents a command-line argument with associated metadata and behavior.
 * 
 * Members:
 * - shortForm: The short option form (e.g., "-h").
 * - longForm: The long option form (e.g., "--help").
 * - command: A callable (function, lambda, etc.) that takes and returns std::any,
 *            allowing flexible input and output types.
 * - helpMsg: A description string shown in help messages.
 * - expectedType: The expected type of the argument's value, used for type checking.
 */
struct Args
{
    std::string shortForm;                       ///< Short form of the argument (e.g., "-h")
    std::string longForm;                        ///< Long form of the argument (e.g., "--help")
    std::function<std::any(std::any)> command;  ///< Function called when argument is parsed
    std::string helpMsg;                         ///< Help message describing the argument
    std::type_index expectedType = typeid(void);///< Expected type of the argument value (default: void)
};


/**
 * @class ArgHandler
 * @brief Placeholder for a class that manages multiple Args and argument parsing.
 *
 * This class is intended to handle registration, parsing, and execution of
 * command-line arguments using Args structs. Implementation is currently empty.
 */
// TODO: Write The Arg Parsing etc
class ArgHandler
{
private:
    

public:
    
};

#endif // FLAG_H
