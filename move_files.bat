@echo off
echo ==========================================
echo   MISSION CONTROL - File Mover Script
echo ==========================================
echo.

cd C:\Users\adhsc\mission-control

REM === Create missing folders ===
mkdir public 2>nul
mkdir src\app\harley\dtc 2>nul
mkdir src\app\auto 2>nul
mkdir src\app\trucking 2>nul
mkdir src\app\ebike 2>nul
mkdir src\app\scooter 2>nul
mkdir src\app\api\ai-chat 2>nul
mkdir src\app\api\email-signup 2>nul
mkdir src\app\api\health 2>nul
mkdir src\app\api\stripe\checkout 2>nul
mkdir src\app\api\stripe\webhook 2>nul
mkdir src\components 2>nul
mkdir src\lib 2>nul
mkdir artifacts 2>nul
mkdir emails 2>nul

echo [1/8] Root config files...
copy MC_Files\package.json . /Y
copy MC_Files\next.config.js . /Y
copy MC_Files\tailwind.config.js . /Y
copy MC_Files\postcss.config.js . /Y
copy MC_Files\vercel.json . /Y
copy MC_Files\env.template .env.local /Y
copy MC_Files\robots.txt public\robots.txt /Y
copy MC_Files\README.md . /Y
copy MC_Files\gitignore.txt .gitignore /Y
copy MC_Files\supabase_schema.sql . /Y
copy MC_Files\migrate.js . /Y
echo DONE!
echo.

echo [2/8] src/lib files...
copy MC_Files\src_lib_constants.js src\lib\constants.js /Y
copy MC_Files\src_lib_supabase.js src\lib\supabase.js /Y
echo DONE!
echo.

echo [3/8] src/app core files...
copy MC_Files\src_app_layout.jsx src\app\layout.jsx /Y
copy MC_Files\src_app_globals.css src\app\globals.css /Y
copy MC_Files\src_app_sitemap.js src\app\sitemap.js /Y
copy MC_Files\src_middleware.js src\middleware.js /Y
echo DONE!
echo.

echo [4/8] src/components...
copy MC_Files\src_components_AuthProvider.jsx src\components\AuthProvider.jsx /Y
copy MC_Files\src_components_PlatformBadge.jsx src\components\PlatformBadge.jsx /Y
copy MC_Files\MissionControl_ProGate.jsx src\components\ProGate.jsx /Y
copy MC_Files\MissionControl_LoadingSkeletons.jsx src\components\LoadingSkeletons.jsx /Y
echo DONE!
echo.

echo [5/8] Pages...
copy MC_Files\MissionControl_Landing_Page.jsx src\app\page.jsx /Y
copy MC_Files\MissionControl_Dashboard_Shell.jsx src\app\dashboard\page.jsx /Y
copy MC_Files\MissionControl_AI_Chat.jsx src\app\ai-chat\page.jsx /Y
copy MC_Files\MissionControl_Pricing.jsx src\app\pricing\page.jsx /Y
copy MC_Files\MissionControl_Login.jsx src\app\login\page.jsx /Y
copy MC_Files\MissionControl_Onboarding.jsx src\app\onboarding\page.jsx /Y
copy MC_Files\MissionControl_Account.jsx src\app\account\page.jsx /Y
copy MC_Files\MissionControl_Blog.jsx src\app\blog\page.jsx /Y
copy MC_Files\MissionControl_Community.jsx src\app\community\page.jsx /Y
copy MC_Files\MissionControl_Garage.jsx src\app\garage\page.jsx /Y
copy MC_Files\MissionControl_PlatformIndex.jsx src\app\platforms\page.jsx /Y
copy MC_Files\MissionControl_UniversalTools.jsx src\app\universal\page.jsx /Y
copy MC_Files\MissionControl_NotFound.jsx src\app\not-found.jsx /Y
copy MC_Files\MissionControl_Error.jsx src\app\error.jsx /Y
copy MC_Files\MissionControl_SampleTool_DTC.jsx src\app\harley\dtc\page.jsx /Y
echo DONE!
echo.

echo [6/8] API routes...
copy MC_Files\api_ai-chat_route.js src\app\api\ai-chat\route.js /Y
copy MC_Files\api_email-signup_route.js src\app\api\email-signup\route.js /Y
copy MC_Files\api_health_route.js src\app\api\health\route.js /Y
copy MC_Files\api_stripe-checkout_route.js src\app\api\stripe\checkout\route.js /Y
copy MC_Files\api_stripe-webhook_route.js src\app\api\stripe\webhook\route.js /Y
echo DONE!
echo.

echo [7/8] Artifacts (tool components)...
xcopy MC_Files\artifacts artifacts /E /Y /I
echo DONE!
echo.

echo [8/8] Emails...
xcopy MC_Files\emails emails /E /Y /I
echo DONE!
echo.

echo ==========================================
echo   ALL FILES MOVED SUCCESSFULLY!
echo ==========================================
echo.
echo Next steps:
echo   1. Run: npm install
echo   2. Set up your .env.local with real keys
echo   3. Run: npm run dev
echo.
pause
