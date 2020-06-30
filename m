Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEFF20EDFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 08:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wv0J5zT8zDqlp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 16:02:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtny0g03zDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:53:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U5Wxl1130531; Tue, 30 Jun 2020 01:53:37 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjxr9dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:53:37 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U5l62H017567;
 Tue, 30 Jun 2020 05:53:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 31wwr7sh77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:53:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05U5rWKk66584912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:53:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EE50AE053;
 Tue, 30 Jun 2020 05:53:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07CC7AE051;
 Tue, 30 Jun 2020 05:53:29 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.47.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:53:28 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/4] powerpc sstep: add testcases for vsx load/store
 instructions
Date: Tue, 30 Jun 2020 11:23:07 +0530
Message-Id: <20200630055307.1154135-5-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200630055307.1154135-1-bala24@linux.ibm.com>
References: <20200630055307.1154135-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 cotscore=-2147483648 bulkscore=0 mlxlogscore=826 mlxscore=0
 impostorscore=0 priorityscore=1501 suspectscore=1 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006300042
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

add testcases for vsx load/store vector paired instructions,
        * Load VSX Vector Paired (lxvp)
        * Load VSX Vector Paired Indexed (lxvpx)
        * Prefixed Load VSX Vector Paired (plxvp)
        * Store VSX Vector Paired (stxvp)
        * Store VSX Vector Paired Indexed (stxvpx)
        * Prefixed Store VSX Vector Paired (pstxvp)

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |   7 +
 arch/powerpc/lib/test_emulate_step.c  | 273 ++++++++++++++++++++++++++
 2 files changed, 280 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 558efd25683b..9bc9b184db6e 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -384,6 +384,10 @@
 #define PPC_INST_VCMPEQUD		0x100000c7
 #define PPC_INST_VCMPEQUB		0x10000006
 
+/* Prefixes */
+#define PPC_PREFIX_MLS			0x06000000
+#define PPC_PREFIX_8LS			0x04000000
+
 /* macros to insert fields into opcodes */
 #define ___PPC_RA(a)	(((a) & 0x1f) << 16)
 #define ___PPC_RB(b)	(((b) & 0x1f) << 11)
@@ -415,6 +419,9 @@
 #define __PPC_CT(t)	(((t) & 0x0f) << 21)
 #define __PPC_SPR(r)	((((r) & 0x1f) << 16) | ((((r) >> 5) & 0x1f) << 11))
 #define __PPC_RC21	(0x1 << 10)
+#define __PPC_PRFX_R(r)	(((r) & 0x1) << 20)
+#define __PPC_TP(tp)	(((tp) & 0xf) << 22)
+#define __PPC_TX(tx)	(((tx) & 0x1) << 21)
 
 /*
  * Both low and high 16 bits are added as SIGNED additions, so if low 16 bits
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 46af80279ebc..98ecbc66bef8 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -14,7 +14,13 @@
 #include <asm/inst.h>
 
 #define IMM_L(i)		((uintptr_t)(i) & 0xffff)
+#define IMM_H(i)		(((uintptr_t)(i) >> 16) & 0x3ffff)
 #define IMM_DS(i)		((uintptr_t)(i) & 0xfffc)
+#define IMM_DQ(i)		(((uintptr_t)(i) & 0xfff) << 4)
+
+#define PLXVP_EX_OP		0xe8000000
+#define PSTXVP_EX_OP		0xf8000000
+
 
 /*
  * Defined with TEST_ prefix so it does not conflict with other
@@ -47,6 +53,21 @@
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_LXVD2X(s, a, b)	ppc_inst(PPC_INST_LXVD2X | VSX_XX1((s), R##a, R##b))
 #define TEST_STXVD2X(s, a, b)	ppc_inst(PPC_INST_STXVD2X | VSX_XX1((s), R##a, R##b))
+#define TEST_LXVP(tp, tx, a, i) \
+	(PPC_INST_LXVP | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | IMM_DQ(i))
+#define TEST_STXVP(sp, sx, a, i) \
+	(PPC_INST_STXVP | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | IMM_DQ(i) | 0x1)
+#define TEST_LXVPX(tp, tx, a, b) \
+	(PPC_INST_LXVPX | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_STXVPX(sp, sx, a, b) \
+	(PPC_INST_STXVPX | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_PLXVP(a, i, pr, tp, tx) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_H(i)) << 32 | \
+	 (PLXVP_EX_OP | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | IMM_L(i)))
+#define TEST_PSTXVP(a, i, pr, sp, sx) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_H(i)) << 32 | \
+	 (PSTXVP_EX_OP | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | IMM_L(i)))
+
 #define TEST_ADD(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_ADD_DOT(t, a, b)	ppc_inst(PPC_INST_ADD | ___PPC_RT(t) |		\
@@ -444,6 +465,255 @@ static void __init test_lxvd2x_stxvd2x(void)
 }
 #endif /* CONFIG_VSX */
 
