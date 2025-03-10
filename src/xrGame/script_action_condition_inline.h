////////////////////////////////////////////////////////////////////////////
//	Module 		: script_action_condition_inline.h
//	Created 	: 30.09.2003
//  Modified 	: 29.06.2004
//	Author		: Dmitriy Iassenev
//	Description : Script action condition class inline functions
////////////////////////////////////////////////////////////////////////////

#pragma once

IC CScriptActionCondition::CScriptActionCondition(u32 dwFlags, double dTime)
{
    // note(andre): Changes to make UBSAN happy
    m_dwFlags = dwFlags;
    m_tLifeTime = ALife::_TIME_ID(std::clamp(dTime, 0.0, double(0xFFFFFFFFFFFFFFFF)));
    m_tStartTime = ALife::_TIME_ID(0xFFFFFFFFFFFFFFFF);
}

IC void CScriptActionCondition::initialize() { m_tStartTime = Device.dwTimeGlobal; }
