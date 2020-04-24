Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A61B6EB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:13:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497lkn4hdYzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:13:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfB6VRfzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:22 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O72HnC030774
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc6nj8r-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 24 Apr 2020 08:08:53 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Apr 2020 08:08:51 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03O79Ebr48300266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:14 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AF67A4051;
 Fri, 24 Apr 2020 07:09:14 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C723A4040;
 Fri, 24 Apr 2020 07:09:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:12 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 2/7] powerpc/ppc-opcode: move ppc instruction encoding
 from test_emulate_step
Date: Fri, 24 Apr 2020 12:38:48 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042407-0012-0000-0000-000003AA41DE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042407-0013-0000-0000-000021E798E6
Message-Id: <20200424070853.443969-3-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=688 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 suspectscore=1
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Few ppc instructions are encoded in test_emulate_step.c, consolidate
them and use it from ppc-opcode.h

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  35 ++++++
 arch/powerpc/lib/test_emulate_step.c  | 155 ++++++++++----------------
 2 files changed, 91 insertions(+), 99 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index c5ec2ea283f1..2ae0afc5c2bb 100644
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
@@ -602,6 +605,38 @@
 						___PPC_RT(vrt) | \
 						___PPC_RA(vra) | \
 						___PPC_RB(vrb) | __PPC_RC21)
+#define PPC_RAW_LD(r, base, i)		(PPC_INST_LD | ___PPC_RT(r) | \
+						___PPC_RA(base) | IMM_DS(i))
+#define PPC_RAW_LWZ(r, base, i)		(PPC_INST_LWZ | ___PPC_RT(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_LWZX(t, a, b)		(PPC_INST_LWZX | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STD(r, base, i)		(PPC_INST_STD | ___PPC_RS(r) | \
+						___PPC_RA(base) | IMM_DS(i))
+#define PPC_RAW_STDCX(s, a, b)		(PPC_INST_STDCX | ___PPC_RS(s) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LFSX(t, a, b)		(PPC_INST_LFSX | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STFSX(s, a, b)		(PPC_INST_STFSX | ___PPC_RS(s) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LFDX(t, a, b)		(PPC_INST_LFDX | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STFDX(s, a, b)		(PPC_INST_STFDX | ___PPC_RS(s) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_LVX(t, a, b)		(PPC_INST_LVX | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_STVX(s, a, b)		(PPC_INST_STVX | ___PPC_RS(s) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADD(t, a, b)		(PPC_INST_ADD | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b) | \
+						0x1)
+#define PPC_RAW_ADDC(t, a, b)		(PPC_INST_ADDC | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) | \
+						___PPC_RA(a) | ___PPC_RB(b) | \
+						0x1)
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 53df4146dd32..7a703bec3061 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -12,49 +12,6 @@
 #include <asm/ppc-opcode.h>
 #include <asm/code-patching.h>
 
-#define IMM_L(i)		((uintptr_t)(i) & 0xffff)
-#define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
-
-/*
- * Defined with TEST_ prefix so it does not conflict with other
- * definitions.
- */
-#define TEST_LD(r, base, i)	(PPC_INST_LD | ___PPC_RT(r) |		\
-					___PPC_RA(base) | IMM_DS(i))
-#define TEST_LWZ(r, base, i)	(PPC_INST_LWZ | ___PPC_RT(r) |		\
-					___PPC_RA(base) | IMM_L(i))
-#define TEST_LWZX(t, a, b)	(PPC_INST_LWZX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STD(r, base, i)	(PPC_INST_STD | ___PPC_RS(r) |		\
-					___PPC_RA(base) | IMM_DS(i))
-#define TEST_LDARX(t, a, b, eh)	(PPC_INST_LDARX | ___PPC_RT(t) |	\
-					___PPC_RA(a) | ___PPC_RB(b) |	\
-					__PPC_EH(eh))
-#define TEST_STDCX(s, a, b)	(PPC_INST_STDCX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFSX(t, a, b)	(PPC_INST_LFSX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFSX(s, a, b)	(PPC_INST_STFSX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LFDX(t, a, b)	(PPC_INST_LFDX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STFDX(s, a, b)	(PPC_INST_STFDX | ___PPC_RS(s) |	\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LVX(t, a, b)	(PPC_INST_LVX | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_STVX(s, a, b)	(PPC_INST_STVX | ___PPC_RS(s) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_LXVD2X(s, a, b)	(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_STXVD2X(s, a, b)	(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##b))
-#define TEST_ADD(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADD_DOT(t, a, b)	(PPC_INST_ADD | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
-#define TEST_ADDC(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b))
-#define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
-					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
-
 #define MAX_SUBTESTS	16
 
 #define IGNORE_GPR(n)	(0x1UL << (n))
