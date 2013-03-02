testCases = {
    shared: {
        "Gutterless": {
            instructions: [
                {
                    selector:   ".l-row",
                    modifier:   "m-gutterless"
                }
            ]
        },
        "Offset 1": {
            group:  "offsets",
            instructions: [
                {
                    selector:   ".l-col:first-child",
                    modifier:   "m-pull-1"
                },
                {
                    selector:   ".l-col:last-child",
                    modifier:   "m-push-1"
                }
            ]
        },
        "Offset 2": {
            group:  "offsets",
            instructions: [
                {
                    selector:   ".l-col:first-child",
                    modifier:   "m-pull-3"
                },
                {
                    selector:   ".l-col:last-child",
                    modifier:   "m-push-3"
                }
            ]
        }
    }
};
