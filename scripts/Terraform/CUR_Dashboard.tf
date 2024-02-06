# terraform import observe_dashboard.aws_new_cost_and_usage_report 41523812
resource "observe_dashboard" "aws_new_cost_and_usage_report" {
    layout     = jsonencode(
        {
            autoPack        = true
            gridLayout      = {
                sections = [
                    {
                        card  = {
                            cardType = "section"
                            closed   = false
                            title    = "Dashboard Content"
                        }
                        items = [
                            {
                                card   = {
                                    cardType = "stage"
                                    stageId  = "stage-i8kzq3za"
                                }
                                layout = {
                                    h = 11
                                    w = 3
                                    x = 1
                                    y = 0
                                }
                            },
                            {
                                card   = {
                                    cardType       = "image"
                                    resizeBehavior = "height"
                                    title          = "Untitled Image"
                                    url            = "https://res.cloudinary.com/hy4kyit2a/f_auto,fl_lossy,q_70/learn/modules/aws-pricing-models-and-support/discover-the-aws-cost-management-tools/images/764d2095435e0eb2c12d3f09c9ae895f_559-fc-4-d-5-fc-81-4-e-87-ab-7-d-274098-ae-488-f.png"
                                }
                                layout = {
                                    h = 11
                                    w = 1
                                    x = 0
                                    y = 0
                                }
                            },
                            {
                                card   = {
                                    cardType = "stage"
                                    stageId  = "stage-9e83mgoj"
                                }
                                layout = {
                                    h = 11
                                    w = 3
                                    x = 4
                                    y = 0
                                }
                            },
                            {
                                card   = {
                                    cardType    = "parameter"
                                    parameterId = "AWS_Service"
                                }
                                layout = {
                                    h             = 4
                                    resizeHandles = [
                                        "e",
                                        "w",
                                    ]
                                    w             = 12
                                    x             = 0
                                    y             = 11
                                }
                            },
                            {
                                card   = {
                                    cardType = "stage"
                                    stageId  = "stage-gkad9b7r"
                                }
                                layout = {
                                    h = 27
                                    w = 12
                                    x = 0
                                    y = 15
                                }
                            },
                            {
                                card   = {
                                    cardType = "stage"
                                    stageId  = "stage-cc1dcm6x"
                                }
                                layout = {
                                    h = 30
                                    w = 12
                                    x = 0
                                    y = 42
                                }
                            },
                        ]
                    },
                ]
            }
            stageListLayout = {
                isModified      = false
                parameters      = [
                    {
                        controlledFilterStageId = "stage-mon0fp40"
                        datasetId               = "41520810"
                        defaultValue            = {
                            datasetref = {
                                datasetId = "41520810"
                            }
                        }
                        emptyValueEncoding      = "null"
                        emptyValueLabelOption   = "null"
                        id                      = "input-parameter-bdvzryzu"
                        name                    = "AWS_CUR"
                        valueKind               = {
                            type = "DATASETREF"
                        }
                        viewType                = "input"
                    },
                    {
                        allowEmpty            = true
                        defaultValue          = {
                            array = null
                        }
                        emptyValueEncoding    = "null"
                        emptyValueLabelOption = "All Values"
                        id                    = "AWS_Service"
                        name                  = "AWS Service"
                        source                = "Stage"
                        sourceColumnId        = "cloud_service"
                        sourceStageId         = "stage-cc1dcm6x"
                        valueKind             = {
                            type = "ARRAY"
                        }
                        viewType              = "multi-select"
                    },
                ]
                selectedStageId = "stage-9e83mgoj"
                timeRange       = {
                    display               = "Today 12:46 → 16:46"
                    endTime               = null
                    millisFromCurrentTime = 14400000
                    originalDisplay       = "Past 4 hours"
                    startTime             = null
                    timeRangeInfo         = {
                        key        = "PRESETS"
                        name       = "Presets"
                        presetType = "PAST_4_HOURS"
                    }
                }
            }
        }
    )
    name       = "AWS new cost and usage report"
    parameters = jsonencode(
        [
            {
                defaultValue = {
                    datasetref = {
                        datasetId = "41520810"
                    }
                }
                id           = "input-parameter-bdvzryzu"
                name         = "AWS_CUR"
                valueKind    = {
                    arrayItemType   = null
                    keyForDatasetId = null
                    type            = "DATASETREF"
                }
            },
            {
                defaultValue = {
                    array = null
                }
                id           = "AWS_Service"
                name         = "AWS Service"
                valueKind    = {
                    arrayItemType   = null
                    keyForDatasetId = null
                    type            = "ARRAY"
                }
            },
        ]
    )
    stages     = jsonencode(
        [
            {
                id       = "stage-b6l92qxr"
                input    = [
                    {
                        datasetId   = "41520810"
                        datasetPath = null
                        inputName   = "AWS_CUR_41520810"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance         = "VISIBLE"
                    dataTableViewState = {
                        columnOrderOverride         = {}
                        columnVisibility            = {
                            FIELDS = false
                        }
                        columnWidths                = {
                            BUNDLE_ID     = 280
                            FIELDS        = 1458
                            TotalCost     = 313
                            cloud_service = 304
                            cost          = 191
                            item          = 874
                            service       = 350
                        }
                        defaultColumnWidth          = 70
                        disableFixedLeftColumns     = false
                        minColumnWidth              = 60
                        preserveCellAndRowSelection = true
                        rowHeaderWidth              = 50
                        rowHeights                  = {}
                        selection                   = {
                            cells                = {}
                            columnSelectSequence = []
                            columns              = {}
                            highlightState       = {}
                            rows                 = {}
                            selectionType        = "table"
                        }
                        tableHeight                 = 0
                        tableWidth                  = 2299
                        viewType                    = "Auto"
                    }
                    index              = 0
                    inputList          = [
                        {
                            datasetId   = "41520810"
                            id          = "query-input-7u7t7c3m"
                            inputName   = "AWS_CUR_41520810"
                            inputRole   = "Data"
                            isUserInput = false
                        },
                    ]
                    managers           = [
                        {
                            id                     = "m9rg5zzi"
                            isDisabled             = true
                            isResourceCountEnabled = false
                            type                   = "Timescrubber"
                        },
                    ]
                    queryPresentation  = {
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        limit               = 10000
                        linkify             = true
                        loadEverything      = false
                        progressive         = true
                        resultKinds         = [
                            "ResultKindSchema",
                            "ResultKindData",
                            "ResultKindColumnStats",
                            "ResultKindVolumeStats",
                            "ResultKindProgress",
                        ]
                        rollup              = {}
                    }
                    renderType         = "TABLE"
                    serializable       = true
                    steps              = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR_41520810"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-751lv6f2"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-unc7k4qj"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "make_col serviceCosts:FIELDS.ServiceCosts",
                                "flatten_single serviceCosts",
                                "make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)",
                                "drop_col _c_serviceCosts_path, _c_serviceCosts_value",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columnId = "service"
                                    regex    = "/^\\['(?P<cloud_service>[^']+)'\\]$/"
                                    type     = "ExtractRegex"
                                }
                                summary = null
                                type    = "ExtractRegex"
                            }
                            customSummary  = "service regex /^\\['(?P<cloud_service>[^']+)'\\]$/"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-35vvabik"
                            index          = 2
                            isPinned       = false
                            opal           = [
                                "extract_regex service, /^\\['(?P<cloud_service>[^']+)'\\]$/",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "service",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-mjejjnxo"
                            index          = 3
                            isPinned       = false
                            opal           = [
                                "drop_col service",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "OBSERVATION_KIND",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-54kr4pr6"
                            index          = 4
                            isPinned       = false
                            opal           = [
                                "drop_col OBSERVATION_KIND",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columnId   = "cloud_service"
                                    columnType = "string"
                                    values     = [
                                        {
                                            isExcluding = true
                                            value       = null
                                        },
                                    ]
                                }
                                summary = null
                                type    = "FilterValues"
                            }
                            customSummary  = "cloud_service"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-ey5enefh"
                            index          = 5
                            isPinned       = false
                            opal           = [
                                "filter not is_null(cloud_service)",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "EXTRA",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-xc5ycyri"
                            index          = 6
                            isPinned       = false
                            opal           = [
                                "drop_col EXTRA",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "BUNDLE_ID",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-a461qr8i"
                            index          = 7
                            isPinned       = false
                            opal           = [
                                "drop_col BUNDLE_ID",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "OBSERVATION_INDEX",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-pc1zrgoo"
                            index          = 8
                            isPinned       = false
                            opal           = [
                                "drop_col OBSERVATION_INDEX",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "DATASTREAM_ID",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-n9h1mcpw"
                            index          = 9
                            isPinned       = false
                            opal           = [
                                "drop_col DATASTREAM_ID",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "DATASTREAM_TOKEN_ID",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-pwegrt53"
                            index          = 10
                            isPinned       = false
                            opal           = [
                                "drop_col DATASTREAM_TOKEN_ID",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    autoConvertType   = true
                                    checkedKeys       = [
                                        "MonthlyCosts",
                                    ]
                                    columnId          = "FIELDS"
                                    columnType        = "object"
                                    existingColumnIds = [
                                        "BUNDLE_TIMESTAMP",
                                        "FIELDS",
                                        "cloud_service",
                                        "cost",
                                        "_c_serviceCosts_flattenid",
                                    ]
                                    expandedKeys      = [
                                        "MonthlyCosts",
                                    ]
                                    extraKeys         = []
                                    typeByPath        = {
                                        MonthlyCosts = "variant"
                                    }
                                }
                                summary = null
                                type    = "ExtractJSON"
                            }
                            customSummary  = "FIELDS.MonthlyCosts"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-kkwjo2vj"
                            index          = 11
                            isPinned       = false
                            opal           = [
                                "make_col MonthlyCosts:FIELDS.MonthlyCosts",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "MonthlyCosts",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-fn4a8hr6"
                            index          = 12
                            isPinned       = false
                            opal           = [
                                "drop_col MonthlyCosts",
                            ]
                            type           = "unknown"
                        },
                    ]
                    type               = "table"
                    viewModel          = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "table"
                    }
                }
                params   = null
                pipeline = <<-EOT
                    make_col serviceCosts:FIELDS.ServiceCosts
                    flatten_single serviceCosts
                    make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)
                    drop_col _c_serviceCosts_path, _c_serviceCosts_value
                    extract_regex service, /^\['(?P<cloud_service>[^']+)'\]$/
                    drop_col service
                    drop_col OBSERVATION_KIND
                    filter not is_null(cloud_service)
                    drop_col EXTRA
                    drop_col BUNDLE_ID
                    drop_col OBSERVATION_INDEX
                    drop_col DATASTREAM_ID
                    drop_col DATASTREAM_TOKEN_ID
                    make_col MonthlyCosts:FIELDS.MonthlyCosts
                    drop_col MonthlyCosts
                EOT
            },
            {
                id       = "stage-mon0fp40"
                input    = [
                    {
                        datasetId   = "41520810"
                        datasetPath = null
                        inputName   = "AWS_CUR_41520810"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance        = "HIDDEN"
                    index             = 1
                    inputList         = [
                        {
                            datasetId   = "41520810"
                            id          = "query-input-bx8ldoh7"
                            inputName   = "AWS_CUR_41520810"
                            inputRole   = "Data"
                            isUserInput = false
                        },
                    ]
                    managers          = []
                    queryPresentation = {
                        columnStats         = {
                            histogramBucketCount = "0"
                            maxNbHistograms      = "0"
                            needDistinctCount    = true
                            topKCount            = "100"
                        }
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        linkify             = true
                        progressive         = true
                        resultKinds         = [
                            "ResultKindSchema",
                            "ResultKindColumnStats",
                        ]
                        rollup              = {}
                    }
                    serializable      = true
                    steps             = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR_41520810"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-cc2bl8nc"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            action         = {
                                params  = {
                                    disabled = false
                                    hint     = "#hint{skipExistsNoFilter:true}"
                                }
                                summary = null
                                type    = "Hint"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-nts6zoij"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "#hint{skipExistsNoFilter:true}",
                            ]
                            type           = "unknown"
                        },
                    ]
                    type              = "table"
                    usageDescription  = "Filtered Dataset Controlled Filter Stage"
                    viewModel         = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "table"
                    }
                }
                params   = null
                pipeline = "#hint{skipExistsNoFilter:true}"
            },
            {
                id       = "stage-cc1dcm6x"
                input    = [
                    {
                        datasetId   = null
                        datasetPath = null
                        inputName   = "AWS_CUR"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance         = "VISIBLE"
                    dataTableViewState = {
                        columnOrderOverride         = {}
                        columnVisibility            = {
                            BUNDLE_TIMESTAMP = false
                        }
                        columnWidths                = {
                            cloud_service = 1135
                            cost          = 1388
                        }
                        defaultColumnWidth          = 70
                        disableFixedLeftColumns     = false
                        minColumnWidth              = 60
                        preserveCellAndRowSelection = true
                        rowHeaderWidth              = 33
                        rowHeights                  = {}
                        selection                   = {
                            cells                = {
                                cost = {
                                    "16" = true
                                }
                            }
                            columnSelectSequence = []
                            columns              = {}
                            highlightState       = {}
                            rows                 = {}
                            selectionType        = "cell"
                        }
                        tableHeight                 = 0
                        tableWidth                  = 2560
                        viewType                    = "Auto"
                    }
                    index              = 2
                    inputList          = [
                        {
                            id          = "query-input-7ttraon0"
                            inputName   = "AWS_CUR"
                            inputRole   = "Data"
                            isUserInput = false
                            parameterId = "input-parameter-bdvzryzu"
                        },
                    ]
                    label              = "Cost and usage breakdown"
                    managers           = [
                        {
                            id                     = "r3l1tmf2"
                            isDisabled             = true
                            isResourceCountEnabled = false
                            type                   = "Timescrubber"
                        },
                    ]
                    queryPresentation  = {
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        limit               = 10000
                        linkify             = true
                        loadEverything      = false
                        progressive         = true
                        resultKinds         = [
                            "ResultKindSchema",
                            "ResultKindData",
                            "ResultKindVolumeStats",
                            "ResultKindColumnStats",
                            "ResultKindProgress",
                        ]
                        rollup              = {}
                        sort                = [
                            {
                                ascending  = true
                                columnName = "A_cost_last_not_null"
                            },
                        ]
                    }
                    renderType         = "TABLE"
                    serializable       = true
                    steps              = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-4ujzrlix"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-t8elwwkq"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "make_col serviceCosts:FIELDS.ServiceCosts",
                                "flatten_single serviceCosts",
                                "make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)",
                                "drop_col _c_serviceCosts_path, _c_serviceCosts_value",
                                "extract_regex service, /^\\['(?P<cloud_service>[^']+)'\\]$/",
                                "drop_col service",
                                "drop_col OBSERVATION_KIND",
                                "filter not is_null(cloud_service)",
                                "drop_col EXTRA",
                                "drop_col BUNDLE_ID",
                                "drop_col OBSERVATION_INDEX",
                                "drop_col DATASTREAM_ID",
                                "drop_col DATASTREAM_TOKEN_ID",
                                "make_col MonthlyCosts:FIELDS.MonthlyCosts",
                                "drop_col MonthlyCosts",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columns = [
                                        "FIELDS",
                                    ]
                                }
                                summary = null
                                type    = "DropColumn"
                            }
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-0j9965f7"
                            index          = 2
                            isPinned       = false
                            opal           = [
                                "drop_col FIELDS",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columnId         = "cloud_service"
                                    columnType       = "string"
                                    parameterFilters = [
                                        "AWS_Service",
                                    ]
                                }
                                summary = null
                                type    = "FilterParameter"
                            }
                            customSummary  = "AWS Service"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-53olr2np"
                            index          = 3
                            isPinned       = false
                            opal           = [
                                "filter array_contains($AWS_Service, cloud_service) or is_null($AWS_Service)",
                            ]
                            type           = "unknown"
                        },
                        {
                            action         = {
                                params  = {
                                    columnId = "cost"
                                }
                                summary = null
                                type    = "ConvertToInt"
                            }
                            customSummary  = "cost to int"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-zi5q2evp"
                            index          = 4
                            isPinned       = false
                            opal           = [
                                "make_col cost: int64(cost)",
                            ]
                            type           = "unknown"
                        },
                    ]
                    thumbnailUri       = "data:image/png;base64,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"
                    type               = "table"
                    viewModel          = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "table"
                    }
                }
                params   = null
                pipeline = <<-EOT
                    make_col serviceCosts:FIELDS.ServiceCosts
                    flatten_single serviceCosts
                    make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)
                    drop_col _c_serviceCosts_path, _c_serviceCosts_value
                    extract_regex service, /^\['(?P<cloud_service>[^']+)'\]$/
                    drop_col service
                    drop_col OBSERVATION_KIND
                    filter not is_null(cloud_service)
                    drop_col EXTRA
                    drop_col BUNDLE_ID
                    drop_col OBSERVATION_INDEX
                    drop_col DATASTREAM_ID
                    drop_col DATASTREAM_TOKEN_ID
                    make_col MonthlyCosts:FIELDS.MonthlyCosts
                    drop_col MonthlyCosts
                    drop_col FIELDS
                    filter array_contains($AWS_Service, cloud_service) or is_null($AWS_Service)
                    make_col cost: int64(cost)
                EOT
            },
            {
                id       = "stage-gkad9b7r"
                input    = [
                    {
                        datasetId   = null
                        datasetPath = null
                        inputName   = "AWS_CUR"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance         = "VISIBLE"
                    dataTableViewState = {
                        columnOrderOverride         = {}
                        columnVisibility            = {}
                        columnWidths                = {}
                        defaultColumnWidth          = 70
                        disableFixedLeftColumns     = false
                        minColumnWidth              = 60
                        preserveCellAndRowSelection = true
                        rowHeaderWidth              = 50
                        rowHeights                  = {}
                        selection                   = {
                            cells                = {}
                            columnSelectSequence = []
                            columns              = {}
                            highlightState       = {}
                            rows                 = {}
                            selectionType        = "table"
                        }
                        tableHeight                 = 0
                        tableWidth                  = 0
                        viewType                    = "Auto"
                    }
                    index              = 3
                    inputList          = [
                        {
                            id          = "query-input-4t40a2y7"
                            inputName   = "AWS_CUR"
                            inputRole   = "Data"
                            isUserInput = true
                            parameterId = "input-parameter-bdvzryzu"
                        },
                    ]
                    label              = "Cost and usage graph"
                    managers           = [
                        {
                            id         = "3kn1dfm3"
                            isDisabled = false
                            type       = "Vis"
                            vis        = {
                                config = {
                                    areaFillType        = "SolidFill"
                                    legend              = {
                                        type    = "list"
                                        visible = true
                                    }
                                    thresholds          = {
                                        startingColor = "Default"
                                        thresholds    = []
                                        visible       = false
                                    }
                                    type                = "bar"
                                    xAxisLabelPlacement = "horizontal"
                                    xConfig             = {
                                        visible = true
                                    }
                                    yConfig             = {
                                        visible = true
                                    }
                                }
                                source = {
                                    table = {
                                        statsBy       = {
                                            fn = "avg"
                                        }
                                        timechart     = {
                                            fn         = "avg"
                                            fnArgs     = null
                                            resolution = "AUTO"
                                        }
                                        transformType = "none"
                                        type          = "xy"
                                        x             = "cloud_service"
                                        y             = "cost"
                                    }
                                    type  = "table"
                                }
                                type   = "bar"
                            }
                        },
                    ]
                    queryPresentation  = {
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        rollup              = {}
                        wantBuckets         = 50
                    }
                    serializable       = true
                    steps              = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-qlh3rwnb"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-8fi3j8ar"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "make_col serviceCosts:FIELDS.ServiceCosts",
                                "flatten_single serviceCosts",
                                "make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)",
                                "drop_col _c_serviceCosts_path, _c_serviceCosts_value",
                                "extract_regex service, /^\\['(?P<cloud_service>[^']+)'\\]$/",
                                "drop_col service",
                                "drop_col OBSERVATION_KIND",
                                "filter not is_null(cloud_service)",
                                "drop_col EXTRA",
                                "drop_col BUNDLE_ID",
                                "drop_col OBSERVATION_INDEX",
                                "drop_col DATASTREAM_ID",
                                "drop_col DATASTREAM_TOKEN_ID",
                                "make_col MonthlyCosts:FIELDS.MonthlyCosts",
                                "drop_col MonthlyCosts",
                            ]
                            type           = "unknown"
                        },
                    ]
                    thumbnailUri       = "data:image/png;base64,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"
                    type               = "table"
                    viewModel          = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "vis"
                    }
                }
                params   = null
                pipeline = <<-EOT
                    make_col serviceCosts:FIELDS.ServiceCosts
                    flatten_single serviceCosts
                    make_col service:string(_c_serviceCosts_path), cost:float64(_c_serviceCosts_value)
                    drop_col _c_serviceCosts_path, _c_serviceCosts_value
                    extract_regex service, /^\['(?P<cloud_service>[^']+)'\]$/
                    drop_col service
                    drop_col OBSERVATION_KIND
                    filter not is_null(cloud_service)
                    drop_col EXTRA
                    drop_col BUNDLE_ID
                    drop_col OBSERVATION_INDEX
                    drop_col DATASTREAM_ID
                    drop_col DATASTREAM_TOKEN_ID
                    make_col MonthlyCosts:FIELDS.MonthlyCosts
                    drop_col MonthlyCosts
                EOT
            },
            {
                id       = "stage-i8kzq3za"
                input    = [
                    {
                        datasetId   = "41520810"
                        datasetPath = null
                        inputName   = "AWS_CUR_41520810"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance         = "VISIBLE"
                    dataTableViewState = {
                        columnOrderOverride         = {}
                        columnVisibility            = {}
                        columnWidths                = {}
                        defaultColumnWidth          = 70
                        disableFixedLeftColumns     = false
                        minColumnWidth              = 60
                        preserveCellAndRowSelection = true
                        rowHeaderWidth              = 50
                        rowHeights                  = {}
                        selection                   = {
                            cells                = {}
                            columnSelectSequence = []
                            columns              = {}
                            highlightState       = {}
                            rows                 = {}
                            selectionType        = "table"
                        }
                        tableHeight                 = 0
                        tableWidth                  = 0
                        viewType                    = "Auto"
                    }
                    index              = 4
                    inputList          = [
                        {
                            datasetId   = "41520810"
                            id          = "query-input-nr7259l4"
                            inputName   = "AWS_CUR_41520810"
                            inputRole   = "Data"
                            isUserInput = true
                        },
                    ]
                    managers           = [
                        {
                            id         = "s8xitalb"
                            isDisabled = false
                            type       = "Vis"
                            vis        = {
                                config = {
                                    color           = "Red"
                                    colorConfigType = "Threshold"
                                    colorMapping    = [
                                        {
                                            color = ""
                                            key   = "690.41635963"
                                        },
                                    ]
                                    fieldConfig     = {
                                        visible = false
                                    }
                                    singleStatLabel = "Total Cost"
                                    thresholds      = {
                                        defaultColor  = "Default"
                                        drawType      = "Lines"
                                        mode          = "Value"
                                        startingColor = "Green"
                                        thresholds    = [
                                            {
                                                exceedsColor = "Red"
                                                id           = "threshold-q4n3s7xz"
                                                value        = 250
                                            },
                                        ]
                                    }
                                    type            = "singlefield"
                                }
                                source = {
                                    table = {
                                        field         = "TotalCost"
                                        transformType = "none"
                                        type          = "singlefield"
                                    }
                                    topK  = {
                                        k     = 100
                                        order = "Top"
                                        type  = "Auto"
                                    }
                                    type  = "table"
                                }
                                type   = "singlevalue"
                            }
                        },
                    ]
                    queryPresentation  = {
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        rollup              = {}
                        sort                = [
                            {
                                ascending  = true
                                columnName = "A_AWS_CUR_count"
                            },
                        ]
                        wantBuckets         = 100
                    }
                    serializable       = true
                    steps              = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR_41520810"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-cqs3x1qw"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-bise872a"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "make_col ServiceCount:int64(FIELDS.ServiceCount)",
                                "make_col TotalCost:float64(FIELDS.TotalCost)",
                                "make_col MonthlyCosts:FIELDS.MonthlyCosts",
                                "",
                            ]
                            type           = "unknown"
                        },
                    ]
                    thumbnailUri       = "data:image/png;base64,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"
                    type               = "table"
                    viewModel          = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "vis"
                    }
                }
                params   = null
                pipeline = <<-EOT
                    make_col ServiceCount:int64(FIELDS.ServiceCount)
                    make_col TotalCost:float64(FIELDS.TotalCost)
                    make_col MonthlyCosts:FIELDS.MonthlyCosts
                EOT
            },
            {
                id       = "stage-9e83mgoj"
                input    = [
                    {
                        datasetId   = "41520810"
                        datasetPath = null
                        inputName   = "AWS_CUR_41520810"
                        inputRole   = "Data"
                        stageId     = null
                    },
                ]
                layout   = {
                    appearance         = "VISIBLE"
                    dataTableViewState = {
                        columnOrderOverride         = {}
                        columnVisibility            = {}
                        columnWidths                = {}
                        defaultColumnWidth          = 70
                        disableFixedLeftColumns     = false
                        minColumnWidth              = 60
                        preserveCellAndRowSelection = true
                        rowHeaderWidth              = 50
                        rowHeights                  = {}
                        selection                   = {
                            cells                = {}
                            columnSelectSequence = []
                            columns              = {}
                            highlightState       = {}
                            rows                 = {}
                            selectionType        = "table"
                        }
                        tableHeight                 = 0
                        tableWidth                  = 0
                        viewType                    = "Auto"
                    }
                    index              = 5
                    inputList          = [
                        {
                            datasetId   = "41520810"
                            id          = "query-input-nr7259l4"
                            inputName   = "AWS_CUR_41520810"
                            inputRole   = "Data"
                            isUserInput = true
                        },
                    ]
                    managers           = [
                        {
                            id         = "4zq3gvr6"
                            isDisabled = false
                            type       = "Vis"
                            vis        = {
                                config = {
                                    color           = "Yellow"
                                    colorConfigType = "Color"
                                    fieldConfig     = {
                                        visible = false
                                    }
                                    singleStatLabel = "Service Count"
                                    type            = "singlefield"
                                }
                                source = {
                                    table = {
                                        field         = "ServiceCount"
                                        transformType = "none"
                                        type          = "singlefield"
                                    }
                                    topK  = {
                                        k     = 100
                                        order = "Top"
                                        type  = "Auto"
                                    }
                                    type  = "table"
                                }
                                type   = "singlevalue"
                            }
                        },
                    ]
                    queryPresentation  = {
                        initialRollupFilter = {
                            mode = "Last"
                        }
                        rollup              = {}
                        sort                = [
                            {
                                ascending  = true
                                columnName = "A_AWS_CUR_count"
                            },
                        ]
                        wantBuckets         = 100
                    }
                    serializable       = true
                    steps              = [
                        {
                            customName     = "Input"
                            customSummary  = "AWS_CUR_41520810"
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-luqwxjnr"
                            index          = 0
                            isPinned       = false
                            opal           = []
                            type           = "InputStep"
                        },
                        {
                            customSummary  = ""
                            datasetQueryId = {
                                ignoreCompress = false
                                resultKinds    = [
                                    "ResultKindSchema",
                                    "ResultKindData",
                                    "ResultKindVolumeStats",
                                    "ResultKindColumnStats",
                                ]
                            }
                            id             = "step-38agcosv"
                            index          = 1
                            isPinned       = false
                            opal           = [
                                "make_col ServiceCount:int64(FIELDS.ServiceCount)",
                                "make_col TotalCost:float64(FIELDS.TotalCost)",
                                "make_col MonthlyCosts:float64(FIELDS.MonthlyCosts)",
                                "",
                            ]
                            type           = "unknown"
                        },
                    ]
                    thumbnailUri       = "data:image/png;base64,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"
                    type               = "table"
                    viewModel          = {
                        inspectRailCollapsed = true
                        inspectRailWidth     = 640
                        railCollapseState    = {
                            inputsOutputs = false
                            minimap       = false
                            note          = true
                            script        = true
                        }
                        showTimeRuler        = true
                        stageTab             = "vis"
                    }
                }
                params   = null
                pipeline = <<-EOT
                    make_col ServiceCount:int64(FIELDS.ServiceCount)
                    make_col TotalCost:float64(FIELDS.TotalCost)
                    make_col MonthlyCosts:float64(FIELDS.MonthlyCosts)
                EOT
            },
        ]
    )
    workspace  = "o:::workspace:41457877"
}
