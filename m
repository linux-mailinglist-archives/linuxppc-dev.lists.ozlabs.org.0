Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 270D120723E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 13:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sLj86N1kzDqgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 21:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sLZK1TK2zDql8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 21:31:20 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OB4iap054205; Wed, 24 Jun 2020 07:31:16 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwykncf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 07:31:15 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OBU53v027408;
 Wed, 24 Jun 2020 11:31:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 31uusk094a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 11:31:13 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OBVAjL54132744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 11:31:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC03C4C059;
 Wed, 24 Jun 2020 11:31:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 698434C058;
 Wed, 24 Jun 2020 11:31:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.241])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 11:31:06 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/6] powerpc/ppc-opcode: move ppc instruction encoding from
 test_emulate_step
Date: Wed, 24 Jun 2020 17:00:34 +0530
Message-Id: <20200624113038.908074-3-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200624113038.908074-1-bala24@linux.ibm.com>
References: <20200624113038.908074-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_05:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=1 impostorscore=0 cotscore=-2147483648 adultscore=0
 mlxlogscore=739 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240077
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Few ppc instructions are encoded in test_emulate_step.c, consolidate
them and use it from ppc-opcode.h

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Acked-by: Sandipan Das <sandipan@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  18 +++
 arch/powerpc/lib/test_emulate_step.c  | 155 ++++++++++----------------
 2 files changed, 74 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 360dc7d03a9b..c7d81bc473f0 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -76,6 +76,9 @@
 #define	__REGA0_R30	30
 #define	__REGA0_R31	31
 
+#define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
+#define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
+
 /* opcode and xopcode for instructions */
 #define OP_TRAP 3
 #define OP_TRAP_64 2
@@ -512,6 +515,21 @@
 	(PPC_INST_VCMPEQUD | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC21)
 #define PPC_RAW_VCMPEQUB_RC(vrt, vra, vrb) \
 	(PPC_INST_VCMPEQUB | ___PPC_RT(vrt) | ___PPC_RA(vra) | ___PPC_RB(vrb) | __PPC_RC21)
+#define PPC_RAW_LD(r, base, i)		(PPC_INST_LD | ___PPC_RT(r) | ___PPC_RA(base) | IMM_DS(i))
+#define PPC_RAW_LWZ(r, base, i)		(PPC_INST_LWZ | ___PPC_RT(r) | ___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_LWZX(t, a, b)		(PPC_INST_LWZX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STD(r, base, i)		(PPC_INST_STD | ___PPC_RS(r) | ___PPC_RA(base) | IMM_DS(i))
+#define PPC_RAW_STDCX(s, a, b)		(PPC_INST_STDCX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LFSX(t, a, b)		(PPC_INST_LFSX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STFSX(s, a, b)		(PPC_INST_STFSX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LFDX(t, a, b)		(PPC_INST_LFDX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STFDX(s, a, b)		(PPC_INST_STFDX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LVX(t, a, b)		(PPC_INST_LVX | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STVX(s, a, b)		(PPC_INST_STVX | ___PPC_RS(s) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADD(t, a, b)		(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+#define PPC_RAW_ADDC(t, a, b)		(PPC_INST_ADDC | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 46af80279ebc..988c734e7370 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -13,49 +13,6 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>
 
-#define IMM_L(i)		((uintptr_t)(i) & 0xffff)
-#define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
-
-/*
- * Defined with TEST_ prefix so it does not conflict with other
- * definitions.
- */
-#define TEST_LD(r, base, i)	ppc_inst(PPC_INST_LD | ___PPC_RT(r) |		\
-					___PPC_RA(base) | IMM_DS(i))
-#define TEST_LWZ(r, base, i)	ppc_inst(PPC_INST_LWZ | ___PPC_RT(r) |		\
-					___PPC_RA(base) | IMM_L(i))
-#define TEST_LWZX(t, a, b)	ppc_inst(PPC_INST_LWZX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STD(r, base, i)	ppc_inst(PPC_INST_STD | ___PPC_RS(r) |		\
-					___PPC_RA(base) | IMM_DS(i))
-#define TEST_LDARX(t, a, b, eh)	ppc_inst(PPC_INST_LDARX | ___PPC_RT(t) |	\
-					___PPC_RA(a) | ___PPC_RB(b) |	\
-					__PPC_EH(eh))
-#define TEST_STDCX(s, a, b)	ppc_inst(PPC_INST_STDCX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFSX(t, a, b)	ppc_inst(PPC_INST_LFSX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFSX(s, a, b)	ppc_inst(PPC_INST_STFSX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFDX(t, a, b)	ppc_inst(PPC_INST_LFDX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFDX(s, a, b)	ppc_inst(PPC_INST_STFDX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LVX(t, a, b)	ppc_inst(PPC_INST_LVX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STVX(s, a, b)	ppc_inst(PPC_INST_STVX | ___PPC_RS(s) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LXVD2X(s, a, b)	ppc_inst(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_STXVD2X(s, a, b)	ppc_inst(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_ADD(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADD_DOT(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
-#define TEST_ADDC(t, a, b)	ppc_inst(PPC_INST_ADDC | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADDC_DOT(t, a, b)	ppc_inst(PPC_INST_ADDC | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
-
 #define MAX_SUBTESTS	16
 
 #define IGNORE_GPR(n)	(0x1UL << (n))
