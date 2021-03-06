/*
 * Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#include "directives.h"

#define TABLE_TARGET
#define LNUM 001
#include "fastmod.h"


#undef TABLE_TARGET
#undef LNUM
#define LNUM 002
#include "fastmod.h"


#undef LNUM
#define LNUM 003
#define GH_TARGET
#include "fastmod.h"


#undef LNUM
#define LNUM 004
#undef GH_TARGET
#define	TARGET_VEX_OR_FMA	vex
#include "fastmod.h"
#undef	TARGET_VEX_OR_FMA


#undef LNUM
#define LNUM 005
#define	TARGET_VEX_OR_FMA	fma4
#include "fastmod.h"
#undef	TARGET_VEX_OR_FMA
