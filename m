Return-Path: <linuxppc-dev+bounces-10140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED75AFADEC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 10:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbGtR5tSzz30VR;
	Mon,  7 Jul 2025 18:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751875343;
	cv=none; b=TEsnAlBl2hZbp8evUaM2S0wj6X/B2bFI46L7P4HruVmAG/zB+t0DHzNfynTwifGHz3x9+SCGSF3AViZat16NHufWDyoUZt2e3KW40qd23oSDYSQOL+IdiUPHhcABRYddXYlD9SkaviVwn92gSm+JETvuoD1L0rElkwJcWYGgj0/xfkEGRAN3GX5Z7RhzuQjYbYzl8oOimVE3vsUxcVQTFDbWxaIpnyiGdXYFmxYGcFkOLXguMo3GgcuEA7BSXboTaFuSEWc0B53G6XOcn2VCODXKNDtXsj7gpcWjPB7zkNQvlVU9D0eXo5IMcJaLPaTGWwGhMNfmKOg1NML1wa8vWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751875343; c=relaxed/relaxed;
	bh=tKWYCfPshKqHVRIfkFm7djL1GZKcjaFXrRskb/zgNe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzPelsacJswvYOB/v2Q2PvgLxvmzzgTgG6iBzyp5+D2pRTu9fBPbAowUVvyUs8tcddZn99yNUCcKIix1wre5bbm6eyjQ5YoUyUPj/CpYzr5nFZVN9va+Yqmr2DzKmm3E6VK/l0+w5yrsM5StWSdJLY1U4IJ/I7f+BBqBQAZQkkzciWWxCGJN2qTyWeUFs2xeumjWjtnD9qotXpvbwyh867vEpwSAGUODXu8PFQFN3FuP22fnGr3lh/KqWMeO1VGr52HS7ZzF7wvLM3cUk3EZk0DwoDMYjCVQR2AZstuy0rgq81dFm+NTQ3xIdCip0ATD8FR+P+lK47G9ly8NFIL66Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pLuAaR5S; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pLuAaR5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbGtR0hNdz30V7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 18:02:22 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566JlFRa010272;
	Mon, 7 Jul 2025 08:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=tKWYCfPshKqHVRIfkFm7djL1GZKcjaFXrRskb/zgN
	e8=; b=pLuAaR5SIy75wFqc0I+aClZ0xBe4W4Cq9RonfjssW4fX0PTmWtV/hHurl
	6Q+21ZCWzk6h0yNrdU2cc9nDx1eGq9yyNL63Zh34wrHJ0kCm3fzOcKt+hRNp68e3
	jE2s6B+X73gp4tcu9C6ODX8b6icaYduGBSnQzL29YZLTSVvciPHeFudwIom54Z0E
	MYTlHvcpP6OBcA/yJbZKu8QCr+DCFyxp9IA5/m0JidUcMxs0VFc9oSfMaJpPi/ql
	UMoL8Vg1dIX6MgHU1pzNKHhqD/Ppj31My/cylwXBNmdJq6WUVhtvOys2eacf6VCY
	jG/+5v/HiAoXHr/BZ3AgYqGEowQhA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puk3r9t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5677qCN3000458;
	Mon, 7 Jul 2025 08:02:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puk3r9sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5677kPXQ021581;
	Mon, 7 Jul 2025 08:02:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 47qectd9jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 08:02:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5678222f38797694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 08:02:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF8B72004E;
	Mon,  7 Jul 2025 08:02:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 900DE20043;
	Mon,  7 Jul 2025 08:02:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.94.242])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 08:02:00 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Aditya Bodkhe <adityab1@linux.ibm.com>
Subject: [PATCH] powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL
Date: Mon,  7 Jul 2025 13:31:55 +0530
Message-ID: <20250707080156.64874-1-adityab1@linux.ibm.com>
X-Mailer: git-send-email 2.50.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NCBTYWx0ZWRfX5X4Bxx/DP4/V jGo8DWLNLNWj42YO0PoFDeQ37Ckyta9V3X+ZgTd5GsEFtdjmDzSC0Mn8QnSGD+enIi4uHn+rLRK S+Au+bCB5FHYivNAAQiU/C1xzdf4h7x+CdqyQjJuBBA7unCUIYYLHXfwjGwko17LMPbhK3+Hug6
 T6SoiJk9rjbTx1gTTQtK5n5weXSa5JVjvRmAVBCfbNMvMaT9lY2+PmhyHC15MTzxmj0xkBlTFsS yT6vrBD5uvbp4aS466D613YV8NmKPH+j6HzlHeEZm4ozXXHC6HuEOeNZ2X5XYZ0YL59nTmja1Wg EIA9ss6SMR9vo+dA+8QogEf3ZpiSHxOuYtMpbVQQCbC+puJYRCNk45/v3XFNmCT6da7LNSd+vXB
 gXq2FZfovAALZa+idRFsxIba3pM6XLkkLVwkNH5zTGmU17TYbu4hqiOOWW/4PT6+21hot69E
X-Authority-Analysis: v=2.4 cv=XYeJzJ55 c=1 sm=1 tr=0 ts=686b7f00 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=f-JPSP1mq3vSRxYuwIAA:9
X-Proofpoint-ORIG-GUID: dDceL51tWHTZW1IQbCIc_86ShS54Sn2C
X-Proofpoint-GUID: G0HZppdmp8lVGANPy9y5UhT2-TduYhxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070044
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

