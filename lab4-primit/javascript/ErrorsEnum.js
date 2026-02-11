const prompt = require("prompt-sync")({ sigint: true });

const Error_enumobj = {
    FP_ROUNDING: "FP_ROUNDING",
    FP_OVERFLOW: "FP_OVERFLOW",
    FP_UNDERFLOW: "FP_UNDERFLOW",
    INT_OVERFLOW: "INT_OVERFLOW"
};

const Result_enumobj = {
    A_BIT_DIFFERENT: "A_BIT_DIFFERENT",
    INFINITY: "INFINITY",
    ZERO: "ZERO",
    VERY_DIFFERENT: "VERY_DIFFERENT"
};

function error2Result(err) {
    switch (err) {
        case Error_enumobj.FP_ROUNDING:
            return Result_enumobj.A_BIT_DIFFERENT;
        case Error_enumobj.FP_OVERFLOW:
            return Result_enumobj.INFINITY;
        case Error_enumobj.FP_UNDERFLOW:
            return Result_enumobj.ZERO;
        case Error_enumobj.INT_OVERFLOW:
            return Result_enumobj.VERY_DIFFERENT;
        default:
            return "Invalid Error value";
    }
}

// NEW: reverse mapping (Result -> Error)
function result2Error(result) {
    for (const e of Object.values(Error_enumobj)) {
        if (error2Result(e) === result) return e;
    }
    return "Invalid Result value";
}

// UPDATED: show results (not errors)
console.log("Result list: ", Object.values(Result_enumobj));

let validArg = false;
while (!validArg) {
    let input = prompt("Input result: ").toUpperCase();

    if (Object.values(Result_enumobj).includes(input)) {
        validArg = true;
        console.log(input + " results from: " + result2Error(input));
    } else {
        console.log("Invalid Result value");
    }
}