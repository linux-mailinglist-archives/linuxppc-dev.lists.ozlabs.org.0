Return-Path: <linuxppc-dev+bounces-1398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5479798E9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 22:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6L421FSDz3023;
	Mon, 16 Sep 2024 06:58:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726433906;
	cv=none; b=i7lK4YJ2dxl24DgAd5p3l7hLSztKuUBHUFhQSrjaEinWUrrCAz6T96hx0MbR6lFwH+LLt+/AOb/S8ZsRKnZSmuVdhRflbSUmE7+VSKs+djTu60f/0EAdosPE4bUkqusjm+/Sds9YH0e41gxH6eqnnUSLdbBvvp3laHj2VLWy84PNn94ablMWaheTr/RBg0+VfkmcIBdQ3XrAm2UfEJDAkPbETtd4Y9hgfglD3VmUUhHbxG0ZKSc+n2a9hhOb9KkADLXS2zwm16fvDF6S+XELkKsawIVh/57FnXiJ9yhaDSrZfh4zCIm6EWpLrQcbFLVjg9xENt/alVuwy3j1O4/+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726433906; c=relaxed/relaxed;
	bh=NTV4rEsEwny7+HfVaXqhneVpQdPF8AFWkiGxagEtKcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bk15iI8U+UK8lbmEDCGZ9gi+Bm9uwFN9eVtVgLQc6WwgUT1S9NEmUwfonjeV+jGi99F+r0/9HsuasuRQShI0jmy3D+kyuVD2p7/T6MRlC8gWed9xM0MbhK/953wgXea1FNsZHS1mX4IxX/h++zAhT48jVQxKLofCCB7aIOBHl11NPimW0xfiqaMQKFNExl/sdjSge3tBcGxgug+ukK6aNwztgAgFcP5pX+n4wwhslZPor7pjdi6BhuQCC2fZMUWdoCXJH9XqjvUPbJgaIcwu7g06207RbC8KzCWpx53t+ciMoDx7TJmpQMESTkoPZ97sHWgxX/jUWDtnzzdCIeep+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mlHIMOdS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mlHIMOdS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6L415YlCz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 06:58:25 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FKEP3T018406;
	Sun, 15 Sep 2024 20:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=NTV4rEsEwny7+
	HfVaXqhneVpQdPF8AFWkiGxagEtKcU=; b=mlHIMOdSIeQVpbOTp/nuf4AfDh1kw
	kpzqJe2UR3sycJJeFg1LYUaMH6Ay1WF5n4p0e1OSUg1ynorg4MfDS0NwkppuH08z
	QDCqgIBvsIjBg3UAmpyMQ1DLu4VjnYmF9GPWrO3gVrCcxxf8t0UUFYhRAKAdiei0
	gBypnzfI2JQjJIfZBvrD4z1Iu1nEdDZyWZ/F/b/WcOBc/TdB8YvJwHDyOAmIpAIL
	IhWl+Fa4+qEwNNJTA/joyxw0g4NYvodZCnAW4JJbGVCCmLYISYYf/pupVWcFn5gI
	jh+FZ6nISYWCcgPakfU9PlGtTToMGzr0flnxTzgQ8RqH5GNs86pxZTWsg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uhxdxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:58:05 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48FKw59L029285;
	Sun, 15 Sep 2024 20:58:05 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3uhxdxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:58:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48FIrAET000641;
	Sun, 15 Sep 2024 20:58:03 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41nn70uw9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Sep 2024 20:58:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48FKvxvI14156170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Sep 2024 20:58:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8CEA20040;
	Sun, 15 Sep 2024 20:57:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 758FB20049;
	Sun, 15 Sep 2024 20:57:56 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.68.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Sep 2024 20:57:56 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: "Naveen N. Rao" <naveen@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v5 16/17] samples/ftrace: Add support for ftrace direct samples on powerpc