commit a1be9ccc57f0 ("function_graph: Support recording and printing the
return value of function") introduced support for function graph return
value tracing.

Additionally, commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
ftrace_regs") further refactored and optimized the implementation,
making `struct fgraph_ret_regs` unnecessary.

This patch enables the above modifications for powerpc all, ensuring that
function graph return value tracing is available on this architecture.

In this patch we have redefined two functions:
- 'ftrace_regs_get_return_value()' - the existing implementation on
ppc returns -ve of return value based on some conditions not
relevant to our patch.
- 'trace_regs_get_frame_pointer()' - always returns 0 in current code .

We also allocate stack space to equivalent of 'SWITCH_FRAME_SIZE',
allowing us to directly use predefined offsets like 'GPR3' and 'GPR4'
this keeps code clean and consistent with already defined offsets .

After this patch, v6.14+ kernel can also be built with FPROBE on powerpc
but there are a few other build and runtime dependencies for FPROBE to
work properly. The next patch addresses them.

Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/include/asm/ftrace.h        | 15 +++++++++
 arch/powerpc/kernel/trace/ftrace_entry.S | 42 ++++++++++++++----------
 3 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3e0cc83f120..9163521bc4b9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -250,6 +250,7 @@ config PPC
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_DESCRIPTORS	if PPC64_ELF_ABI_V1
 	select HAVE_FUNCTION_ERROR_INJECTION
+	select HAVE_FUNCTION_GRAPH_FREGS
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER		if !COMPILE_TEST && (PPC64 || (PPC32 && CC_IS_GCC))
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 82da7c7a1d12..6ffc9c9cf4e3 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -50,6 +50,21 @@ static __always_inline struct pt_regs *arch_ftrace_get_regs(struct ftrace_regs *
 		asm volatile("mfmsr %0" : "=r" ((_regs)->msr));	\
 	} while (0)
 
+#undef ftrace_regs_get_return_value
+static __always_inline unsigned long
+ftrace_regs_get_return_value(const struct ftrace_regs *fregs)
+{
+	return arch_ftrace_regs(fregs)->regs.gpr[3];
+}
+#define ftrace_regs_get_return_value ftrace_regs_get_return_value
+
+#undef ftrace_regs_get_frame_pointer
+static __always_inline unsigned long
+ftrace_regs_get_frame_pointer(const struct ftrace_regs *fregs)
+{
+	return arch_ftrace_regs(fregs)->regs.gpr[1];
+}
+
 static __always_inline void
 ftrace_regs_set_instruction_pointer(struct ftrace_regs *fregs,
 				    unsigned long ip)
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 3565c67fc638..d00272099add 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -409,23 +409,31 @@ EXPORT_SYMBOL(_mcount)
 _GLOBAL(return_to_handler)
 	/* need to save return values */
 #ifdef CONFIG_PPC64
-	std	r4,  -32(r1)
-	std	r3,  -24(r1)
+	stdu	r1, -SWITCH_FRAME_SIZE(r1)
+	std	r4, GPR4(r1)
+	std	r3, GPR3(r1)
+  /* Save previous stack pointer (r1) */
+	addi	r3, r1, SWITCH_FRAME_SIZE
+	std	r3, GPR1(r1)
 	/* save TOC */
-	std	r2,  -16(r1)
-	std	r31, -8(r1)
+	std	r2,  24(r1)
+	std	r31, 32(r1)
 	mr	r31, r1
-	stdu	r1, -112(r1)
-
+  /* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
+	addi	r3,  r1, STACK_INT_FRAME_REGS
 	/*
 	 * We might be called from a module.
 	 * Switch to our TOC to run inside the core kernel.
 	 */
 	LOAD_PACA_TOC()
 #else
-	stwu	r1, -16(r1)
-	stw	r3, 8(r1)
-	stw	r4, 12(r1)
+	stwu	r1, -SWITCH_FRAME_SIZE(r1)
+	stw	r4, GPR4(r1)
+	stw	r3, GPR3(r1)
+	addi	r3, r1, SWITCH_FRAME_SIZE
+	stw	r3, GPR1(r1)
+  /* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
+  addi	r3, r1, STACK_INT_FRAME_REGS
 #endif
 
 	bl	ftrace_return_to_handler
@@ -435,15 +443,15 @@ _GLOBAL(return_to_handler)
 	mtlr	r3
 
 #ifdef CONFIG_PPC64
-	ld	r1, 0(r1)
-	ld	r4,  -32(r1)
-	ld	r3,  -24(r1)
-	ld	r2,  -16(r1)
-	ld	r31, -8(r1)
+	ld	r4,  GPR4(r1)
+	ld	r3,  GPR3(r1)
+	ld	r2,  24(r1)
+	ld	r31, 32(r1)
+	ld	r1,  0(r1)
 #else
-	lwz	r3, 8(r1)
-	lwz	r4, 12(r1)
-	addi	r1, r1, 16
+	lwz	r3, GPR3(r1)
+	lwz	r4, GPR4(r1)
+	addi	r1, r1, SWITCH_FRAME_SIZE
 #endif
 
 	/* Jump back to real return address */
-- 
2.50.0


