Return-Path: <linuxppc-dev+bounces-11900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 885F9B4A0EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 06:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLWkl5VLQz3050;
	Tue,  9 Sep 2025 14:56:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757393807;
	cv=none; b=nL22+/qERriJUsXwqchz2pRxXDs+FcbYJx7HaU8kciN2j9UkagwLm8AAvxsp5u1rlnFXhrQ+jBIZvd1f6x/9aXqWz94kE9og85ztBWwc+9q0y/kKmXmzLFvF/phcp+cbi2mfGNdgWHzJzF9BpTYeVi8GXlAdNky1zmoO6ls8rrteH+ofVQx4DJigF7oxzbeRLtc0bY7LEBI5fwYeYzZtxETL74oqxGarVpC66sur1Xo0czinPjYpdsBxu7AFgzhoxqM4PBTQh1UX/4M+C20jV1PdWxImkg50AM1zXvhnpSdvPrfy07tbLIzqMXB1GjypQb3hLyI6+z9MYb+5QHdwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757393807; c=relaxed/relaxed;
	bh=zAv+bJnVvnq0Y/PkcRnpd8dKJR4XDn95lfeUYjV05jU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkkMUYkL0dPzONkXPSq/BtipVDTV04t5sDhGD2upKDW08lB1XImBrfL9uPGNj1wGpcZ+4zuxV646PB5+TSw3QvtHXe/IIL2zjWH34b+e5ids848sju32gvsrTmKslbPBJw1oabhvHY7Moonha8C8D7KCbUZwOSnQ+5FIZnDH7fDlAZkxF1oQdETtqNO3WPBTa8nLAIcw5AebD1gh9kPeQTQfmiBqFFfwtfjljFY69COWK+u4o/mX7C82rlqbMWz3Bzwyl8oZKmWtPYLi436Yur4cLQGAXjWkQ2UQ8LPeLjn7cKi/pITO7iWGdJUVKfcYL0IIBBa4JxuqPd1MgzyjeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lsTrP1Zt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lsTrP1Zt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityab1@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLWkk2xt5z2yxN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 14:56:45 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GqkXc021232;
	Tue, 9 Sep 2025 04:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zAv+bJnVvnq0Y/PkcRnpd8dKJR4XDn95lfeUYjV05
	jU=; b=lsTrP1Zt8aqBGgG6NqVEyf1ongi3841+xaFRs1xdeT54etAgLOHO3JNhY
	/DbU6MQtng+Ro1L0CY9Sn67SgHCz/HpalF4eoJo6YMgSoLoqJADZwUcr760mUlv4
	qwWswo9zWmDgkF7KJuPvuEthjpFvmHSmQB+4C0tTsOTQ0BPOV+XFhC9+P1qLb+tk
	44AGTkJXbbuVTUXjCibOaz9edumyj2V0F3e5zmqfqRSH5I4hnprz+R3pRUWN9oZn
	g0F6ycjm7I9blaC4gbdY2VYmnLVQafOpTtNCjMsQ5zjmdvJ0c52w9kiWHVMQlCiF
	v5QSrjal6z7t8ru5XG3uRDs7dPZtQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukeaqgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 04:56:28 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5894uSaW004021;
	Tue, 9 Sep 2025 04:56:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukeaqgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 04:56:27 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58909KLM011446;
	Tue, 9 Sep 2025 04:56:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9u9j86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 04:56:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5894uN5V20840816
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Sep 2025 04:56:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E36920043;
	Tue,  9 Sep 2025 04:56:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54EA320040;
	Tue,  9 Sep 2025 04:56:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.199.159])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 Sep 2025 04:56:20 +0000 (GMT)
From: Aditya Bodkhe <adityab1@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, rostedt@goodmis.org, mhiramat@kernel.org,
        mark.rutland@arm.com, Aditya Bodkhe <adityab1@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v3 1/2] powerpc/ftrace: support CONFIG_FUNCTION_GRAPH_RETVAL
Date: Tue,  9 Sep 2025 10:26:14 +0530
Message-ID: <20250909045615.50251-1-adityab1@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfX93tzDl9Pzve8
 bxnJW8i7jTlwnuqk/O08g+lcuafogu0UCvf4xHINV4zO4prd2IghtkFyOMk1Hmnm4mEEROIDfFD
 kxM3whABviUsSlCXoJ/yPP6hplT0cY50Sq1bYUAbTi/T6hrJN5e+egB7aPL4OHPvfijYHZrvE1r
 UCUbqn7B5jvKW6ZDN7obSz5rtmRFHfqjrv5dqkrtTMZYjqhqNcO9vCT8kEji9K+ByQbx0x5WH8s
 UZSSYfJxoOf4vYZy+uT6DkQPakPNvAgox4l2i+ylZJqH2lVg9ucMowRqqpRwKLTxajQekBtLM4M
 DaqeY36heu6t4wxd5G7sHkCUgLxGdmeveuhaijFPdHIyAiobs3Q/9gq5PdYmax5pAwQhU1JMQFY
 nbPssjIt
X-Proofpoint-ORIG-GUID: H3uRPYvDRMYUxZqCJCyovK7UBrvoMMLz
X-Proofpoint-GUID: LmQuJcJQL1vpTCKNXmkETHON3xB_lgXM
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68bfb37c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8
 a=qcD_9p-UOgwsSRV2Pq8A:9 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
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
- 'ftrace_regs_get_frame_pointer()' - always returns 0 in current code .

We also allocate stack space to equivalent of 'SWITCH_FRAME_SIZE',
allowing us to directly use predefined offsets like 'GPR3' and 'GPR4'
this keeps code clean and consistent with already defined offsets .

After this patch, v6.14+ kernel can also be built with FPROBE on powerpc
but there are a few other build and runtime dependencies for FPROBE to
work properly. The next patch addresses them.

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aditya Bodkhe <adityab1@linux.ibm.com>
---

Changelog:
v2 -> v3:
- Rebase on Linux 6.17-rc4 

v2:https://lore.kernel.org/all/20250722085648.1640-1-adityab1@linux.ibm.com/ 

v1 -> v2:
- Added explanation for redefining ftrace_regs_get_return_value()
and ftrace_regs_get_frame_pointer()
- Explained why stack space equivalent to 'SWITCH_FRAME_SIZE' is allocated.

v1:https://lore.kernel.org/all/20250528134820.74121-1-adityab1@linux.ibm.com/ 

---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/include/asm/ftrace.h        | 15 +++++++++
 arch/powerpc/kernel/trace/ftrace_entry.S | 42 ++++++++++++++----------
 3 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9f..451d0e140051 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -246,6 +246,7 @@ config PPC
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
index 3565c67fc638..6599fe3c6234 100644
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
+	/* Save previous stack pointer (r1) */
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
+	/* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
+	addi	r3, r1, STACK_INT_FRAME_REGS
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
+	/* pass ftrace_regs/pt_regs to ftrace_return_to_handler */
+	addi	r3, r1, STACK_INT_FRAME_REGS
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
2.51.0


