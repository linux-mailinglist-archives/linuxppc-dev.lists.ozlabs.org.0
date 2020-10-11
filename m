Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4EF28A5C7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 07:19:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C899D3XCqzDqyq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Oct 2020 16:19:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WeJnMszt; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C88xw0LRMzDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Oct 2020 16:09:55 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09B52pIk183726; Sun, 11 Oct 2020 01:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qLlaay++YIMIkIous2cxyqETbW2nc3+i7u8MCGcyu9g=;
 b=WeJnMszt+WzzPvJC7I5mxcoh9NLGDz6ADv+w0gaIo9A/GZpMIR4LQzKdQImw/tItV3vc
 aD/vkOCxkObzZNjwZLjoMI1SEL7iSxc9DtMqi0i3i/A4xMf/I+32w46WEMxVWxCQuYO9
 WmgTlE4OX7suw5SdXjmd33ITVfNshEOG17wDSBqzXvMzxFTGf6/FSzAyzi594eK9crmD
 lJ7921IxhZuP5GRChaLx6YC0bFlct4nYQ5XUOd6igPTYwxIOHMghTGckXulQIHCjlR2X
 NJmEUgBAL5bd0/xQ1vUjsbiJa2cqbKvo5qsbvDUNRG794XKb3Bj/EdfjDtjjNKgC+C1k 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u970d2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:51 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09B52r3x183948;
 Sun, 11 Oct 2020 01:09:51 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 343u970d2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 01:09:50 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09B58H0r027081;
 Sun, 11 Oct 2020 05:09:48 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3434k80eek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Oct 2020 05:09:48 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09B59jqI35979676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Oct 2020 05:09:45 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ED3A42045;
 Sun, 11 Oct 2020 05:09:45 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 720F84203F;
 Sun, 11 Oct 2020 05:09:43 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.47.193])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 11 Oct 2020 05:09:43 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v5 5/5] powerpc/sstep: Add testcases for VSX vector paired
 load/store instructions
Date: Sun, 11 Oct 2020 10:39:08 +0530
Message-Id: <20201011050908.72173-6-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-10_07:2020-10-09,
 2020-10-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 suspectscore=1 adultscore=0 spamscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010110048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Balamuruhan S <bala24@linux.ibm.com>

Add testcases for VSX vector paired load/store instructions.
Sample o/p:

  emulate_step_test: lxvp           : PASS
  emulate_step_test: stxvp          : PASS
  emulate_step_test: lxvpx          : PASS
  emulate_step_test: stxvpx         : PASS
  emulate_step_test: plxvp          : PASS
  emulate_step_test: pstxvp         : PASS

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 270 +++++++++++++++++++++++++++
 1 file changed, 270 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 0a201b771477..783d1b85ecfe 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -612,6 +612,273 @@ static void __init test_lxvd2x_stxvd2x(void)
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
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("lxvp", "SKIP (!CPU_FTR_ARCH_31)");
+		show_result("stxvp", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
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
+	 * XTp = 32xTX + 2xTp
+	 * let TX=1 Tp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LXVP(34, 4, 0)));
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
+	 * XSp = 32xSX + 2xSp
+	 * let SX=1 Sp=1 RA=4 DQ=0
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STXVP(34, 4, 0)));
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
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("lxvpx", "SKIP (!CPU_FTR_ARCH_31)");
+		show_result("stxvpx", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
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
+	 * XTp = 32xTX + 2xTp
+	 * let TX=1 Tp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_LXVPX(34, 3, 4)));
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
+	 * XSp = 32xSX + 2xSp
+	 * let SX=1 Sp=1 RA=3 RB=4
+	 */
+	stepped = emulate_step(&regs, ppc_inst(PPC_RAW_STXVPX(34, 3, 4)));
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
+	if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
+		show_result("plxvp", "SKIP (!CPU_FTR_ARCH_31)");
+		show_result("pstxvp", "SKIP (!CPU_FTR_ARCH_31)");
+		return;
+	}
+
+	/*** plxvp ***/
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
+	/*
+	 * plxvp XTp,D(RA),R
+	 * XTp = 32xTX + 2xTp
+	 * let RA=3 R=0 D=d0||d1=0 R=0 Tp=1 TX=1
+	 */
+	instr = ppc_inst_prefix(PPC_RAW_PLXVP(34, 0, 3, 0) >> 32,
+			PPC_RAW_PLXVP(34, 0, 3, 0) & 0xffffffff);
+
+	stepped = emulate_step(&regs, instr);
+	if (stepped == 1 && cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("plxvp", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("plxvp", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("plxvp", "FAIL");
+	}
+
+	/*** pstxvp ***/
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
+	 * pstxvp XSp,D(RA),R
+	 * XSp = 32xSX + 2xSp
+	 * let RA=3 D=d0||d1=0 R=0 Sp=1 SX=1
+	 */
+	instr = ppc_inst_prefix(PPC_RAW_PSTXVP(34, 0, 3, 0) >> 32,
+			PPC_RAW_PSTXVP(34, 0, 3, 0) & 0xffffffff);
+
+	stepped = emulate_step(&regs, instr);
+
+	if (stepped == 1 && cached_b[0] == c[0].b[0] && cached_b[1] == c[0].b[1] &&
+	    cached_b[2] == c[0].b[2] && cached_b[3] == c[0].b[3] &&
+	    cached_b[4] == c[1].b[0] && cached_b[5] == c[1].b[1] &&
+	    cached_b[6] == c[1].b[2] && cached_b[7] == c[1].b[3] &&
+	    cpu_has_feature(CPU_FTR_VSX)) {
+		show_result("pstxvp", "PASS");
+	} else {
+		if (!cpu_has_feature(CPU_FTR_VSX))
+			show_result("pstxvp", "PASS (!CPU_FTR_VSX)");
+		else
+			show_result("pstxvp", "FAIL");
+	}
+}
+#else
+static void __init test_plxvp_pstxvp(void)
+{
+	show_result("plxvp", "SKIP (CONFIG_VSX is not set)");
+	show_result("pstxvp", "SKIP (CONFIG_VSX is not set)");
+}
+#endif /* CONFIG_VSX */
+
 static void __init run_tests_load_store(void)
 {
 	test_ld();
@@ -628,6 +895,9 @@ static void __init run_tests_load_store(void)
 	test_plfd_pstfd();
 	test_lvx_stvx();
 	test_lxvd2x_stxvd2x();
+	test_lxvp_stxvp();
+	test_lxvpx_stxvpx();
+	test_plxvp_pstxvp();
 }
 
 struct compute_test {
-- 
2.26.2

