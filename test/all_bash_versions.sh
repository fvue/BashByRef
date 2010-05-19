#!/bin/sh

    # Run tests on bash-3
./runUnit

    # Run tests on bash-4.0.33
./runUnit --tool_exec /opt/bash-4.0.33/bin/bash

    # Run tests on bash-4.0.35
./runUnit --tool_exec /opt/bash-4/bin/bash

    # Run tests on bash-4.1.0
./runUnit --tool_exec /opt/bash-4.1/bin/bash