Date: Mon, 16 Sep 2024 02:26:47 +0530
Message-ID: <20240915205648.830121-17-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240915205648.830121-1-hbathini@linux.ibm.com>
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XZjiBgi2xQanYfSUZWIPfZmpUbWmLdw5
X-Proofpoint-GUID: KgJrMr_qfw4Mkl_LI7adBQSwPf80SLhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_12,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=917 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409150159

From: Naveen N Rao <naveen@kernel.org>

Add powerpc 32-bit and 64-bit samples for ftrace direct. This serves to
show the sample instruction sequence to be used by ftrace direct calls
to adhere to the ftrace ABI.

On 64-bit powerpc, TOC setup requires some additional work.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                        |   2 +
 samples/ftrace/ftrace-direct-modify.c       |  85 +++++++++++++++-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 +++++++++++++++++++-
 samples/ftrace/ftrace-direct-multi.c        |  79 ++++++++++++++-
 samples/ftrace/ftrace-direct-too.c          |  83 +++++++++++++++-
 samples/ftrace/ftrace-direct.c              |  69 ++++++++++++-
 6 files changed, 414 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ef845ea4dd27..1e093ed287fe 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -275,6 +275,8 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 81220390851a..cfea7a38befb 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -199,6 +199,89 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+"	bl		my_direct_func1\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+"	bl		my_direct_func2\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static unsigned long my_tramp = (unsigned long)my_tramp1;
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index f943e40d57fd..8f7986d698d8 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -225,6 +225,105 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#define PPC_FTRACE_RECOVER_IP				\
+"	lwz		8, 4(3)\n"			\
+"	li		9, 6\n"				\
+"	slw		8, 8, 9\n"			\
+"	sraw		8, 8, 9\n"			\
+"	add		3, 3, 8\n"			\
+"	addi		3, 3, 4\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#define PPC_FTRACE_RECOVER_IP ""
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func1\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func2\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+	"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static unsigned long my_tramp = (unsigned long)my_tramp1;
 static unsigned long tramps[2] = {
 	(unsigned long)my_tramp1,
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index aed6df2927ce..db326c81a27d 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -4,7 +4,7 @@
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
 #include <linux/sched/stat.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -141,6 +141,83 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#define PPC_FTRACE_RECOVER_IP				\
+"	lwz		8, 4(3)\n"			\
+"	li		9, 6\n"				\
+"	slw		8, 8, 9\n"			\
+"	sraw		8, 8, 9\n"			\
+"	add		3, 3, 8\n"			\
+"	addi		3, 3, 4\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#define PPC_FTRACE_RECOVER_IP ""
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_multi_init(void)
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index 6ff546a5d7eb..3d0fa260332d 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -3,7 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -153,6 +153,87 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 64
+#define STACK_FRAME_ARG1 32
+#define STACK_FRAME_ARG2 40
+#define STACK_FRAME_ARG3 48
+#define STACK_FRAME_ARG4 56
+#else
+#define STACK_FRAME_SIZE 32
+#define STACK_FRAME_ARG1 16
+#define STACK_FRAME_ARG2 20
+#define STACK_FRAME_ARG3 24
+#define STACK_FRAME_ARG4 28
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_ARG1)"(1)\n"
+	PPC_STL"	4, "__stringify(STACK_FRAME_ARG2)"(1)\n"
+	PPC_STL"	5, "__stringify(STACK_FRAME_ARG3)"(1)\n"
+	PPC_STL"	6, "__stringify(STACK_FRAME_ARG4)"(1)\n"
+"	bl		my_direct_func\n"
+	PPC_LL"		6, "__stringify(STACK_FRAME_ARG4)"(1)\n"
+	PPC_LL"		5, "__stringify(STACK_FRAME_ARG3)"(1)\n"
+	PPC_LL"		4, "__stringify(STACK_FRAME_ARG2)"(1)\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_ARG1)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index ef0945670e1e..956834b0d19a 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -3,7 +3,7 @@
 
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -134,6 +134,73 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	bl		my_direct_func\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
-- 
2.46.0


