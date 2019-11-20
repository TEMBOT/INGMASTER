::
::
echo off
echo........................................
echo Generate solution code from added Entity classes
echo........................................
echo off
:PROMPT
SET /P AREYOUSURE=Are you sure you want to delete generated files(Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

::Select the VS version
SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Professional\Common7\IDE\TextTransform.exe"
::SET tt="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\TextTransform.exe"

echo off
echo Delete previously generated cs code files 
 DEL /F "1_t4EntityHelpersGenerate.cs"
 DEL /F "..\INGMASTER.Domain\Domain\2_t4DomainViewModelsGenerate.cs"	
 ::DEL /F "..\INGMASTER.Domain\Mapping\3_t4DomainMappingProfileGenerate.cs"	
 DEL /F "..\INGMASTER.Domain\Service\4_t4DomainServicesGenerate.cs"	
 ::DEL /F "..\INGMASTER.Api\Controllers\5_t4ApiControllerGenerate.cs"	
 ::DEL /F "..\INGMASTER.Test\6_t4IntegrationTestGenerate.cs"
echo .
echo Run all T4s...
echo -generate entity helpers
%tt% "1_t4EntityHelpersGenerate.tt" -out "1_t4EntityHelpersGenerate.cs"
echo -generate domain classes
%tt% "..\INGMASTER.Domain\Domain\2_t4DomainViewModelsGenerate.tt" -out "..\INGMASTER.Domain\Domain\2_t4DomainViewModelsGenerate.cs"
echo -generate mapper classes
::%tt% "..\INGMASTER.Domain\Mapping\3_t4DomainMappingProfileGenerate.tt" -out "..\INGMASTER.Domain\Mapping\3_t4DomainMappingProfileGenerate.cs"	
echo -generate services classes
%tt% "..\INGMASTER.Domain\Service\4_t4DomainServicesGenerate.tt" -out "..\INGMASTER.Domain\Service\4_t4DomainServicesGenerate.cs"	
echo -generate controller classes
::%tt% "..\INGMASTER.Api\Controllers\5_t4ApiControllerGenerate.tt" -out "..\INGMASTER.Api\Controllers\5_t4ApiControllerGenerate.cs"	
echo -generate test classes
::%tt% "..\INGMASTER.Test\6_t4IntegrationTestGenerate.tt" -out "..\INGMASTER.Test\6_t4IntegrationTestGenerate.cs"	
echo T4s completed.
pause
:END