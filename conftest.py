import glob
import os
import os.path

THISDIR = os.path.dirname(os.path.abspath(__file__))
DEFAULT_MAKEFILE_SEARCH_PATHS = [os.path.join(THISDIR, "tests")]
DEFAULT_GMAKE = None

def pytest_addoption(parser):
    parser.addoption(
        "--makefile",
        action="append",
        default=[],
        help="list of search paths for test scenario makefiles",
    )

    parser.addoption(
        "--gmake",
        default=None,
        help="optional path and filename of gmake (aka GNU Make), to test against",
    )

def pytest_generate_tests(metafunc):
    if "makefile" in metafunc.fixturenames:
        search_paths = metafunc.config.getoption("makefile") or DEFAULT_MAKEFILE_SEARCH_PATHS
        makefiles = discover_makefiles(search_paths)
        metafunc.parametrize("makefile", makefiles)

    if 'gmake' in metafunc.fixturenames:
        gmake = metafunc.config.getoption("gmake")
        metafunc.parametrize("gmake", [gmake if gmake else None])

def discover_makefiles(search_paths):
    makefiles = []
    for a in search_paths:
        if os.path.isfile(a):
            makefiles.append(a)
        elif os.path.isdir(a):
            makefiles.extend(sorted(glob.glob(os.path.join(a, '*.mk'))))
    return makefiles


