Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C618C8F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 09:28:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kH3Z3gdhzDrND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 19:28:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kGvQ0tDbzDrbB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 19:21:21 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K83kl3104111
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:19 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7wf29mj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:21:19 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 20 Mar 2020 08:21:17 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 08:21:14 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K8LD6862849226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 08:21:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31A3D11C050;
 Fri, 20 Mar 2020 08:21:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 871D911C05C;
 Fri, 20 Mar 2020 08:21:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.87.168])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 08:21:07 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH 3/4] powerpc ppc-opcode: move ppc instuction encoding from
 test_emulate_step
Date: Fri, 20 Mar 2020 13:48:36 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200320081837.1016820-1-bala24@linux.ibm.com>
References: <20200320081837.1016820-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032008-0020-0000-0000-000003B7A2FD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032008-0021-0000-0000-000022101488
Message-Id: <20200320081837.1016820-4-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 bulkscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=488 impostorscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200032
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

Few ppc instructions are encoded in test_emulate_step.c, consolidate them to
ppc-opcode.h, fix redefintion errors in bpf_jit caused due to this consolidation.
Reuse the macros from ppc-opcode.h

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  34 ++++++
 arch/powerpc/lib/test_emulate_step.c  | 155 ++++++++++----------------
 arch/powerpc/net/bpf_jit.h            |   8 --
 arch/powerpc/net/bpf_jit32.h          |  10 +-
 arch/powerpc/net/bpf_jit64.h          |   4 +-
 arch/powerpc/net/bpf_jit_comp.c       |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c     |  14 +--
 7 files changed, 105 insertions(+), 122 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ea5e0f864b20..2ed8a285f1ec 100644
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
@@ -614,6 +617,37 @@
 						___PPC_RA(vra) | \
 						___PPC_RB(vrb) | __PPC_RC21)
 