+#ifdef CONFIG_VSX
+static void __init test_lxvp_stxvp(void)
+{
+	struct pt_regs regs;
+	union {
+		vector128 a[2];
+		u32 b[8];
+	} c;
+	u32 cached_b[8];
+	int stepped = -1;
+
+	init_pt_regs(&regs);
+
+	/*** lxvp ***/
+
+	cached_b[0] = c.b[0] = 18233;
+	cached_b[1] = c.b[1] = 34863571;
+	cached_b[2] = c.b[2] = 834;
+	cached_b[3] = c.b[3] = 6138911;
+	cached_b[4] = c.b[4] = 1234;
+	cached_b[5] = c.b[5] = 5678;
+	cached_b[6] = c.b[6] = 91011;
+	cached_b[7] = c.b[7] = 121314;
+
+	regs.gpr[4] = (unsigned long)&c.a;
+
+	/*
+	 * lxvp XTp,DQ(RA)
+	 * XTp = 32×TX + 2×Tp
+	 * let TX=1 Tp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(TEST_LXVP(1, 1, 4, 0)));
+
+	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("lxvp", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("lxvp", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("lxvp", "FAIL");
+	}
+
+	/*** stxvp ***/
+
+	c.b[0] = 21379463;
+	c.b[1] = 87;
+	c.b[2] = 374234;
+	c.b[3] = 4;
+	c.b[4] = 90;
+	c.b[5] = 122;
+	c.b[6] = 555;
+	c.b[7] = 32144;
+
+	/*
+	 * stxvp XSp,DQ(RA)
+	 * XSp = 32×SX + 2×Sp
+	 * let SX=1 Sp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(TEST_STXVP(1, 1, 4, 0)));
+
+	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
+	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
+	    cached_b[4] == c.b[4] && cached_b[5] == c.b[5] &&
+	    cached_b[6] == c.b[6] && cached_b[7] == c.b[7] &&
+	    cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("stxvp", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("stxvp", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("stxvp", "FAIL");
+	}
+}
+#else
+static void __init test_lxvp_stxvp(void)
+{
+	show_result("lxvp", "SKIP (CONFIG_VSX is not set)");
+	show_result("stxvp", "SKIP (CONFIG_VSX is not set)");
+}
+#endif /* CONFIG_VSX */
+
+#ifdef CONFIG_VSX
+static void __init test_lxvpx_stxvpx(void)
+{
+	struct pt_regs regs;
+	union {
+		vector128 a[2];
+		u32 b[8];
+	} c;
+	u32 cached_b[8];
+	int stepped = -1;
+
+	init_pt_regs(&regs);
+
+	/*** lxvpx ***/
+
+	cached_b[0] = c.b[0] = 18233;
+	cached_b[1] = c.b[1] = 34863571;
+	cached_b[2] = c.b[2] = 834;
+	cached_b[3] = c.b[3] = 6138911;
+	cached_b[4] = c.b[4] = 1234;
+	cached_b[5] = c.b[5] = 5678;
+	cached_b[6] = c.b[6] = 91011;
+	cached_b[7] = c.b[7] = 121314;
+
+	regs.gpr[3] = (unsigned long)&c.a;
+	regs.gpr[4] = 0;
+
+	/*
+	 * lxvpx XTp,RA,RB
+	 * XTp = 32×TX + 2×Tp
+	 * let TX=1 Tp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(TEST_LXVPX(1, 1, 3, 4)));
+
+	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("lxvpx", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("lxvpx", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("lxvpx", "FAIL");
+	}
+
+	/*** stxvpx ***/
+
+	c.b[0] = 21379463;
+	c.b[1] = 87;
+	c.b[2] = 374234;
+	c.b[3] = 4;
+	c.b[4] = 90;
+	c.b[5] = 122;
+	c.b[6] = 555;
+	c.b[7] = 32144;
+
+	/*
+	 * stxvpx XSp,RA,RB
+	 * XSp = 32×SX + 2×Sp
+	 * let SX=1 Sp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(TEST_STXVPX(1, 1, 3, 4)));
+
+	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
+	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
+	    cached_b[4] == c.b[4] && cached_b[5] == c.b[5] &&
+	    cached_b[6] == c.b[6] && cached_b[7] == c.b[7] &&
+	    cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("stxvpx", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("stxvpx", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("stxvpx", "FAIL");
+	}
+}
+#else
+static void __init test_lxvpx_stxvpx(void)
+{
+	show_result("lxvpx", "SKIP (CONFIG_VSX is not set)");
+	show_result("stxvpx", "SKIP (CONFIG_VSX is not set)");
+}
+#endif /* CONFIG_VSX */
+
+#ifdef CONFIG_VSX
+static void __init test_plxvp_pstxvp(void)
+{
+	struct ppc_inst instr;
+	struct pt_regs regs;
+	union {
+		vector128 a[2];
+		u32 b[8];
+	} c;
+	u32 cached_b[8];
+	int stepped = -1;
+
+	/*
+	 * plxvp XTp,D(RA),R
+	 * XSp = 32×SX + 2×Sp
+	 * let RA=3 R=0 D=d0||d1=0 R=0 Sp=1 SX=1
+	 */
+	instr = ppc_inst_prefix(TEST_PLXVP(3, 0, 0, 1, 1) >> 32,
+			TEST_PLXVP(3, 0, 0, 1, 1) & 0xffffffff);
+
+	/*** plxvpx ***/
+
+	cached_b[0] = c.b[0] = 18233;
+	cached_b[1] = c.b[1] = 34863571;
+	cached_b[2] = c.b[2] = 834;
+	cached_b[3] = c.b[3] = 6138911;
+	cached_b[4] = c.b[4] = 1234;
+	cached_b[5] = c.b[5] = 5678;
+	cached_b[6] = c.b[6] = 91011;
+	cached_b[7] = c.b[7] = 121314;
+
+	init_pt_regs(&regs);
+	regs.gpr[3] = (unsigned long)&c.a;
+
+	stepped = emulate_step(&regs, instr);
+	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("plxvpx", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("plxvpx", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("plxvpx", "FAIL");
+	}
+
+	/*** pstxvpx ***/
+
+	c.b[0] = 21379463;
+	c.b[1] = 87;
+	c.b[2] = 374234;
+	c.b[3] = 4;
+	c.b[4] = 90;
+	c.b[5] = 122;
+	c.b[6] = 555;
+	c.b[7] = 32144;
+
+	/*
+	 * pstxvpx XTp,D(RA),R
+	 * XSp = 32×SX + 2×Sp
+	 * let RA=3 D=d0||d1=0 R=0 Sp=1 SX=1
+	 */
+	instr = ppc_inst_prefix(TEST_PSTXVP(3, 0, 0, 1, 1) >> 32,
+			TEST_PSTXVP(3, 0, 0, 1, 1) & 0xffffffff);
+
+	stepped = emulate_step(&regs, instr);
+
+	if (stepped == 1 && cached_b[0] == c.b[0] && cached_b[1] == c.b[1] &&
+	    cached_b[2] == c.b[2] && cached_b[3] == c.b[3] &&
+	    cached_b[4] == c.b[4] && cached_b[5] == c.b[5] &&
+	    cached_b[6] == c.b[6] && cached_b[7] == c.b[7] &&
+	    cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("pstxvpx", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("pstxvpx", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("pstxvpx", "FAIL");
+	}
+}
+#else
+static void __init test_plxvp_pstxvp(void)
+{
+	show_result("plxvpx", "SKIP (CONFIG_VSX is not set)");
+	show_result("pstxvpx", "SKIP (CONFIG_VSX is not set)");
+}
+#endif /* CONFIG_VSX */
+
 static void __init run_tests_load_store(void)
 {
 	test_ld();
@@ -455,6 +725,9 @@ static void __init run_tests_load_store(void)
 	test_lfdx_stfdx();
 	test_lvx_stvx();
 	test_lxvd2x_stxvd2x();
+	test_lxvp_stxvp();
+	test_lxvpx_stxvpx();
+	test_plxvp_pstxvp();
 }
 
 struct compute_test {
-- 
2.24.1

