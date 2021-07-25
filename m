Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DE3D4E35
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jul 2021 17:04:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GXmYX4S5Dz3bSs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 01:04:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cdjrlc.com (client-ip=59.36.128.82; helo=smtpbg604.qq.com;
 envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 147 seconds by postgrey-1.36 at boromir;
 Mon, 26 Jul 2021 01:04:10 AEST
Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GXmY60tL9z2y0C
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 01:04:09 +1000 (AEST)
X-QQ-mid: bizesmtp46t1627225276tfkrsdia
Received: from localhost.localdomain (unknown [125.70.163.19])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 25 Jul 2021 23:01:15 +0800 (CST)
X-QQ-SSF: 0100000000800090B000B00A0000000
X-QQ-FEAT: aHJ2PTLZoXduDiSx0SWj5iWJ2RObJkhtK6JCKNqGe2C5FFUhuDMIRPxpDSsDP
 lPG7J8d0bTcccUyCrJa4rcUa3tZoigHgPUYzXldQBbJb1zr4SoitsuhRIRCIC/1rNd5lHyC
 bBIg9BoSz0M5Cv2ZILeQWN4As2uG9D7i1mgMj/3hspTF3XPBG1cRbuOiXXjaUW3dpiqMpru
 E97CP9XI18S5NX53te9eKZy/SC4007pFTCuXC847JmcE0CIf7UQGKU6BBTHNp2w/pa6wNAW
 561GL5vYORjDeRmV5hG9M+EZqDVw5WHtaBEAyFTZU6NKovKZD5y55Ue+EjmnYrTCFOMPqo1
 c2KqO8PLJGb3HWL/NfhcgM9mqBezg==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/xmon: use ARRAY_SIZE
Date: Sun, 25 Jul 2021 23:01:07 +0800
Message-Id: <20210725150107.27865-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam4
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

The ARRAY_SIZE is the macro definition of sizeof(a)/sizeof(a[0]) and
it is more compact and formal to get a array size.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/xmon/ppc-opc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/xmon/ppc-opc.c b/arch/powerpc/xmon/ppc-opc.c
index dfb80810b16c..6ca4cd26caef 100644
--- a/arch/powerpc/xmon/ppc-opc.c
+++ b/arch/powerpc/xmon/ppc-opc.c
@@ -954,8 +954,7 @@ const struct powerpc_operand powerpc_operands[] =
   { 0xff, 11, NULL, NULL, PPC_OPERAND_SIGNOPT },
 };
 
-const unsigned int num_powerpc_operands = (sizeof (powerpc_operands)
-					   / sizeof (powerpc_operands[0]));
+const unsigned int num_powerpc_operands = ARRAY_SIZE(powerpc_operands);
 
 /* The functions used to insert and extract complicated operands.  */
 
@@ -6968,8 +6967,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
 {"fcfidu.",	XRC(63,974,1),	XRA_MASK, POWER7|PPCA2,	PPCVLE,		{FRT, FRB}},
 };
 
-const int powerpc_num_opcodes =
-  sizeof (powerpc_opcodes) / sizeof (powerpc_opcodes[0]);
+const int powerpc_num_opcodes = ARRAY_SIZE(powerpc_opcodes);
 
 /* The VLE opcode table.
 
@@ -7207,8 +7205,7 @@ const struct powerpc_opcode vle_opcodes[] = {
 {"se_bl",	BD8(58,0,1),	BD8_MASK,	PPCVLE,	0,		{B8}},
 };
 
-const int vle_num_opcodes =
-  sizeof (vle_opcodes) / sizeof (vle_opcodes[0]);
+const int vle_num_opcodes = ARRAY_SIZE(vle_opcodes);
 
 /* The macro table.  This is only used by the assembler.  */
 
@@ -7276,5 +7273,4 @@ const struct powerpc_macro powerpc_macros[] = {
 {"e_clrlslwi",4, PPCVLE, "e_rlwinm %0,%1,%3,(%2)-(%3),31-(%3)"},
 };
 
-const int powerpc_num_macros =
-  sizeof (powerpc_macros) / sizeof (powerpc_macros[0]);
+const int powerpc_num_macros = ARRAY_SIZE(powerpc_macros);
-- 
2.32.0

