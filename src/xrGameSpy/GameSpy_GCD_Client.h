#pragma once

#include "xrCore/xrCore.h"
#include "xrGameSpy/xrGameSpy.h"
#include "xrGameSpy/GameSpy_FuncDefs.h"

class XRGAMESPY_API CGameSpy_GCD_Client
{
public:
    void CreateRespond(char *cdkey, char *RespondStr, char *ChallengeStr, u8 Reauth);
};
