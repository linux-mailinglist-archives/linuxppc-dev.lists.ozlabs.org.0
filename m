Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37833B9198
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 14:27:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFyBx0047z3bkD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 22:27:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=183.3.255.186; helo=qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Thu, 01 Jul 2021 22:26:45 AEST
Received: from qq.com (smtpbg565.qq.com [183.3.255.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFyBY4Nz5z2xKM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 22:26:45 +1000 (AEST)
X-QQ-mid: bizesmtp46t1625142286tlbg4c9f
Received: from localhost.localdomain (unknown [182.148.13.55])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 01 Jul 2021 20:24:45 +0800 (CST)
X-QQ-SSF: 0100000000800030B000B00A0000000
X-QQ-FEAT: La+0rDrBjHXya7Xb/FWvTcJk4ETmtCJGFWM8dM4V/eUPmIigor0/jRDuN+QXI
 lWYwNRcUfOG7LBdVl0UTBcmkDH2hScWdrO1s1NBezshrh2L9GBtJaRoXocb0lPG39K9lctk
 K/6IRMeOgDfS2HmslR/DDCyF8DxoBsQF1L8Uakt8qBCbLi4eg0Gd8l2U9GdKHg5qMSXjNgR
 k95fUMvaIDPPEm9rinqSb8TCim4q/f4EP8XUuH4Ok9NevqusJMvWV2J0RGTxDN4EXbhpgMf
 80ZciU+Le1T02RB/0XoxnwvatG/Td1rACLtj3no4Dikz2bCZxacCM0FdrReEqVdCLrkHNjX
 3P0wbAT
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/xmon: Use ARRAY_SIZE
Date: Thu,  1 Jul 2021 20:24:22 +0800
Message-Id: <20210701122422.58863-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ARRAY_SIZE macro is more compact and formal to get array size in
linux kernel source. In addition, it is more readable for kernel
developpers. Thus, we can replace all sizeof(arr)/sizeof(arr[0]) with
ARRAY_SIZE.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/xmon/ppc-opc.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index dfb80810b16c..e1d292fe6c6e 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -954,8 +954,7 @@ const struct powerpc_operand powerpc_operands[] =
   { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
 };
 
-const unsigned int num_powerpc_operands = (sizeof (powerpc_operands)
-					   / sizeof (powerpc_operands[0]));
+const unsigned int num_powerpc_operands = ARRAY_SIZE(powerpc_operands);
 
 /* The functions used to insert and extract complicated operands.  */
 
@@ -6968,9 +6967,8 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"fcfidu.",	XRC(63,974,1),	XRA_MASK, POWER7|PPCA2,	PPCVLE,		{FRT, FRB}},
 };
 
-const int powerpc_num_opcodes =
-  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
-
+const int powerpc_num_opcodes = ARRAY_SIZE(powerpc_opcodes);
+
 /* The VLE opcode table.
 
    The format of this opcode table is the same as the main opcode table.  */
@@ -7207,9 +7205,8 @@ const struct powerpc_opcode vle_opcodes[] = {
 {"se_bl",	BD8(58,0,1),	BD8_MASK,	PPCVLE,	0,		{B8}},
 };
 
-const int vle_num_opcodes =
-  sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
-
+const int vle_num_opcodes = ARRAY_SIZE(vle_opcodes);
+
 /* The macro table.  This is only used by the assembler.  */
 
 /* The expressions of the form (-x ! 31) & (x | 31) have the value 0
@@ -7276,5 +7273,4 @@ const struct powerpc_macro powerpc_macros[] = {
 {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
 };
 
-const int powerpc_num_macros =
-  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
+const int powerpc_num_macros = ARRAY_SIZE(powerpc_macros);
-- 
2.31.1



