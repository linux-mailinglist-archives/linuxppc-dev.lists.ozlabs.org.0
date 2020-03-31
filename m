Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C56198C57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:34:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s0130NRmzDrMl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:34:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ryk4bZqQ; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rznt4XCGzDqst
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:24:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rznp4cDRz9v0KD;
 Tue, 31 Mar 2020 08:24:46 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ryk4bZqQ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OqZeeOJCZNay; Tue, 31 Mar 2020 08:24:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rznp3Gm3z9v0KC;
 Tue, 31 Mar 2020 08:24:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585635886; bh=VhcT5XNZUc0cj+F4zgc5+L8Kv2BXcFqB2osOoz43Kzo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=ryk4bZqQIdft/2E2iFI2SJQHAGEPGTY/J4chrJBbOGQxGDZZhE2+qEE3TtH/Pv6ty
 ABBbSTq91o6dY0dxlnNy5C7gtG7MeTPzMAuzuQXrvFKdKlwGsQ0gihn623IPyWDENs
 gSzDRNfTfc+y5ok0s4iEFW5wgbaLZ7p/ZFUE5Ov8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 590B78B784;
 Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G6jIzEJKffmc; Tue, 31 Mar 2020 08:24:47 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 65BDD8B752;
 Tue, 31 Mar 2020 08:24:46 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 651BA65673; Tue, 31 Mar 2020 06:24:46 +0000 (UTC)
Message-Id: <63d5011636e22cbc2fea4829f8f08d7fc6f0e134.1585635837.git.christophe.leroy@c-s.fr>
In-Reply-To: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
References: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 06/10] powerpc/xmon: Remove PPC403 and PPC405
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Mar 2020 06:24:46 +0000 (UTC)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

xmon has special support for PPC403 and PPC405 which were part
of 40x platforms.

40x platforms are gone, remove support of PPC403 and PPC405 in xmon.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/xmon/ppc-opc.c | 277 +++++++-----------------------------
 arch/powerpc/xmon/ppc.h     |   6 -
 2 files changed, 49 insertions(+), 234 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index dfb80810b16c..314b6f4b191e 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -2003,17 +2003,15 @@ extract_spr (unsigned long insn,
   return ((insn >> 16) & 0x1f) | ((insn >> 6) & 0x3e0);
 }
 
