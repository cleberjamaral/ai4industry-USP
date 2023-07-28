@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  hypermedea startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and HYPERMEDEA_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\hypermedea-app-0.3.jar;%APP_HOME%\lib\hypermedea-lib-0.3.jar;%APP_HOME%\lib\jacamo-0.9.jar;%APP_HOME%\lib\ontapi-2.1.0.jar;%APP_HOME%\lib\org.semanticweb.hermit-1.4.5.519.jar;%APP_HOME%\lib\wot-td-java-ea17fda.jar;%APP_HOME%\lib\pddl4j-v3.8.3.jar;%APP_HOME%\lib\npl-0.5.jar;%APP_HOME%\lib\intmas-1.0.0.jar;%APP_HOME%\lib\sai-0.4.jar;%APP_HOME%\lib\antlr4-4.8.jar;%APP_HOME%\lib\slf4j-nop-1.7.30.jar;%APP_HOME%\lib\jade-4.3.jar;%APP_HOME%\lib\ant-1.10.5.jar;%APP_HOME%\lib\jason-2.5.1.jar;%APP_HOME%\lib\cartago-2.5.jar;%APP_HOME%\lib\jaca-2.5.jar;%APP_HOME%\lib\moise-0.13.jar;%APP_HOME%\lib\graphviz-java-0.7.0.jar;%APP_HOME%\lib\gradle-tooling-api-6.2.2.jar;%APP_HOME%\lib\jena-arq-3.16.0.jar;%APP_HOME%\lib\owlapi-distribution-5.1.9.jar;%APP_HOME%\lib\owlapi-compatibility-5.1.9.jar;%APP_HOME%\lib\owlapi-apibinding-5.1.9.jar;%APP_HOME%\lib\owlapi-impl-5.1.9.jar;%APP_HOME%\lib\owlapi-oboformat-5.1.9.jar;%APP_HOME%\lib\owlapi-rio-5.1.9.jar;%APP_HOME%\lib\owlapi-parsers-5.1.9.jar;%APP_HOME%\lib\owlapi-tools-5.1.9.jar;%APP_HOME%\lib\owlapi-api-5.1.14.jar;%APP_HOME%\lib\httpclient5-fluent-5.2.1.jar;%APP_HOME%\lib\httpclient5-5.2.1.jar;%APP_HOME%\lib\californium-core-2.6.3.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.25.jar;%APP_HOME%\lib\libthrift-0.13.0.jar;%APP_HOME%\lib\element-connector-2.6.3.jar;%APP_HOME%\lib\slf4j-reload4j-2.0.6.jar;%APP_HOME%\lib\jena-core-3.16.0.jar;%APP_HOME%\lib\jena-base-3.16.0.jar;%APP_HOME%\lib\rdf4j-storage-3.7.7.pom;%APP_HOME%\lib\rdf4j-client-3.7.7.pom;%APP_HOME%\lib\rdf4j-repository-manager-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-http-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-binary-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-jsonld-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-n3-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-nquads-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryalgebra-geosparql-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-federation-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-nativerdf-3.7.7.jar;%APP_HOME%\lib\rdf4j-lucene-spin-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-spin-3.7.7.jar;%APP_HOME%\lib\rdf4j-spin-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-dataset-3.7.7.jar;%APP_HOME%\lib\rdf4j-shacl-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-elasticsearch-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-lucene-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-solr-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-lucene-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-sail-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-inferencer-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-memory-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-base-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryalgebra-evaluation-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-sparql-3.7.7.jar;%APP_HOME%\lib\rdf4j-http-client-3.7.7.jar;%APP_HOME%\lib\rdf4j-http-protocol-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-ntriples-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-rdfjson-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-rdfxml-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryparser-sparql-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-trig-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-trix-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-turtle-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-datatypes-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-languages-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryparser-serql-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryrender-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryparser-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-model-3.7.7.jar;%APP_HOME%\lib\rdf4j-sail-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryalgebra-model-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryresultio-binary-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryresultio-sparqljson-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryresultio-sparqlxml-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryresultio-text-3.7.7.jar;%APP_HOME%\lib\rdf4j-queryresultio-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-contextaware-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-event-3.7.7.jar;%APP_HOME%\lib\rdf4j-repository-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-query-3.7.7.jar;%APP_HOME%\lib\rdf4j-rio-api-3.7.7.jar;%APP_HOME%\lib\rdf4j-sparqlbuilder-3.7.7.jar;%APP_HOME%\lib\rdf4j-model-3.7.7.jar;%APP_HOME%\lib\rdf4j-util-3.7.7.jar;%APP_HOME%\lib\jsonld-java-0.13.3.jar;%APP_HOME%\lib\solr-solrj-7.7.3.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.32.jar;%APP_HOME%\lib\slf4j-api-2.0.6.jar;%APP_HOME%\lib\caffeine-2.8.6.jar;%APP_HOME%\lib\axiom-c14n-1.2.14.jar;%APP_HOME%\lib\axiom-impl-1.2.14.jar;%APP_HOME%\lib\axiom-dom-1.2.14.jar;%APP_HOME%\lib\axiom-api-1.2.14.jar;%APP_HOME%\lib\batik-rasterizer-1.10.jar;%APP_HOME%\lib\batik-svgrasterizer-1.10.jar;%APP_HOME%\lib\batik-codec-1.10.jar;%APP_HOME%\lib\batik-transcoder-1.10.jar;%APP_HOME%\lib\batik-bridge-1.10.jar;%APP_HOME%\lib\batik-script-1.10.jar;%APP_HOME%\lib\batik-anim-1.10.jar;%APP_HOME%\lib\batik-svg-dom-1.10.jar;%APP_HOME%\lib\batik-parser-1.10.jar;%APP_HOME%\lib\batik-gvt-1.10.jar;%APP_HOME%\lib\batik-svggen-1.10.jar;%APP_HOME%\lib\batik-awt-util-1.10.jar;%APP_HOME%\lib\batik-dom-1.10.jar;%APP_HOME%\lib\batik-css-1.10.jar;%APP_HOME%\lib\xmlgraphics-commons-2.3.jar;%APP_HOME%\lib\httpclient-osgi-4.5.13.jar;%APP_HOME%\lib\httpclient-cache-4.5.13.jar;%APP_HOME%\lib\httpmime-4.5.13.jar;%APP_HOME%\lib\fluent-hc-4.5.13.jar;%APP_HOME%\lib\httpclient-4.5.13.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\automaton-1.11-8.jar;%APP_HOME%\lib\java-getopt-1.0.13.jar;%APP_HOME%\lib\trove4j-3.0.3.jar;%APP_HOME%\lib\gson-2.10.1.jar;%APP_HOME%\lib\json-simple-1.1.1.jar;%APP_HOME%\lib\log4j-core-2.11.0.jar;%APP_HOME%\lib\log4j-api-2.11.0.jar;%APP_HOME%\lib\antlr4-runtime-4.8.jar;%APP_HOME%\lib\ST4-4.3.jar;%APP_HOME%\lib\antlr-runtime-3.5.2.jar;%APP_HOME%\lib\org.abego.treelayout.core-1.0.3.jar;%APP_HOME%\lib\javax.json-1.0.4.jar;%APP_HOME%\lib\icu4j-61.1.jar;%APP_HOME%\lib\ant-launcher-1.10.5.jar;%APP_HOME%\lib\commons-io-2.8.0.jar;%APP_HOME%\lib\nashorn-promise-0.1.1.jar;%APP_HOME%\lib\j2v8_macosx_x86_64-4.6.0.jar;%APP_HOME%\lib\j2v8_linux_x86_64-4.6.0.jar;%APP_HOME%\lib\j2v8_win32_x86_64-4.6.0.jar;%APP_HOME%\lib\j2v8_win32_x86-4.6.0.jar;%APP_HOME%\lib\commons-exec-1.3.jar;%APP_HOME%\lib\guava-30.1.1-jre.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\jena-shaded-guava-3.16.0.jar;%APP_HOME%\lib\jackson-databind-2.11.4.jar;%APP_HOME%\lib\jackson-core-2.11.4.jar;%APP_HOME%\lib\opencsv-4.6.jar;%APP_HOME%\lib\commons-text-1.9.jar;%APP_HOME%\lib\commons-lang3-3.12.0.jar;%APP_HOME%\lib\xz-1.6.jar;%APP_HOME%\lib\commons-rdf-api-0.5.0.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\hppcrt-0.7.5.jar;%APP_HOME%\lib\checker-qual-3.8.0.jar;%APP_HOME%\lib\error_prone_annotations-2.5.1.jar;%APP_HOME%\lib\jackson-annotations-2.11.4.jar;%APP_HOME%\lib\geronimo-activation_1.1_spec-1.1.jar;%APP_HOME%\lib\geronimo-javamail_1.4_spec-1.7.1.jar;%APP_HOME%\lib\jaxen-1.1.4.jar;%APP_HOME%\lib\geronimo-stax-api_1.0_spec-1.0.1.jar;%APP_HOME%\lib\apache-mime4j-core-0.7.2.jar;%APP_HOME%\lib\woodstox-core-asl-4.4.1.jar;%APP_HOME%\lib\httpcore5-h2-5.2.jar;%APP_HOME%\lib\httpcore5-5.2.jar;%APP_HOME%\lib\californium-legal-2.6.3.jar;%APP_HOME%\lib\junit-4.10.jar;%APP_HOME%\lib\batik-xml-1.10.jar;%APP_HOME%\lib\batik-util-1.10.jar;%APP_HOME%\lib\jena-iri-3.16.0.jar;%APP_HOME%\lib\commons-cli-1.4.jar;%APP_HOME%\lib\httpcore-osgi-4.4.14.jar;%APP_HOME%\lib\httpcore-nio-4.4.14.jar;%APP_HOME%\lib\httpcore-4.4.14.jar;%APP_HOME%\lib\javax.annotation-api-1.3.2.jar;%APP_HOME%\lib\j2objc-annotations-1.3.jar;%APP_HOME%\lib\stax2-api-3.1.4.jar;%APP_HOME%\lib\rdf4j-model-vocabulary-3.7.7.jar;%APP_HOME%\lib\rdf4j-model-api-3.7.7.jar;%APP_HOME%\lib\reload4j-1.2.22.jar;%APP_HOME%\lib\hamcrest-core-1.1.jar;%APP_HOME%\lib\xml-apis-ext-1.3.04.jar;%APP_HOME%\lib\batik-constants-1.10.jar;%APP_HOME%\lib\batik-i18n-1.10.jar;%APP_HOME%\lib\commons-csv-1.8.jar;%APP_HOME%\lib\commons-codec-1.14.jar;%APP_HOME%\lib\commons-compress-1.20.jar;%APP_HOME%\lib\collection-0.7.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\mapdb-1.0.8.jar;%APP_HOME%\lib\lucene-spatial-extras-7.7.3.jar;%APP_HOME%\lib\spatial4j-0.8.jar;%APP_HOME%\lib\jts-core-1.17.1.jar;%APP_HOME%\lib\lucene-highlighter-7.7.3.jar;%APP_HOME%\lib\lucene-queryparser-7.7.3.jar;%APP_HOME%\lib\lucene-queries-7.7.3.jar;%APP_HOME%\lib\lucene-analyzers-common-7.7.3.jar;%APP_HOME%\lib\lucene-core-7.7.3.jar;%APP_HOME%\lib\batik-ext-1.10.jar;%APP_HOME%\lib\xalan-2.7.2.jar;%APP_HOME%\lib\serializer-2.7.2.jar;%APP_HOME%\lib\xml-apis-1.3.04.jar;%APP_HOME%\lib\failureaccess-1.0.1.jar;%APP_HOME%\lib\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\commons-beanutils-1.9.3.jar;%APP_HOME%\lib\commons-collections4-4.2.jar;%APP_HOME%\lib\lucene-join-7.7.3.jar;%APP_HOME%\lib\lucene-memory-7.7.3.jar;%APP_HOME%\lib\lucene-sandbox-7.7.3.jar;%APP_HOME%\lib\lucene-spatial3d-7.7.3.jar;%APP_HOME%\lib\s2-geometry-library-java-1.0.0.jar;%APP_HOME%\lib\commons-math3-3.6.1.jar;%APP_HOME%\lib\zookeeper-3.4.14.jar;%APP_HOME%\lib\noggit-0.8.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar


@rem Execute hypermedea
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %HYPERMEDEA_OPTS%  -classpath "%CLASSPATH%" jacamo.infra.JaCaMoLauncher %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable HYPERMEDEA_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%HYPERMEDEA_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