@@ -104,7 +61,7 @@ static void __init test_ld(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* ld r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LD(5, 3, 0));
+	stepped = emulate_step(&regs, PPC_RAW_LD(5, 3, 0));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("ld", "PASS");
@@ -122,7 +79,7 @@ static void __init test_lwz(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* lwz r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LWZ(5, 3, 0));
+	stepped = emulate_step(&regs, PPC_RAW_LWZ(5, 3, 0));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("lwz", "PASS");
@@ -142,7 +99,7 @@ static void __init test_lwzx(void)
 	regs.gpr[5] = 0x8765;
 
 	/* lwzx r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LWZX(5, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_LWZX(5, 3, 4));
 	if (stepped == 1 && regs.gpr[5] == a[2])
 		show_result("lwzx", "PASS");
 	else
@@ -160,7 +117,7 @@ static void __init test_std(void)
 	regs.gpr[5] = 0x5678;
 
 	/* std r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
+	stepped = emulate_step(&regs, PPC_RAW_STD(5, 3, 0));
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("std", "PASS");
 	else
@@ -185,7 +142,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x5678;
 
 	/* ldarx r5, r3, r4, 0 */
-	stepped = emulate_step(&regs, TEST_LDARX(5, 3, 4, 0));
+	stepped = emulate_step(&regs, PPC_RAW_LDARX(5, 3, 4, 0));
 
 	/*
 	 * Don't touch 'a' here. Touching 'a' can do Load/store
@@ -203,7 +160,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x9ABC;
 
 	/* stdcx. r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STDCX(5, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_STDCX(5, 3, 4));
 
 	/*
 	 * Two possible scenarios that indicates successful emulation
@@ -243,7 +200,7 @@ static void __init test_lfsx_stfsx(void)
 	regs.gpr[4] = 0;
 
 	/* lfsx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFSX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_LFSX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lfsx", "PASS");
@@ -256,7 +213,7 @@ static void __init test_lfsx_stfsx(void)
 	c.a = 678.91;
 
 	/* stfsx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFSX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_STFSX(10, 3, 4));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfsx", "PASS");
@@ -286,7 +243,7 @@ static void __init test_lfdx_stfdx(void)
 	regs.gpr[4] = 0;
 
 	/* lfdx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFDX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_LFDX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lfdx", "PASS");
@@ -299,7 +256,7 @@ static void __init test_lfdx_stfdx(void)
 	c.a = 987654.32;
 
 	/* stfdx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFDX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_STFDX(10, 3, 4));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfdx", "PASS");
@@ -345,7 +302,7 @@ static void __init test_lvx_stvx(void)
 	regs.gpr[4] = 0;
 
 	/* lvx vrt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LVX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_LVX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lvx", "PASS");
@@ -361,7 +318,7 @@ static void __init test_lvx_stvx(void)
 	c.b[3] = 498532;
 
 	/* stvx vrs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STVX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_STVX(10, 3, 4));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3])
@@ -402,7 +359,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	regs.gpr[4] = 0;
 
 	/* lxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_LXVD2X(39, R3, R4));
 
 	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
 		show_result("lxvd2x", "PASS");
@@ -422,7 +379,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	c.b[3] = 4;
 
 	/* stxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, PPC_RAW_STXVD2X(39, R3, R4));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
@@ -484,7 +441,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -492,7 +449,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -500,7 +457,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -508,7 +465,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -516,7 +473,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -524,7 +481,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -532,7 +489,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -540,7 +497,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -548,7 +505,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -556,7 +513,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_RAW_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -570,7 +527,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -578,7 +535,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -587,7 +544,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -595,7 +552,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -603,7 +560,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -611,7 +568,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -619,7 +576,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -627,7 +584,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -635,7 +592,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -643,7 +600,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -656,7 +613,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -664,7 +621,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -672,7 +629,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -680,7 +637,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -688,7 +645,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -696,7 +653,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -704,7 +661,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -712,7 +669,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -720,7 +677,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -728,7 +685,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -736,7 +693,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_RAW_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
@@ -750,7 +707,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -758,7 +715,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -767,7 +724,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -775,7 +732,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -783,7 +740,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -791,7 +748,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -799,7 +756,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -807,7 +764,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -815,7 +772,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -823,7 +780,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -831,7 +788,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_RAW_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
-- 
2.24.1