-/* Some dialects have 8 SPRG registers instead of the standard 4.  */
-#define ALLOW8_SPRG (PPC_OPCODE_BOOKE | PPC_OPCODE_405)
-
 static unsigned long
 insert_sprg (unsigned long insn,
 	     long value,
 	     ppc_cpu_t dialect,
 	     const char **errmsg)
 {
+  /* Some dialects have 8 SPRG registers instead of the standard 4.  */
   if (value > 7
-      || (value > 3 && (dialect & ALLOW8_SPRG) == 0))
+      || (value > 3 && (dialect & PPC_OPCODE_BOOKE) == 0))
     *errmsg = _("invalid sprg number");
 
   /* If this is mfsprg4..7 then use spr 260..263 which can be read in
@@ -2032,8 +2030,8 @@ extract_sprg (unsigned long insn,
   unsigned long val = (insn >> 16) & 0x1f;
 
   /* mfsprg can use 260..263 and 272..279.  mtsprg only uses spr 272..279
-     If not BOOKE, 405 or VLE, then both use only 272..275.  */
-  if ((val - 0x10 > 3 && (dialect & ALLOW8_SPRG) == 0)
+     If not BOOKE or VLE, then both use only 272..275.  */
+  if ((val - 0x10 > 3 && (dialect & PPC_OPCODE_BOOKE) == 0)
       || (val - 0x10 > 7 && (insn & 0x100) != 0)
       || val <= 3
       || (val & 8) != 0)
@@ -2960,8 +2958,6 @@ extract_vleil (unsigned long insn,
 #define PPC64	PPC_OPCODE_64 | PPC_OPCODE_64_BRIDGE
 #define NON32	(PPC_OPCODE_64 | PPC_OPCODE_POWER4	\
 		 | PPC_OPCODE_EFS | PPC_OPCODE_E500MC | PPC_OPCODE_TITAN)
-#define PPC403	PPC_OPCODE_403
-#define PPC405	PPC_OPCODE_405
 #define PPC440	PPC_OPCODE_440
 #define PPC464	PPC440
 #define PPC476	PPC_OPCODE_476
@@ -2998,7 +2994,7 @@ extract_vleil (unsigned long insn,
 #define E500MC  PPC_OPCODE_E500MC
 #define PPCA2	PPC_OPCODE_A2
 #define TITAN   PPC_OPCODE_TITAN
-#define MULHW   PPC_OPCODE_405 | PPC_OPCODE_440 | TITAN
+#define MULHW   PPC_OPCODE_440 | TITAN
 #define E500	PPC_OPCODE_E500
 #define E6500	PPC_OPCODE_E6500
 #define PPCVLE  PPC_OPCODE_VLE
@@ -3290,7 +3286,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"evor",	VX (4, 535),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evnor",	VX (4, 536),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evnot",	VX (4, 536),	VX_MASK,     PPCSPE,	0,		{RS, RA, BBA}},
-{"get",		APU(4, 268,0),	APU_RA_MASK, PPC405,	0,		{RT, FSL}},
 {"eveqv",	VX (4, 537),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evorc",	VX (4, 539),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evnand",	VX (4, 542),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3313,7 +3308,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"evcmpltu",	VX (4, 562),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
 {"evcmplts",	VX (4, 563),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
 {"evcmpeq",	VX (4, 564),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
-{"cget",	APU(4, 284,0),	APU_RA_MASK, PPC405,	0,		{RT, FSL}},
 {"vadduhs",	VX (4, 576),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"vmul10euq",	VX (4, 577),	VX_MASK,     PPCVEC3,	0,		{VD, VA, VB}},
 {"vminuh",	VX (4, 578),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
@@ -3324,9 +3318,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vsplth",	VX (4, 588),   VXUIMM3_MASK, PPCVEC,	0,		{VD, VB, UIMM3}},
 {"vextractuh",	VX (4, 589),   VXUIMM4_MASK, PPCVEC3,	0,		{VD, VB, UIMM4}},
 {"vupkhsh",	VX (4, 590),	VXVA_MASK,   PPCVEC,	0,		{VD, VB}},
-{"nget",	APU(4, 300,0),	APU_RA_MASK, PPC405,	0,		{RT, FSL}},
 {"evsel",	EVSEL(4,79),	EVSEL_MASK,  PPCSPE,	0,		{RS, RA, RB, CRFS}},
-{"ncget",	APU(4, 316,0),	APU_RA_MASK, PPC405,	0,		{RT, FSL}},
 {"evfsadd",	VX (4, 640),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vadduws",	VX (4, 640),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"evfssub",	VX (4, 641),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3355,12 +3347,10 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"evfsctuf",	VX (4, 662),	VX_MASK,     PPCSPE,	0,		{RS, RB}},
 {"evfsctsf",	VX (4, 663),	VX_MASK,     PPCSPE,	0,		{RS, RB}},
 {"evfsctuiz",	VX (4, 664),	VX_MASK,     PPCSPE,	0,		{RS, RB}},
-{"put",		APU(4, 332,0),	APU_RT_MASK, PPC405,	0,		{RA, FSL}},
 {"evfsctsiz",	VX (4, 666),	VX_MASK,     PPCSPE,	0,		{RS, RB}},
 {"evfststgt",	VX (4, 668),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
 {"evfststlt",	VX (4, 669),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
 {"evfststeq",	VX (4, 670),	VX_MASK,     PPCSPE,	0,		{CRFD, RA, RB}},
-{"cput",	APU(4, 348,0),	APU_RT_MASK, PPC405,	0,		{RA, FSL}},
 {"efsadd",	VX (4, 704),	VX_MASK,     PPCEFS,	0,		{RS, RA, RB}},
 {"efssub",	VX (4, 705),	VX_MASK,     PPCEFS,	0,		{RS, RA, RB}},
 {"vminud",	VX (4, 706),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
@@ -3388,7 +3378,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"efsctuf",	VX (4, 726),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efsctsf",	VX (4, 727),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efsctuiz",	VX (4, 728),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
-{"nput",	APU(4, 364,0),	APU_RT_MASK, PPC405,	0,		{RA, FSL}},
 {"efsctsiz",	VX (4, 730),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efststgt",	VX (4, 732),	VX_MASK,     PPCEFS,	0,		{CRFD, RA, RB}},
 {"efststlt",	VX (4, 733),	VX_MASK,     PPCEFS,	0,		{CRFD, RA, RB}},
@@ -3417,7 +3406,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"efdctuf",	VX (4, 758),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efdctsf",	VX (4, 759),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efdctuiz",	VX (4, 760),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
-{"ncput",	APU(4, 380,0),	APU_RT_MASK, PPC405,	0,		{RA, FSL}},
 {"efdctsiz",	VX (4, 762),	VX_MASK,     PPCEFS,	0,		{RS, RB}},
 {"efdtstgt",	VX (4, 764),	VX_MASK,     PPCEFS,	0,		{CRFD, RA, RB}},
 {"efdtstlt",	VX (4, 765),	VX_MASK,     PPCEFS,	0,		{CRFD, RA, RB}},
@@ -3520,8 +3508,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vand",	VX (4,1028),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"vcmpequb.",	VXR(4,	 6,1),	VXR_MASK,    PPCVEC,	0,		{VD, VA, VB}},
 {"vcmpneb.",	VXR(4,	 7,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
-{"udi0fcm.",	APU(4, 515,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi0fcm",	APU(4, 515,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi0fcm.",	APU(4, 515,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
+{"udi0fcm",	APU(4, 515,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"evmhossf",	VX (4,1031),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vpmsumb",	VX (4,1032),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"evmheumi",	VX (4,1032),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3550,8 +3538,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vabsduh",	VX (4,1091),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"vandc",	VX (4,1092),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"vcmpequh.",	VXR(4,	70,1),	VXR_MASK,    PPCVEC,	0,		{VD, VA, VB}},
-{"udi1fcm.",	APU(4, 547,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi1fcm",	APU(4, 547,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi1fcm.",	APU(4, 547,0),	APU_MASK,    PPC440, 	PPC476,		{URT, URA, URB}},
+{"udi1fcm",	APU(4, 547,1),	APU_MASK,    PPC440, 	PPC476,		{URT, URA, URB}},
 {"vcmpneh.",	VXR(4,	71,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
 {"evmwhssf",	VX (4,1095),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vpmsumh",	VX (4,1096),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
@@ -3590,8 +3578,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vcmpnew.",	VXR(4, 135,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
 {"vpmsumw",	VX (4,1160),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"vcmpequw.",	VXR(4, 134,1),	VXR_MASK,    PPCVEC,	0,		{VD, VA, VB}},
-{"udi2fcm.",	APU(4, 579,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi2fcm",	APU(4, 579,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi2fcm.",	APU(4, 579,0),	APU_MASK,    PPC440, 	PPC476,		{URT, URA, URB}},
+{"udi2fcm",	APU(4, 579,1),	APU_MASK,    PPC440, 	PPC476,		{URT, URA, URB}},
 {"machhwsuo",	XO (4,	76,1,0), XO_MASK,    MULHW,	0,		{RT, RA, RB}},
 {"machhwsuo.",	XO (4,	76,1,1), XO_MASK,    MULHW,	0,		{RT, RA, RB}},
 {"ps_merge10",	XOPS(4,592,0),	XOPS_MASK,   PPCPS,	0,		{FRT, FRA, FRB}},
@@ -3606,9 +3594,9 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vxor",	VX (4,1220),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"evdivws",	VX (4,1222),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vcmpeqfp.",	VXR(4, 198,1),	VXR_MASK,    PPCVEC,	0,		{VD, VA, VB}},
-{"udi3fcm.",	APU(4, 611,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi3fcm.",	APU(4, 611,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"vcmpequd.",	VXR(4, 199,1),	VXR_MASK,    PPCVEC2,	0,		{VD, VA, VB}},
-{"udi3fcm",	APU(4, 611,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi3fcm",	APU(4, 611,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"evdivwu",	VX (4,1223),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vpmsumd",	VX (4,1224),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"evaddumiaaw",	VX (4,1224),	VX_MASK,     PPCSPE,	0,		{RS, RA}},
@@ -3632,8 +3620,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vnot",	VX (4,1284),	VX_MASK,     PPCVEC,	0,		{VD, VA, VBA}},
 {"vnor",	VX (4,1284),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"evmhossiaaw",	VX (4,1285),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
-{"udi4fcm.",	APU(4, 643,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi4fcm",	APU(4, 643,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi4fcm.",	APU(4, 643,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
+{"udi4fcm",	APU(4, 643,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"vcmpnezb.",	VXR(4, 263,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
 {"evmhossfaaw",	VX (4,1287),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evmheumiaaw",	VX (4,1288),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3659,8 +3647,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"evmwlssiaaw",	VX (4,1345),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vavgsh",	VX (4,1346),	VX_MASK,     PPCVEC,	0,		{VD, VA, VB}},
 {"vorc",	VX (4,1348),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
-{"udi5fcm.",	APU(4, 675,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi5fcm",	APU(4, 675,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi5fcm.",	APU(4, 675,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
+{"udi5fcm",	APU(4, 675,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"vcmpnezh.",	VXR(4, 327,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
 {"vncipher",	VX (4,1352),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"evmwlumiaaw",	VX (4,1352),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3691,8 +3679,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"vnand",	VX (4,1412),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"evmhousianw",	VX (4,1412),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evmhossianw",	VX (4,1413),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
-{"udi6fcm.",	APU(4, 707,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi6fcm",	APU(4, 707,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi6fcm.",	APU(4, 707,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
+{"udi6fcm",	APU(4, 707,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"vcmpnezw.",	VXR(4, 391,1),	VXR_MASK,    PPCVEC3,	0,		{VD, VA, VB}},
 {"evmhossfanw",	VX (4,1415),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evmheumianw",	VX (4,1416),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -3714,8 +3702,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"evmwlssianw",	VX (4,1473),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"vsld",	VX (4,1476),	VX_MASK,     PPCVEC2,	0,		{VD, VA, VB}},
 {"vcmpgefp.",	VXR(4, 454,1),	VXR_MASK,    PPCVEC,	0,		{VD, VA, VB}},
-{"udi7fcm.",	APU(4, 739,0),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
-{"udi7fcm",	APU(4, 739,1),	APU_MASK, PPC405|PPC440, PPC476,	{URT, URA, URB}},
+{"udi7fcm.",	APU(4, 739,0),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
+{"udi7fcm",	APU(4, 739,1),	APU_MASK,    PPC440,	PPC476,		{URT, URA, URB}},
 {"vsbox",	VX (4,1480),	VXVB_MASK,   PPCVEC2,	0,		{VD, VA}},
 {"evmwlumianw",	VX (4,1480),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
 {"evmwlsmianw",	VX (4,1481),	VX_MASK,     PPCSPE,	0,		{RS, RA, RB}},
@@ -4381,7 +4369,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"rfdi",	XL(19,39),	0xffffffff,  E500MC,	PPCVLE,		{0}},
 {"rfi",		XL(19,50),	0xffffffff,  COM,	PPCVLE,		{0}},
-{"rfci",	XL(19,51), 0xffffffff, PPC403|BOOKE|PPCE300|PPCA2|PPC476, PPCVLE, {0}},
+{"rfci",	XL(19,51), 0xffffffff, BOOKE|PPCE300|PPCA2|PPC476, PPCVLE, {0}},
 
 {"rfsvc",	XL(19,82),	0xffffffff,  POWER,	PPCVLE,		{0}},
 
@@ -4694,7 +4682,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"lvsl",	X(31,6),	X_MASK,	     PPCVEC,	0,		{VD, RA0, RB}},
 {"lvebx",	X(31,7),	X_MASK,	     PPCVEC,	0,		{VD, RA0, RB}},
-{"lbfcmx",	APU(31,7,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfc",	XO(31,8,0,0),	XO_MASK,     PPCCOM,	0,		{RT, RA, RB}},
 {"sf",		XO(31,8,0,0),	XO_MASK,     PWRCOM,	0,		{RT, RA, RB}},
@@ -4768,7 +4755,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"lvsr",	X(31,38),	X_MASK,	     PPCVEC,	0,		{VD, RA0, RB}},
 {"lvehx",	X(31,39),	X_MASK,	     PPCVEC,	0,		{VD, RA0, RB}},
-{"lhfcmx",	APU(31,39,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"mviwsplt",	X(31,46),	X_MASK,	     PPCVEC2,	0,		{VD, RA, RB}},
 
@@ -4832,15 +4818,14 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"tdu",		XTO(31,68,TOU),	  XTO_MASK,  PPC64,	0,		{RA, RB}},
 {"td",		X(31,68),	X_MASK,	     PPC64,	0,		{TO, RA, RB}},
 
-{"lwfcmx",	APU(31,71,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 {"mulhd",	XO(31,73,0,0),	XO_MASK,     PPC64,	0,		{RT, RA, RB}},
 {"mulhd.",	XO(31,73,0,1),	XO_MASK,     PPC64,	0,		{RT, RA, RB}},
 
 {"mulhw",	XO(31,75,0,0),	XO_MASK,     PPC,	0,		{RT, RA, RB}},
 {"mulhw.",	XO(31,75,0,1),	XO_MASK,     PPC,	0,		{RT, RA, RB}},
 
-{"dlmzb",	XRC(31,78,0), X_MASK, PPC403|PPC440|TITAN, 0,		{RA, RS, RB}},
-{"dlmzb.",	XRC(31,78,1), X_MASK, PPC403|PPC440|TITAN, 0,		{RA, RS, RB}},
+{"dlmzb",	XRC(31,78,0),	X_MASK, PPC440|TITAN,	0,		{RA, RS, RB}},
+{"dlmzb.",	XRC(31,78,1),	X_MASK, PPC440|TITAN,	0,		{RA, RS, RB}},
 
 {"mtsrd",	X(31,82),  XRB_MASK|(1<<20), PPC64,	0,		{SR, RS}},
 
@@ -4858,7 +4843,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"dni",		XRC(31,97,1),	XRB_MASK,    E6500,	0,		{DUI, DCTL}},
 
 {"lvx",		X(31,103),	X_MASK,	     PPCVEC,	0,		{VD, RA0, RB}},
-{"lqfcmx",	APU(31,103,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"neg",		XO(31,104,0,0),	XORB_MASK,   COM,	0,		{RT, RA}},
 {"neg.",	XO(31,104,0,1),	XORB_MASK,   COM,	0,		{RT, RA}},
@@ -4891,12 +4875,11 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"setb",	X(31,128),	XRB_MASK|(3<<16), POWER9, 0,		{RT, BFA}},
 
-{"wrtee",	X(31,131), XRARB_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{RS}},
+{"wrtee",	X(31,131),	XRARB_MASK, BOOKE|PPCA2|PPC476, 0,	{RS}},
 
 {"dcbtstls",	X(31,134),	X_MASK, PPCCHLK|PPC476|TITAN, 0,	{CT, RA0, RB}},
 
 {"stvebx",	X(31,135),	X_MASK,	     PPCVEC,	0,		{VS, RA0, RB}},
-{"stbfcmx",	APU(31,135,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfe",	XO(31,136,0,0),	XO_MASK,     PPCCOM,	0,		{RT, RA, RB}},
 {"sfe",		XO(31,136,0,0),	XO_MASK,     PWRCOM,	0,		{RT, RA, RB}},
@@ -4943,12 +4926,11 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stwepx",	X(31,159),	X_MASK,	  E500MC|PPCA2, 0,		{RS, RA0, RB}},
 
-{"wrteei",	X(31,163), XE_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{E}},
+{"wrteei",	X(31,163),	XE_MASK, BOOKE|PPCA2|PPC476, 0,		{E}},
 
 {"dcbtls",	X(31,166),	X_MASK,	 PPCCHLK|PPC476|TITAN, 0,	{CT, RA0, RB}},
 
 {"stvehx",	X(31,167),	X_MASK,	     PPCVEC,	0,		{VS, RA0, RB}},
-{"sthfcmx",	APU(31,167,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"addex",	ZRC(31,170,0),	Z2_MASK,     POWER9,	0,		{RT, RA, RB, CY}},
 
@@ -4980,7 +4962,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"icblq.",	XRC(31,198,1),	X_MASK,	     E6500,	0,		{CT, RA0, RB}},
 
 {"stvewx",	X(31,199),	X_MASK,	     PPCVEC,	0,		{VS, RA0, RB}},
-{"stwfcmx",	APU(31,199,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfze",	XO(31,200,0,0),	XORB_MASK,   PPCCOM,	0,		{RT, RA}},
 {"sfze",	XO(31,200,0,0),	XORB_MASK,   PWRCOM,	0,		{RT, RA}},
@@ -5020,7 +5001,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"icblc",	X(31,230),	X_MASK,	PPCCHLK|PPC476|TITAN, 0,	{CT, RA0, RB}},
 
 {"stvx",	X(31,231),	X_MASK,	     PPCVEC,	0,		{VS, RA0, RB}},
-{"stqfcmx",	APU(31,231,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfme",	XO(31,232,0,0),	XORB_MASK,   PPCCOM,	0,		{RT, RA}},
 {"sfme",	XO(31,232,0,0),	XORB_MASK,   PWRCOM,	0,		{RT, RA}},
@@ -5068,11 +5048,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"lvexbx",	X(31,261),	X_MASK,	     PPCVEC2,	0,		{VD, RA0, RB}},
 
-{"icbt",	X(31,262),	XRT_MASK,    PPC403,	0,		{RA, RB}},
-
 {"lvepxl",	X(31,263),	X_MASK,	     PPCVEC2,	0,		{VD, RA0, RB}},
 
-{"ldfcmx",	APU(31,263,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 {"doz",		XO(31,264,0,0),	XO_MASK,     M601,	0,		{RT, RA, RB}},
 {"doz.",	XO(31,264,0,1),	XO_MASK,     M601,	0,		{RT, RA, RB}},
 
@@ -5143,41 +5120,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"dcbtep",	XRT(31,319,0),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
 
-{"mfexisr",	XSPR(31,323, 64), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfexier",	XSPR(31,323, 66), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr0",	XSPR(31,323,128), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr1",	XSPR(31,323,129), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr2",	XSPR(31,323,130), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr3",	XSPR(31,323,131), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr4",	XSPR(31,323,132), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr5",	XSPR(31,323,133), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr6",	XSPR(31,323,134), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbr7",	XSPR(31,323,135), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbear",	XSPR(31,323,144), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfbesr",	XSPR(31,323,145), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfiocr",	XSPR(31,323,160), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacr0",	XSPR(31,323,192), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmact0",	XSPR(31,323,193), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmada0",	XSPR(31,323,194), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmasa0",	XSPR(31,323,195), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacc0",	XSPR(31,323,196), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacr1",	XSPR(31,323,200), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmact1",	XSPR(31,323,201), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmada1",	XSPR(31,323,202), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmasa1",	XSPR(31,323,203), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacc1",	XSPR(31,323,204), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacr2",	XSPR(31,323,208), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmact2",	XSPR(31,323,209), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmada2",	XSPR(31,323,210), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmasa2",	XSPR(31,323,211), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacc2",	XSPR(31,323,212), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacr3",	XSPR(31,323,216), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmact3",	XSPR(31,323,217), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmada3",	XSPR(31,323,218), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmasa3",	XSPR(31,323,219), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmacc3",	XSPR(31,323,220), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdmasr",	XSPR(31,323,224), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdcr",	X(31,323), X_MASK, PPC403|BOOKE|PPCA2|PPC476, E500|TITAN, {RT, SPR}},
+{"mfdcr",	X(31,323),	X_MASK, BOOKE|PPCA2|PPC476, E500|TITAN, {RT, SPR}},
 {"mfdcr.",	XRC(31,323,1),	X_MASK,	     PPCA2,	0,		{RT, SPR}},
 
 {"lvexwx",	X(31,325),	X_MASK,	     PPCVEC2,	0,		{VD, RA0, RB}},
@@ -5237,10 +5180,10 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"mfvrsave",	XSPR(31,339,256), XSPR_MASK, PPCVEC,	0,		{RT}},
 {"mfusprg0",	XSPR(31,339,256), XSPR_MASK, BOOKE,	0,		{RT}},
 {"mfsprg",	XSPR(31,339,256), XSPRG_MASK, PPC,	0,		{RT, SPRG}},
-{"mfsprg4",	XSPR(31,339,260), XSPR_MASK, PPC405|BOOKE, 0,		{RT}},
-{"mfsprg5",	XSPR(31,339,261), XSPR_MASK, PPC405|BOOKE, 0,		{RT}},
-{"mfsprg6",	XSPR(31,339,262), XSPR_MASK, PPC405|BOOKE, 0,		{RT}},
-{"mfsprg7",	XSPR(31,339,263), XSPR_MASK, PPC405|BOOKE, 0,		{RT}},
+{"mfsprg4",	XSPR(31,339,260), XSPR_MASK, BOOKE,	0,		{RT}},
+{"mfsprg5",	XSPR(31,339,261), XSPR_MASK, BOOKE,	0,		{RT}},
+{"mfsprg6",	XSPR(31,339,262), XSPR_MASK, BOOKE,	0,		{RT}},
+{"mfsprg7",	XSPR(31,339,263), XSPR_MASK, BOOKE,	0,		{RT}},
 {"mftbu",	XSPR(31,339,269), XSPR_MASK, POWER4|BOOKE, 0,		{RT}},
 {"mftb",	X(31,339),	  X_MASK,    POWER4|BOOKE, 0,		{RT, TBR}},
 {"mftbl",	XSPR(31,339,268), XSPR_MASK, POWER4|BOOKE, 0,		{RT}},
@@ -5344,56 +5287,22 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"mfummcr1",	XSPR(31,339,940), XSPR_MASK, PPC750,	0,		{RT}},
 {"mfupmc3",	XSPR(31,339,941), XSPR_MASK, PPC750,	0,		{RT}},
 {"mfupmc4",	XSPR(31,339,942), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfzpr",	XSPR(31,339,944), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfpid",	XSPR(31,339,945), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfmmucr",	XSPR(31,339,946), XSPR_MASK, TITAN,	0,		{RT}},
-{"mfccr0",	XSPR(31,339,947), XSPR_MASK, PPC405|TITAN, 0,		{RT}},
-{"mfiac3",	XSPR(31,339,948), XSPR_MASK, PPC405,	0,		{RT}},
-{"mfiac4",	XSPR(31,339,949), XSPR_MASK, PPC405,	0,		{RT}},
-{"mfdvc1",	XSPR(31,339,950), XSPR_MASK, PPC405,	0,		{RT}},
-{"mfdvc2",	XSPR(31,339,951), XSPR_MASK, PPC405,	0,		{RT}},
+{"mfccr0",	XSPR(31,339,947), XSPR_MASK, TITAN,	0,		{RT}},
 {"mfmmcr0",	XSPR(31,339,952), XSPR_MASK, PPC750,	0,		{RT}},
 {"mfpmc1",	XSPR(31,339,953), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfsgr",	XSPR(31,339,953), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdcwr",	XSPR(31,339,954), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfpmc2",	XSPR(31,339,954), XSPR_MASK, PPC750,	0,		{RT}},
 {"mfsia",	XSPR(31,339,955), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfsler",	XSPR(31,339,955), XSPR_MASK, PPC405,	0,		{RT}},
 {"mfmmcr1",	XSPR(31,339,956), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfsu0r",	XSPR(31,339,956), XSPR_MASK, PPC405,	0,		{RT}},
-{"mfdbcr1",	XSPR(31,339,957), XSPR_MASK, PPC405,	0,		{RT}},
 {"mfpmc3",	XSPR(31,339,957), XSPR_MASK, PPC750,	0,		{RT}},
 {"mfpmc4",	XSPR(31,339,958), XSPR_MASK, PPC750,	0,		{RT}},
-{"mficdbdr",	XSPR(31,339,979), XSPR_MASK, PPC403|TITAN, 0,		{RT}},
-{"mfesr",	XSPR(31,339,980), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdear",	XSPR(31,339,981), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfevpr",	XSPR(31,339,982), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfcdbcr",	XSPR(31,339,983), XSPR_MASK, PPC403,	0,		{RT}},
-{"mftsr",	XSPR(31,339,984), XSPR_MASK, PPC403,	0,		{RT}},
-{"mftcr",	XSPR(31,339,986), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfpit",	XSPR(31,339,987), XSPR_MASK, PPC403,	0,		{RT}},
-{"mftbhi",	XSPR(31,339,988), XSPR_MASK, PPC403,	0,		{RT}},
-{"mftblo",	XSPR(31,339,989), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfsrr2",	XSPR(31,339,990), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfsrr3",	XSPR(31,339,991), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdbsr",	XSPR(31,339,1008), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdbcr0",	XSPR(31,339,1010), XSPR_MASK, PPC405,	0,		{RT}},
+{"mficdbdr",	XSPR(31,339,979), XSPR_MASK, TITAN,	0,		{RT}},
 {"mfdbdr",	XSPR(31,339,1011), XSPR_MASK, TITAN,	0,		{RS}},
-{"mfiac1",	XSPR(31,339,1012), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfiac2",	XSPR(31,339,1013), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdac1",	XSPR(31,339,1014), XSPR_MASK, PPC403,	0,		{RT}},
-{"mfdac2",	XSPR(31,339,1015), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfl2cr",	XSPR(31,339,1017), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfdccr",	XSPR(31,339,1018), XSPR_MASK, PPC403,	0,		{RT}},
-{"mficcr",	XSPR(31,339,1019), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfictc",	XSPR(31,339,1019), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfpbl1",	XSPR(31,339,1020), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfthrm1",	XSPR(31,339,1020), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfpbu1",	XSPR(31,339,1021), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfthrm2",	XSPR(31,339,1021), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfpbl2",	XSPR(31,339,1022), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfthrm3",	XSPR(31,339,1022), XSPR_MASK, PPC750,	0,		{RT}},
-{"mfpbu2",	XSPR(31,339,1023), XSPR_MASK, PPC403,	0,		{RT}},
 {"mfspr",	X(31,339),	X_MASK,	     COM,	0,		{RT, SPR}},
 
 {"lwax",	X(31,341),	X_MASK,	     PPC64,	0,		{RT, RA0, RB}},
@@ -5432,7 +5341,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"stvexbx",	X(31,389),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 
 {"dcblc",	X(31,390),	X_MASK,	 PPCCHLK|PPC476|TITAN, 0,	{CT, RA0, RB}},
-{"stdfcmx",	APU(31,391,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"divdeu",	XO(31,393,0,0),	XO_MASK,     POWER7|PPCA2, 0,		{RT, RA, RB}},
 {"divdeu.",	XO(31,393,0,1),	XO_MASK,     POWER7|PPCA2, 0,		{RT, RA, RB}},
@@ -5497,46 +5405,12 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"mr.",		XRC(31,444,1),	X_MASK,	     COM,	0,		{RA, RS, RBS}},
 {"or.",		XRC(31,444,1),	X_MASK,	     COM,	0,		{RA, RS, RB}},
 
-{"mtexisr",	XSPR(31,451, 64), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtexier",	XSPR(31,451, 66), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr0",	XSPR(31,451,128), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr1",	XSPR(31,451,129), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr2",	XSPR(31,451,130), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr3",	XSPR(31,451,131), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr4",	XSPR(31,451,132), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr5",	XSPR(31,451,133), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr6",	XSPR(31,451,134), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbr7",	XSPR(31,451,135), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbear",	XSPR(31,451,144), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtbesr",	XSPR(31,451,145), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtiocr",	XSPR(31,451,160), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacr0",	XSPR(31,451,192), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmact0",	XSPR(31,451,193), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmada0",	XSPR(31,451,194), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmasa0",	XSPR(31,451,195), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacc0",	XSPR(31,451,196), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacr1",	XSPR(31,451,200), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmact1",	XSPR(31,451,201), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmada1",	XSPR(31,451,202), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmasa1",	XSPR(31,451,203), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacc1",	XSPR(31,451,204), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacr2",	XSPR(31,451,208), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmact2",	XSPR(31,451,209), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmada2",	XSPR(31,451,210), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmasa2",	XSPR(31,451,211), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacc2",	XSPR(31,451,212), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacr3",	XSPR(31,451,216), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmact3",	XSPR(31,451,217), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmada3",	XSPR(31,451,218), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmasa3",	XSPR(31,451,219), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmacc3",	XSPR(31,451,220), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdmasr",	XSPR(31,451,224), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdcr",	X(31,451), X_MASK, PPC403|BOOKE|PPCA2|PPC476, E500|TITAN, {SPR, RS}},
+{"mtdcr",	X(31,451),	X_MASK, BOOKE|PPCA2|PPC476, E500|TITAN, {SPR, RS}},
 {"mtdcr.",	XRC(31,451,1), X_MASK,	     PPCA2,	0,		{SPR, RS}},
 
 {"stvexwx",	X(31,453),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 
-{"dccci",	X(31,454), XRT_MASK, PPC403|PPC440|TITAN|PPCA2, 0,	{RAOPT, RBOPT}},
+{"dccci",	X(31,454),	XRT_MASK, PPC440|TITAN|PPCA2, 0,	{RAOPT, RBOPT}},
 {"dci",		X(31,454),	XRARB_MASK, PPCA2|PPC476, 0,		{CT}},
 
 {"divdu",	XO(31,457,0,0),	XO_MASK,     PPC64,	0,		{RT, RA, RB}},
@@ -5597,10 +5471,10 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"mtsprg1",	XSPR(31,467,273), XSPR_MASK, PPC,	0,		{RS}},
 {"mtsprg2",	XSPR(31,467,274), XSPR_MASK, PPC,	0,		{RS}},
 {"mtsprg3",	XSPR(31,467,275), XSPR_MASK, PPC,	0,		{RS}},
-{"mtsprg4",	XSPR(31,467,276), XSPR_MASK, PPC405|BOOKE, 0,		{RS}},
-{"mtsprg5",	XSPR(31,467,277), XSPR_MASK, PPC405|BOOKE, 0,		{RS}},
-{"mtsprg6",	XSPR(31,467,278), XSPR_MASK, PPC405|BOOKE, 0,		{RS}},
-{"mtsprg7",	XSPR(31,467,279), XSPR_MASK, PPC405|BOOKE, 0,		{RS}},
+{"mtsprg4",	XSPR(31,467,276), XSPR_MASK, BOOKE,	0,		{RS}},
+{"mtsprg5",	XSPR(31,467,277), XSPR_MASK, BOOKE,	0,		{RS}},
+{"mtsprg6",	XSPR(31,467,278), XSPR_MASK, BOOKE,	0,		{RS}},
+{"mtsprg7",	XSPR(31,467,279), XSPR_MASK, BOOKE,	0,		{RS}},
 {"mtasr",	XSPR(31,467,280), XSPR_MASK, PPC64,	0,		{RS}},
 {"mtear",	XSPR(31,467,282), XSPR_MASK, PPC,	TITAN,		{RS}},
 {"mttbl",	XSPR(31,467,284), XSPR_MASK, PPC,	0,		{RS}},
@@ -5664,56 +5538,21 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"mtummcr1",	XSPR(31,467,940), XSPR_MASK, PPC750,	0,		{RS}},
 {"mtupmc3",	XSPR(31,467,941), XSPR_MASK, PPC750,	0,		{RS}},
 {"mtupmc4",	XSPR(31,467,942), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtzpr",	XSPR(31,467,944), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtpid",	XSPR(31,467,945), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtrmmucr",	XSPR(31,467,946), XSPR_MASK, TITAN,	0,		{RS}},
-{"mtccr0",	XSPR(31,467,947), XSPR_MASK, PPC405|TITAN, 0,		{RS}},
-{"mtiac3",	XSPR(31,467,948), XSPR_MASK, PPC405,	0,		{RS}},
-{"mtiac4",	XSPR(31,467,949), XSPR_MASK, PPC405,	0,		{RS}},
-{"mtdvc1",	XSPR(31,467,950), XSPR_MASK, PPC405,	0,		{RS}},
-{"mtdvc2",	XSPR(31,467,951), XSPR_MASK, PPC405,	0,		{RS}},
+{"mtccr0",	XSPR(31,467,947), XSPR_MASK, TITAN,	0,		{RS}},
 {"mtmmcr0",	XSPR(31,467,952), XSPR_MASK, PPC750,	0,		{RS}},
 {"mtpmc1",	XSPR(31,467,953), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtsgr",	XSPR(31,467,953), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdcwr",	XSPR(31,467,954), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtpmc2",	XSPR(31,467,954), XSPR_MASK, PPC750,	0,		{RS}},
 {"mtsia",	XSPR(31,467,955), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtsler",	XSPR(31,467,955), XSPR_MASK, PPC405,	0,		{RS}},
 {"mtmmcr1",	XSPR(31,467,956), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtsu0r",	XSPR(31,467,956), XSPR_MASK, PPC405,	0,		{RS}},
-{"mtdbcr1",	XSPR(31,467,957), XSPR_MASK, PPC405,	0,		{RS}},
 {"mtpmc3",	XSPR(31,467,957), XSPR_MASK, PPC750,	0,		{RS}},
 {"mtpmc4",	XSPR(31,467,958), XSPR_MASK, PPC750,	0,		{RS}},
-{"mticdbdr",	XSPR(31,467,979), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtesr",	XSPR(31,467,980), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdear",	XSPR(31,467,981), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtevpr",	XSPR(31,467,982), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtcdbcr",	XSPR(31,467,983), XSPR_MASK, PPC403,	0,		{RS}},
-{"mttsr",	XSPR(31,467,984), XSPR_MASK, PPC403,	0,		{RS}},
-{"mttcr",	XSPR(31,467,986), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtpit",	XSPR(31,467,987), XSPR_MASK, PPC403,	0,		{RS}},
-{"mttbhi",	XSPR(31,467,988), XSPR_MASK, PPC403,	0,		{RS}},
-{"mttblo",	XSPR(31,467,989), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtsrr2",	XSPR(31,467,990), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtsrr3",	XSPR(31,467,991), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdbsr",	XSPR(31,467,1008), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtdbdr",	XSPR(31,467,1011), XSPR_MASK, TITAN,	0,		{RS}},
-{"mtdbcr0",	XSPR(31,467,1010), XSPR_MASK, PPC405,	0,		{RS}},
-{"mtiac1",	XSPR(31,467,1012), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtiac2",	XSPR(31,467,1013), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdac1",	XSPR(31,467,1014), XSPR_MASK, PPC403,	0,		{RS}},
-{"mtdac2",	XSPR(31,467,1015), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtl2cr",	XSPR(31,467,1017), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtdccr",	XSPR(31,467,1018), XSPR_MASK, PPC403,	0,		{RS}},
-{"mticcr",	XSPR(31,467,1019), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtictc",	XSPR(31,467,1019), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtpbl1",	XSPR(31,467,1020), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtthrm1",	XSPR(31,467,1020), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtpbu1",	XSPR(31,467,1021), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtthrm2",	XSPR(31,467,1021), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtpbl2",	XSPR(31,467,1022), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtthrm3",	XSPR(31,467,1022), XSPR_MASK, PPC750,	0,		{RS}},
-{"mtpbu2",	XSPR(31,467,1023), XSPR_MASK, PPC403,	0,		{RS}},
 {"mtspr",	X(31,467),	X_MASK,	     COM,	0,		{SPR, RS}},
 
 {"dcbi",	X(31,470),	XRT_MASK,    PPC,	0,		{RA0, RB}},
@@ -5723,7 +5562,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"dsn",		X(31,483),	XRT_MASK,    E500MC,	0,		{RA, RB}},
 
-{"dcread",	X(31,486),	X_MASK,	 PPC403|PPC440, PPCA2|PPC476,	{RT, RA0, RB}},
+{"dcread",	X(31,486),	X_MASK,	     PPC440, PPCA2|PPC476,	{RT, RA0, RB}},
 
 {"icbtls",	X(31,486),	X_MASK,	 PPCCHLK|PPC476|TITAN, 0,	{CT, RA0, RB}},
 
@@ -5757,7 +5596,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"bblels",	X(31,518),	X_MASK,	     PPCBRLK,	0,		{0}},
 
 {"lvlx",	X(31,519),	X_MASK,	     CELL,	0,		{VD, RA0, RB}},
-{"lbfcmux",	APU(31,519,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfco",	XO(31,8,1,0),	XO_MASK,     PPCCOM,	0,		{RT, RA, RB}},
 {"sfo",		XO(31,8,1,0),	XO_MASK,     PWRCOM,	0,		{RT, RA, RB}},
@@ -5810,7 +5648,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"bbelr",	X(31,550),	X_MASK,	     PPCBRLK,	0,		{0}},
 
 {"lvrx",	X(31,551),	X_MASK,	     CELL,	0,		{VD, RA0, RB}},
-{"lhfcmux",	APU(31,551,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"subfo",	XO(31,40,1,0),	XO_MASK,     PPC,	0,		{RT, RA, RB}},
 {"subo",	XO(31,40,1,0),	XO_MASK,     PPC,	0,		{RT, RB, RA}},
@@ -5833,8 +5670,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"lwat",	X(31,582),	X_MASK,	     POWER9,	0,		{RT, RA0, FC}},
 
-{"lwfcmux",	APU(31,583,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
-
 {"lxsdx",	X(31,588),	XX1_MASK,    PPCVSX,	0,		{XT6, RA0, RB}},
 
 {"mfsr",	X(31,595), XRB_MASK|(1<<20), COM,	NON32,		{RT, SR}},
@@ -5863,8 +5698,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"ldat",	X(31,614),	X_MASK,	     POWER9,	0,		{RT, RA0, FC}},
 
-{"lqfcmux",	APU(31,615,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
-
 {"nego",	XO(31,104,1,0),	XORB_MASK,   COM,	0,		{RT, RA}},
 {"nego.",	XO(31,104,1,1),	XORB_MASK,   COM,	0,		{RT, RA}},
 
@@ -5881,7 +5714,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"stbdx",	X(31,643),	X_MASK,	     E500MC,	0,		{RS, RA, RB}},
 
 {"stvlx",	X(31,647),	X_MASK,	     CELL,	0,		{VS, RA0, RB}},
-{"stbfcmux",	APU(31,647,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"stxsspx",	X(31,652),	XX1_MASK,    PPCVSX2,	0,		{XS6, RA0, RB}},
 
@@ -5921,7 +5753,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"stvfrx",	X(31,677),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 
 {"stvrx",	X(31,679),	X_MASK,	     CELL,	0,		{VS, RA0, RB}},
-{"sthfcmux",	APU(31,679,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"tendall.",	XRC(31,686,1)|(1<<25), XRTRARB_MASK, PPCHTM, 0,		{0}},
 {"tend.",	XRC(31,686,1), XRTARARB_MASK, PPCHTM,	0,		{HTM_A}},
@@ -5940,8 +5771,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stwat",	X(31,710),	X_MASK,	     POWER9,	0,		{RS, RA0, FC}},
 
-{"stwfcmux",	APU(31,711,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
-
 {"stxsdx",	X(31,716),	XX1_MASK,    PPCVSX,	0,		{XS6, RA0, RB}},
 
 {"tcheck",	X(31,718),   XRTBFRARB_MASK, PPCHTM,	0,		{BF}},
@@ -5978,8 +5807,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stdat",	X(31,742),	X_MASK,	     POWER9,	0,		{RS, RA0, FC}},
 
-{"stqfcmux",	APU(31,743,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
-
 {"subfmeo",	XO(31,232,1,0),	XORB_MASK,   PPCCOM,	0,		{RT, RA}},
 {"sfmeo",	XO(31,232,1,0),	XORB_MASK,   PWRCOM,	0,		{RT, RA}},
 {"subfmeo.",	XO(31,232,1,1),	XORB_MASK,   PPCCOM,	0,		{RT, RA}},
@@ -6004,7 +5831,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"darn",	X(31,755),	XLRAND_MASK, POWER9,	0,		{RT, LRAND}},
 
-{"dcba",	X(31,758), XRT_MASK, PPC405|PPC7450|BOOKE|PPCA2|PPC476, 0, {RA0, RB}},
+{"dcba",	X(31,758), XRT_MASK, PPC7450|BOOKE|PPCA2|PPC476, 0,	{RA0, RB}},
 {"dcbal",	XOPL(31,758,1), XRT_MASK,    E500MC,	0,		{RA0, RB}},
 
 {"stfdux",	X(31,759),	X_MASK,	     COM,	PPCEFS,		{FRS, RAS, RB}},
@@ -6018,7 +5845,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stvepxl",	X(31,775),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 {"lvlxl",	X(31,775),	X_MASK,	     CELL,	0,		{VD, RA0, RB}},
-{"ldfcmux",	APU(31,775,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"dozo",	XO(31,264,1,0),	XO_MASK,     M601,	0,		{RT, RA, RB}},
 {"dozo.",	XO(31,264,1,1),	XO_MASK,     M601,	0,		{RT, RA, RB}},
@@ -6135,7 +5961,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"paste.",	XRCL(31,902,1,1),XRT_MASK,   POWER9,	0,		{RA0, RB}},
 
 {"stvlxl",	X(31,903),	X_MASK,	     CELL,	0,		{VS, RA0, RB}},
-{"stdfcmux",	APU(31,903,0),	APU_MASK,    PPC405,	0,		{FCRT, RA, RB}},
 
 {"divdeuo",	XO(31,393,1,0),	XO_MASK,  POWER7|PPCA2,	0,		{RT, RA, RB}},
 {"divdeuo.",	XO(31,393,1,1),	XO_MASK,  POWER7|PPCA2,	0,		{RT, RA, RB}},
@@ -6147,8 +5972,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"tabort.",	XRC(31,910,1),	XRTRB_MASK,  PPCHTM,	0,		{RA}},
 
-{"tlbsx",	XRC(31,914,0),	X_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{RTO, RA0, RB}},
-{"tlbsx.",	XRC(31,914,1),	X_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{RTO, RA0, RB}},
+{"tlbsx",	XRC(31,914,0),	X_MASK, BOOKE|PPCA2|PPC476, 0,		{RTO, RA0, RB}},
+{"tlbsx.",	XRC(31,914,1),	X_MASK, BOOKE|PPCA2|PPC476, 0,		{RTO, RA0, RB}},
 
 {"slbmfee",	X(31,915),	XRLA_MASK,   POWER9,	0,		{RT, RB, A_L}},
 {"slbmfee",	X(31,915),	XRA_MASK,    PPC64,	POWER9,		{RT, RB}},
@@ -6191,9 +6016,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"treclaim.",	XRC(31,942,1),	XRTRB_MASK,  PPCHTM,	0,		{RA}},
 
-{"tlbrehi",	XTLB(31,946,0),	XTLB_MASK,   PPC403,	PPCA2,		{RT, RA}},
-{"tlbrelo",	XTLB(31,946,1),	XTLB_MASK,   PPC403,	PPCA2,		{RT, RA}},
-{"tlbre",	X(31,946),  X_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{RSO, RAOPT, SHO}},
+{"tlbre",	X(31,946),	X_MASK, BOOKE|PPCA2|PPC476, 0,		{RSO, RAOPT, SHO}},
 
 {"sthcix",	X(31,949),	X_MASK,	     POWER6,	0,		{RS, RA0, RB}},
 
@@ -6210,7 +6033,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stvflxl",	X(31,965),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 
-{"iccci",	X(31,966), XRT_MASK, PPC403|PPC440|TITAN|PPCA2, 0,	 {RAOPT, RBOPT}},
+{"iccci",	X(31,966),	XRT_MASK, PPC440|TITAN|PPCA2, 0,	{RAOPT, RBOPT}},
 {"ici",		X(31,966),	XRARB_MASK,  PPCA2|PPC476, 0,		{CT}},
 
 {"divduo",	XO(31,457,1,0),	XO_MASK,     PPC64,	0,		{RT, RA, RB}},
@@ -6222,10 +6045,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"stxvd2x",	X(31,972),	XX1_MASK,    PPCVSX,	0,		{XS6, RA0, RB}},
 {"stxvx",	X(31,972),	XX1_MASK,    POWER8,	POWER9|PPCVSX3,	{XS6, RA0, RB}},
 
-{"tlbld",	X(31,978),	XRTRA_MASK,  PPC, PPC403|BOOKE|PPCA2|PPC476, {RB}},
-{"tlbwehi",	XTLB(31,978,0),	XTLB_MASK,   PPC403,	0,		{RT, RA}},
-{"tlbwelo",	XTLB(31,978,1),	XTLB_MASK,   PPC403,	0,		{RT, RA}},
-{"tlbwe",	X(31,978),  X_MASK, PPC403|BOOKE|PPCA2|PPC476, 0,	{RSO, RAOPT, SHO}},
+{"tlbld",	X(31,978),	XRTRA_MASK,  PPC, BOOKE|PPCA2|PPC476,	{RB}},
+{"tlbwe",	X(31,978),	X_MASK, BOOKE|PPCA2|PPC476, 0,		{RSO, RAOPT, SHO}},
 
 {"slbfee.",	XRC(31,979,1),	XRA_MASK,    POWER6,	0,		{RT, RB}},
 
@@ -6242,7 +6063,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 
 {"stvswxl",	X(31,997),	X_MASK,	     PPCVEC2,	0,		{VS, RA0, RB}},
 
-{"icread",	X(31,998),     XRT_MASK, PPC403|PPC440|PPC476|TITAN, 0,	{RA0, RB}},
+{"icread",	X(31,998),     XRT_MASK, PPC440|PPC476|TITAN, 0,	{RA0, RB}},
 
 {"nabso",	XO(31,488,1,0),	XORB_MASK,   M601,	0,		{RT, RA}},
 {"nabso.",	XO(31,488,1,1),	XORB_MASK,   M601,	0,		{RT, RA}},
diff --git a/arch/powerpc/xmon/ppc.h b/arch/powerpc/xmon/ppc.h
index d00f33dcf192..111a1f95704c 100644
--- a/arch/powerpc/xmon/ppc.h
+++ b/arch/powerpc/xmon/ppc.h
@@ -104,9 +104,6 @@ extern const int vle_num_opcodes;
 /* Opcode is supported by Altivec Vector Unit */
 #define PPC_OPCODE_ALTIVEC	     0x100
 
-/* Opcode is supported by PowerPC 403 processor.  */
-#define PPC_OPCODE_403		     0x200
-
 /* Opcode is supported by PowerPC BookE processor.  */
 #define PPC_OPCODE_BOOKE	     0x400
 
@@ -158,9 +155,6 @@ extern const int vle_num_opcodes;
 /* Opcode is supported by Power E500MC */
 #define PPC_OPCODE_E500MC        0x4000000
 
-/* Opcode is supported by PowerPC 405 processor.  */
-#define PPC_OPCODE_405		 0x8000000
-
 /* Opcode is supported by Vector-Scalar (VSX) Unit */
 #define PPC_OPCODE_VSX		0x10000000
 
-- 
2.25.0