+#define PPC_ENCODE_LD(r, base, i)     (PPC_INST_LD | ___PPC_RT(r) |           \
+				___PPC_RA(base) | IMM_DS(i))
+#define PPC_ENCODE_LWZ(r, base, i)    (PPC_INST_LWZ | ___PPC_RT(r) |          \
+				___PPC_RA(base) | IMM_L(i))
+#define PPC_ENCODE_LWZX(t, a, b)      (PPC_INST_LWZX | ___PPC_RT(t) |         \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_STD(r, base, i)    (PPC_INST_STD | ___PPC_RS(r) |          \
+				___PPC_RA(base) | IMM_DS(i))
+#define PPC_ENCODE_STDCX(s, a, b)     (PPC_INST_STDCX | ___PPC_RS(s) |        \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_LFSX(t, a, b)      (PPC_INST_LFSX | ___PPC_RT(t) |         \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_STFSX(s, a, b)     (PPC_INST_STFSX | ___PPC_RS(s) |        \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_LFDX(t, a, b)      (PPC_INST_LFDX | ___PPC_RT(t) |         \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_STFDX(s, a, b)     (PPC_INST_STFDX | ___PPC_RS(s) |        \
+				 ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_LVX(t, a, b)       (PPC_INST_LVX | ___PPC_RT(t) |          \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_STVX(s, a, b)      (PPC_INST_STVX | ___PPC_RS(s) |         \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_ADD(t, a, b)       (PPC_INST_ADD | ___PPC_RT(t) |          \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_ADD_DOT(t, a, b)   (PPC_INST_ADD | ___PPC_RT(t) |          \
+				___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+#define PPC_ENCODE_ADDC(t, a, b)      (PPC_INST_ADDC | ___PPC_RT(t) |         \
+				___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_ENCODE_ADDC_DOT(t, a, b)  (PPC_INST_ADDC | ___PPC_RT(t) |         \
+				___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+
 #define PPC_CP_ABORT        stringify_in_c(.long PPC_ENCODE_CP_ABORT)
 #define PPC_COPY(a, b)      stringify_in_c(.long PPC_ENCODE_COPY(a, b))
 #define PPC_DARN(t, l)      stringify_in_c(.long PPC_ENCODE_DARN(t, l))
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 53df4146dd32..45b485edfee1 100644
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
+	stepped = emulate_step(&regs, PPC_ENCODE_LD(5, 3, 0));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("ld", "PASS");
@@ -122,7 +79,7 @@ static void __init test_lwz(void)
 	regs.gpr[3] = (unsigned long) &a;
 
 	/* lwz r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_LWZ(5, 3, 0));
+	stepped = emulate_step(&regs, PPC_ENCODE_LWZ(5, 3, 0));
 
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("lwz", "PASS");
@@ -142,7 +99,7 @@ static void __init test_lwzx(void)
 	regs.gpr[5] = 0x8765;
 
 	/* lwzx r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LWZX(5, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_LWZX(5, 3, 4));
 	if (stepped == 1 && regs.gpr[5] == a[2])
 		show_result("lwzx", "PASS");
 	else
@@ -160,7 +117,7 @@ static void __init test_std(void)
 	regs.gpr[5] = 0x5678;
 
 	/* std r5, 0(r3) */
-	stepped = emulate_step(&regs, TEST_STD(5, 3, 0));
+	stepped = emulate_step(&regs, PPC_ENCODE_STD(5, 3, 0));
 	if (stepped == 1 && regs.gpr[5] == a)
 		show_result("std", "PASS");
 	else
@@ -185,7 +142,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x5678;
 
 	/* ldarx r5, r3, r4, 0 */
-	stepped = emulate_step(&regs, TEST_LDARX(5, 3, 4, 0));
+	stepped = emulate_step(&regs, PPC_ENCODE_LDARX(5, 3, 4, 0));
 
 	/*
 	 * Don't touch 'a' here. Touching 'a' can do Load/store
@@ -203,7 +160,7 @@ static void __init test_ldarx_stdcx(void)
 	regs.gpr[5] = 0x9ABC;
 
 	/* stdcx. r5, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STDCX(5, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_STDCX(5, 3, 4));
 
 	/*
 	 * Two possible scenarios that indicates successful emulation
@@ -243,7 +200,7 @@ static void __init test_lfsx_stfsx(void)
 	regs.gpr[4] = 0;
 
 	/* lfsx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFSX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_LFSX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lfsx", "PASS");
@@ -256,7 +213,7 @@ static void __init test_lfsx_stfsx(void)
 	c.a = 678.91;
 
 	/* stfsx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFSX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_STFSX(10, 3, 4));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfsx", "PASS");
@@ -286,7 +243,7 @@ static void __init test_lfdx_stfdx(void)
 	regs.gpr[4] = 0;
 
 	/* lfdx frt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LFDX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_LFDX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lfdx", "PASS");
@@ -299,7 +256,7 @@ static void __init test_lfdx_stfdx(void)
 	c.a = 987654.32;
 
 	/* stfdx frs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STFDX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_STFDX(10, 3, 4));
 
 	if (stepped == 1 && c.b == cached_b)
 		show_result("stfdx", "PASS");
@@ -345,7 +302,7 @@ static void __init test_lvx_stvx(void)
 	regs.gpr[4] = 0;
 
 	/* lvx vrt10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LVX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_LVX(10, 3, 4));
 
 	if (stepped == 1)
 		show_result("lvx", "PASS");
@@ -361,7 +318,7 @@ static void __init test_lvx_stvx(void)
 	c.b[3] = 498532;
 
 	/* stvx vrs10, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STVX(10, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_STVX(10, 3, 4));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3])
@@ -402,7 +359,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	regs.gpr[4] = 0;
 
 	/* lxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_LXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_LXVD2X(39, R3, R4));
 
 	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
 		show_result("lxvd2x", "PASS");
@@ -422,7 +379,7 @@ static void __init test_lxvd2x_stxvd2x(void)
 	c.b[3] = 4;
 
 	/* stxvd2x vsr39, r3, r4 */
-	stepped = emulate_step(&regs, TEST_STXVD2X(39, 3, 4));
+	stepped = emulate_step(&regs, PPC_ENCODE_STXVD2X(39, R3, R4));
 
 	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
 	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
@@ -484,7 +441,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -492,7 +449,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -500,7 +457,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -508,7 +465,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -516,7 +473,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -524,7 +481,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -532,7 +489,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -540,7 +497,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -548,7 +505,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -556,7 +513,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD(20, 21, 22),
+				.instr = PPC_ENCODE_ADD(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -570,7 +527,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -578,7 +535,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -587,7 +544,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -595,7 +552,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -603,7 +560,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -611,7 +568,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -619,7 +576,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -627,7 +584,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -635,7 +592,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -643,7 +600,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADD_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADD_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -656,7 +613,7 @@ static struct compute_test compute_tests[] = {
 		.subtests = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -664,7 +621,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -672,7 +629,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -680,7 +637,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -688,7 +645,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -696,7 +653,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -704,7 +661,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -712,7 +669,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -720,7 +677,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -728,7 +685,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -736,7 +693,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
@@ -750,7 +707,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MIN",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MIN,
@@ -758,7 +715,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN, RB = LONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN,
 					.gpr[22] = LONG_MAX,
@@ -767,7 +724,7 @@ static struct compute_test compute_tests[] = {
 			{
 				.descr = "RA = LONG_MAX, RB = LONG_MAX",
 				.flags = IGNORE_CCR,
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MAX,
 					.gpr[22] = LONG_MAX,
@@ -775,7 +732,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = ULONG_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = ULONG_MAX,
@@ -783,7 +740,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = ULONG_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = ULONG_MAX,
 					.gpr[22] = 0x1,
@@ -791,7 +748,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MIN,
@@ -799,7 +756,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MIN, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MIN,
 					.gpr[22] = INT_MAX,
@@ -807,7 +764,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = INT_MAX, RB = INT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = INT_MAX,
 					.gpr[22] = INT_MAX,
@@ -815,7 +772,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = UINT_MAX",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = UINT_MAX,
@@ -823,7 +780,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = UINT_MAX, RB = 0x1",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = UINT_MAX,
 					.gpr[22] = 0x1,
@@ -831,7 +788,7 @@ static struct compute_test compute_tests[] = {
 			},
 			{
 				.descr = "RA = LONG_MIN | INT_MIN, RB = LONG_MIN | INT_MIN",
-				.instr = TEST_ADDC_DOT(20, 21, 22),
+				.instr = PPC_ENCODE_ADDC_DOT(20, 21, 22),
 				.regs = {
 					.gpr[21] = LONG_MIN | (uint)INT_MIN,
 					.gpr[22] = LONG_MIN | (uint)INT_MIN,
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 55d4377ccfae..fdb09e0e16c0 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -45,8 +45,6 @@
 #define PPC_ADDIS(d, a, i)	EMIT(PPC_INST_ADDIS |			      \
 				     ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_LIS(r, i)		PPC_ADDIS(r, 0, i)
-#define PPC_STD(r, base, i)	EMIT(PPC_INST_STD | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | ((i) & 0xfffc))
 #define PPC_STDX(r, base, b)	EMIT(PPC_INST_STDX | ___PPC_RS(r) |	      \
 				     ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_STDU(r, base, i)	EMIT(PPC_INST_STDU | ___PPC_RS(r) |	      \
@@ -62,12 +60,8 @@
 
 #define PPC_LBZ(r, base, i)	EMIT(PPC_INST_LBZ | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_LD(r, base, i)	EMIT(PPC_INST_LD | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | ((i) & 0xfffc))
 #define PPC_LDX(r, base, b)	EMIT(PPC_INST_LDX | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_LWZ(r, base, i)	EMIT(PPC_INST_LWZ | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
 #define PPC_LHZ(r, base, i)	EMIT(PPC_INST_LHZ | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | IMM_L(i))
 #define PPC_LHBRX(r, base, b)	EMIT(PPC_INST_LHBRX | ___PPC_RT(r) |	      \
@@ -100,8 +94,6 @@
 
 #define PPC_SUB(d, a, b)	EMIT(PPC_INST_SUB | ___PPC_RT(d) |	      \
 				     ___PPC_RB(a) | ___PPC_RA(b))
-#define PPC_ADD(d, a, b)	EMIT(PPC_INST_ADD | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_MULD(d, a, b)	EMIT(PPC_INST_MULLD | ___PPC_RT(d) |	      \
 				     ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_MULW(d, a, b)	EMIT(PPC_INST_MULLW | ___PPC_RT(d) |	      \
diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.h
index 4ec2a9f14f84..8a9f16a7262e 100644
--- a/arch/powerpc/net/bpf_jit32.h
+++ b/arch/powerpc/net/bpf_jit32.h
@@ -76,13 +76,13 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
 			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
 
-#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) PPC_LD(r, base, i);     \
+#define _OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_ENCODE_LD(r, base, i));     \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LD(r, r, IMM_L(i)); } } while(0)
+			EMIT((r, r, IMM_L(i))); } } while(0)
 
-#define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LWZ(r, base, i);   \
+#define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_ENCODE_LWZ(r, base, i));   \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LWZ(r, r, IMM_L(i)); } } while(0)
+			EMIT(PPC_ENCODE_LWZ(r, r, IMM_L(i))); } } while(0)
 
 #define PPC_LHZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LHZ(r, base, i);   \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
@@ -118,7 +118,7 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 #define PPC_NTOHS_OFFS(r, base, i)	PPC_LHZ_OFFS(r, base, i)
 #endif
 
-#define PPC_BPF_LL(r, base, i) do { PPC_LWZ(r, base, i); } while(0)
+#define PPC_BPF_LL(r, base, i) do { EMIT(PPC_ENCODE_LWZ(r, base, i)); } while(0)
 #define PPC_BPF_STL(r, base, i) do { PPC_STW(r, base, i); } while(0)
 #define PPC_BPF_STLU(r, base, i) do { PPC_STWU(r, base, i); } while(0)
 
diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index cf3a7e337f02..d6946c0d3625 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -73,14 +73,14 @@ static const int b2p[] = {
 					PPC_LI(b2p[TMP_REG_2], (i));	      \
 					PPC_LDX(r, base, b2p[TMP_REG_2]);     \
 				} else					      \
-					PPC_LD(r, base, i);		      \
+					EMIT(PPC_ENCODE_LD(r, base, i));	      \
 				} while(0)
 #define PPC_BPF_STL(r, base, i) do {					      \
 				if ((i) % 4) {				      \
 					PPC_LI(b2p[TMP_REG_2], (i));	      \
 					PPC_STDX(r, base, b2p[TMP_REG_2]);    \
 				} else					      \
-					PPC_STD(r, base, i);		      \
+					EMIT(PPC_ENCODE_STD(r, base, i));	      \
 				} while(0)
 #define PPC_BPF_STLU(r, base, i) do { PPC_STDU(r, base, i); } while(0)
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 0acc9d5fb19e..ffda0ea28d91 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -134,7 +134,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			/*** ALU ops ***/
 		case BPF_ALU | BPF_ADD | BPF_X: /* A += X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_ADD(r_A, r_A, r_X);
+			EMIT(PPC_ENCODE_ADD(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_ADD | BPF_K: /* A += K; */
 			if (!K)
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index be3517ef0574..3d6d5ec8f450 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -239,7 +239,7 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 * if (index >= array->map.max_entries)
 	 *   goto out;
 	 */
-	PPC_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries));
+	EMIT(PPC_ENCODE_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
 	PPC_RLWINM(b2p_index, b2p_index, 0, 0, 31);
 	PPC_CMPLW(b2p_index, b2p[TMP_REG_1]);
 	PPC_BCC(COND_GE, out);
@@ -260,7 +260,7 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 
 	/* prog = array->ptrs[index]; */
 	PPC_MULI(b2p[TMP_REG_1], b2p_index, 8);
-	PPC_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array);
+	EMIT(PPC_ENCODE_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_array, ptrs));
 
 	/*
@@ -340,7 +340,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		 */
 		case BPF_ALU | BPF_ADD | BPF_X: /* (u32) dst += (u32) src */
 		case BPF_ALU64 | BPF_ADD | BPF_X: /* dst += src */
-			PPC_ADD(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_ENCODE_ADD(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_SUB | BPF_X: /* (u32) dst -= (u32) src */
 		case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
@@ -357,7 +357,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 					PPC_ADDI(dst_reg, dst_reg, IMM_L(imm));
 				else {
 					PPC_LI32(b2p[TMP_REG_1], imm);
-					PPC_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]);
+					EMIT(PPC_ENCODE_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
 				}
 			}
 			goto bpf_alu32_trunc;
@@ -691,7 +691,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			/* load value from memory into TMP_REG_2 */
 			PPC_BPF_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0);
 			/* add value from src_reg into this */
-			PPC_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg);
+			EMIT(PPC_ENCODE_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
 			/* store result back */
 			PPC_BPF_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]);
 			/* we're done if this succeeded */
@@ -702,7 +702,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			PPC_ADDI(b2p[TMP_REG_1], dst_reg, off);
 			tmp_idx = ctx->idx * 4;
 			PPC_BPF_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0);
-			PPC_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg);
+			EMIT(PPC_ENCODE_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
 			PPC_BPF_STDCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]);
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
@@ -724,7 +724,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			break;
 		/* dst = *(u32 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_W:
-			PPC_LWZ(dst_reg, src_reg, off);
+			EMIT(PPC_ENCODE_LWZ(dst_reg, src_reg, off));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
-- 
2.24.1

