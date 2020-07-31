Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C3A23412F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:27:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0kq5j0dzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:27:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0WD04PHzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:17:11 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V84utS129016; Fri, 31 Jul 2020 04:17:06 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32m3wurt4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 04:17:05 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V8GvGR016954;
 Fri, 31 Jul 2020 08:17:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqgq0yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 08:17:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06V8H0lj22544712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 08:17:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C271911C058;
 Fri, 31 Jul 2020 08:17:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F20E811C052;
 Fri, 31 Jul 2020 08:16:58 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.199.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 08:16:58 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 4/4] powerpc sstep: add testcases for vsx load/store
 instructions
Date: Fri, 31 Jul 2020 13:46:37 +0530
Message-Id: <20200731081637.1837559-5-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200731081637.1837559-1-bala24@linux.ibm.com>
References: <20200731081637.1837559-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310059
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

Suggested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 252 +++++++++++++++++++++++++++
 1 file changed, 252 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index d242e9f72e0c..f16934b80511 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -612,6 +612,255 @@ static void __init test_lxvd2x_stxvd2x(void)
 }
 #endif /* CONFIG_VSX */
 
+#ifdef CONFIG_VSX
+static void __init test_lxvp_stxvp(void)
+{
+	struct pt_regs regs;
+	union {
+		vector128 a;
+		u32 b[4];
+	} c[2];
+	u32 cached_b[8];
+	int stepped = -1;
+
+	init_pt_regs(&regs);
+
+	/*** lxvp ***/
+
+	cached_b[0] = c[0].b[0] = 18233;
+	cached_b[1] = c[0].b[1] = 34863571;
+	cached_b[2] = c[0].b[2] = 834;
+	cached_b[3] = c[0].b[3] = 6138911;
+	cached_b[4] = c[1].b[0] = 1234;
+	cached_b[5] = c[1].b[1] = 5678;
+	cached_b[6] = c[1].b[2] = 91011;
+	cached_b[7] = c[1].b[3] = 121314;
+
+	regs.gpr[4] = (unsigned long)&c[0].a;
+
+	/*
+	 * lxvp XTp,DQ(RA)
+	 * XTp = 32×TX + 2×Tp
+	 * let TX=1 Tp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_LXVP(1, 1, 4, 0)));
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
+	c[0].b[0] = 21379463;
+	c[0].b[1] = 87;
+	c[0].b[2] = 374234;
+	c[0].b[3] = 4;
+	c[1].b[0] = 90;
+	c[1].b[1] = 122;
+	c[1].b[2] = 555;
+	c[1].b[3] = 32144;
+
+	/*
+	 * stxvp XSp,DQ(RA)
+	 * XSp = 32×SX + 2×Sp
+	 * let SX=1 Sp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_STXVP(1, 1, 4, 0)));
+
+	if (stepped == 1 && cached_b[0] == c[0].b[0] && cached_b[1] == c[0].b[1] &&
+	    cached_b[2] == c[0].b[2] && cached_b[3] == c[0].b[3] &&
+	    cached_b[4] == c[1].b[0] && cached_b[5] == c[1].b[1] &&
+	    cached_b[6] == c[1].b[2] && cached_b[7] == c[1].b[3] &&
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
+		vector128 a;
+		u32 b[4];
+	} c[2];
+	u32 cached_b[8];
+	int stepped = -1;
+
+	init_pt_regs(&regs);
+
+	/*** lxvpx ***/
+
+	cached_b[0] = c[0].b[0] = 18233;
+	cached_b[1] = c[0].b[1] = 34863571;
+	cached_b[2] = c[0].b[2] = 834;
+	cached_b[3] = c[0].b[3] = 6138911;
+	cached_b[4] = c[1].b[0] = 1234;
+	cached_b[5] = c[1].b[1] = 5678;
+	cached_b[6] = c[1].b[2] = 91011;
+	cached_b[7] = c[1].b[3] = 121314;
+
+	regs.gpr[3] = (unsigned long)&c[0].a;
+	regs.gpr[4] = 0;
+
+	/*
+	 * lxvpx XTp,RA,RB
+	 * XTp = 32×TX + 2×Tp
+	 * let TX=1 Tp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_LXVPX(1, 1, 3, 4)));
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
+	c[0].b[0] = 21379463;
+	c[0].b[1] = 87;
+	c[0].b[2] = 374234;
+	c[0].b[3] = 4;
+	c[1].b[0] = 90;
+	c[1].b[1] = 122;
+	c[1].b[2] = 555;
+	c[1].b[3] = 32144;
+
+	/*
+	 * stxvpx XSp,RA,RB
+	 * XSp = 32×SX + 2×Sp
+	 * let SX=1 Sp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_STXVPX(1, 1, 3, 4)));
+
+	if (stepped == 1 && cached_b[0] == c[0].b[0] && cached_b[1] == c[0].b[1] &&
+	    cached_b[2] == c[0].b[2] && cached_b[3] == c[0].b[3] &&
+	    cached_b[4] == c[1].b[0] && cached_b[5] == c[1].b[1] &&
+	    cached_b[6] == c[1].b[2] && cached_b[7] == c[1].b[3] &&
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
+		vector128 a;
+		u32 b[4];
+	} c[2];
+	u32 cached_b[8];
+	int stepped = -1;
+
+	/*
+	 * plxvp XTp,D(RA),R
+	 * XSp = 32×SX + 2×Sp
+	 * let RA=3 R=0 D=d0||d1=0 R=0 Sp=1 SX=1
+	 */
+	instr = ppc_inst_prefix(PPC_PLXVP(3, 0, 0, 1, 1) >> 32,
+			PPC_PLXVP(3, 0, 0, 1, 1) & 0xffffffff);
+
+	/*** plxvpx ***/
+
+	cached_b[0] = c[0].b[0] = 18233;
+	cached_b[1] = c[0].b[1] = 34863571;
+	cached_b[2] = c[0].b[2] = 834;
+	cached_b[3] = c[0].b[3] = 6138911;
+	cached_b[4] = c[1].b[0] = 1234;
+	cached_b[5] = c[1].b[1] = 5678;
+	cached_b[6] = c[1].b[2] = 91011;
+	cached_b[7] = c[1].b[3] = 121314;
+
+	init_pt_regs(&regs);
+	regs.gpr[3] = (unsigned long)&c[0].a;
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
+	c[0].b[0] = 21379463;
+	c[0].b[1] = 87;
+	c[0].b[2] = 374234;
+	c[0].b[3] = 4;
+	c[1].b[0] = 90;
+	c[1].b[1] = 122;
+	c[1].b[2] = 555;
+	c[1].b[3] = 32144;
+
+	/*
+	 * pstxvpx XTp,D(RA),R
+	 * XSp = 32×SX + 2×Sp
+	 * let RA=3 D=d0||d1=0 R=0 Sp=1 SX=1
+	 */
+	instr = ppc_inst_prefix(PPC_PSTXVP(3, 0, 0, 1, 1) >> 32,
+			PPC_PSTXVP(3, 0, 0, 1, 1) & 0xffffffff);
+
+	stepped = emulate_step(&regs, instr);
+
+	if (stepped == 1 && cached_b[0] == c[0].b[0] && cached_b[1] == c[0].b[1] &&
+	    cached_b[2] == c[0].b[2] && cached_b[3] == c[0].b[3] &&
+	    cached_b[4] == c[1].b[0] && cached_b[5] == c[1].b[1] &&
+	    cached_b[6] == c[1].b[2] && cached_b[7] == c[1].b[3] &&
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
@@ -628,6 +877,9 @@ static void __init run_tests_load_store(void)
 	test_plfd_pstfd();
 	test_lvx_stvx();
 	test_lxvd2x_stxvd2x();
+	test_lxvp_stxvp();
+	test_lxvpx_stxvpx();
+	test_plxvp_pstxvp();
 }
 
 struct compute_test {
-- 
2.24.1