@@ -105,7 +62,7 @@ static void __init test_ld(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* ld r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LD(5, 3, 0));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LD(5, 3, 0)));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("ld", "PASS");
@@ -123,7 +80,7 @@ static void __init test_lwz(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* lwz r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LWZ(5, 3, 0));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LWZ(5, 3, 0)));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("lwz", "PASS");
@@ -143,7 +100,7 @@ static void __init test_lwzx(void)
 	regs.gpr[5] = 0x8765;
 
 	/* lwzx r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LWZX(5, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LWZX(5, 3, 4)));
 	if (stepped == 1 && regs.gpr[5] == a[2])
 		show_result("lwzx", "PASS");
 	else
@@ -161,7 +118,7 @@ static void __init test_std(void)
 	regs.gpr[5] = 0x5678;
 
 	/* std r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STD(5, 3, 0)));
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("std", "PASS");
 	else
@@ -186,7 +143,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x5678;
 
 	/* ldarx r5, r3, r4, 0 */
-	stepped = emulate_step(&regs, TEST_LDARX(5, 3, 4, 0));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LDARX(5, 3, 4, 0)));
 
 	/*
 	 * Don't touch 'a' here. Touching 'a' can do Load/store
@@ -204,7 +161,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x9ABC;
 
 	/* stdcx. r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STDCX(5, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STDCX(5, 3, 4)));
 
 	/*
 	 * Two possible scenarios that indicates successful emulation
@@ -244,7 +201,7 @@ static void __init test_lfsx_stfsx(void)
 	regs.gpr[4] = 0;
 
 	/* lfsx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFSX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LFSX(10, 3, 4)));
 
 	if (stepped == 1)
 		show_result("lfsx", "PASS");
@@ -257,7 +214,7 @@ static void __init test_lfsx_stfsx(void)
 	c.a = 678.91;
 
 	/* stfsx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFSX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STFSX(10, 3, 4)));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfsx", "PASS");
@@ -287,7 +244,7 @@ static void __init test_lfdx_stfdx(void)
 	regs.gpr[4] = 0;
 
 	/* lfdx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFDX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LFDX(10, 3, 4)));
 
 	if (stepped == 1)
 		show_result("lfdx", "PASS");
@@ -300,7 +257,7 @@ static void __init test_lfdx_stfdx(void)
 	c.a = 987654.32;
 
 	/* stfdx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFDX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STFDX(10, 3, 4)));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfdx", "PASS");
@@ -346,7 +303,7 @@ static void __init test_lvx_stvx(void)
 	regs.gpr[4] = 0;
 
 	/* lvx vrt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LVX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LVX(10, 3, 4)));
 
 	if (stepped == 1)
 		show_result("lvx", "PASS");
@@ -362,7 +319,7 @@ static void __init test_lvx_stvx(void)
 	c.b[3] = 498532;
 
 	/* stvx vrs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STVX(10, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STVX(10, 3, 4)));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3])
@@ -403,7 +360,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	regs.gpr[4] = 0;
 
 	/* lxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LXVD2X(39, R3, R4)));
 
 	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
 		show_result("lxvd2x", "PASS");
@@ -423,7 +380,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	c.b[3] = 4;
 
 	/* stxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STXVD2X(39, R3, R4)));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
@@ -485,7 +442,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -493,7 +450,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -501,7 +458,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -509,7 +466,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -517,7 +474,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -525,7 +482,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -533,7 +490,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -541,7 +498,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -549,7 +506,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -557,7 +514,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -571,7 +528,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -579,7 +536,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -588,7 +545,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -596,7 +553,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -604,7 +561,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -612,7 +569,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -620,7 +577,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -628,7 +585,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -636,7 +593,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -644,7 +601,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADD_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -657,7 +614,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -665,7 +622,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -673,7 +630,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -681,7 +638,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -689,7 +646,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -697,7 +654,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -705,7 +662,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -713,7 +670,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -721,7 +678,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -729,7 +686,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -737,7 +694,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
@@ -751,7 +708,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -759,7 +716,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -768,7 +725,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -776,7 +733,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -784,7 +741,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -792,7 +749,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -800,7 +757,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -808,7 +765,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -816,7 +773,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -824,7 +781,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -832,7 +789,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = ppc_inst(PPC_RAW_ADDC_DOT(20, 21, 22)),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
-- 
2.24.1

