Return-Path: <linuxppc-dev+bounces-2714-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0D9B5C70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddYz3CDbz3bbp;
	Wed, 30 Oct 2024 18:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272231;
	cv=none; b=gV4pS3sBf4D3cZkQf1yFsja3Bqs+tLgkXEGlMSPXIeE/rP8ZnUHxBCcTnh9e0QVP+i+ndE8Yz61ZEQrB2UMA8bUxWtCBvhWT6sdowiM+RrSuBom67mPkABloJjxgBhuZUr5fylM0nimhHaVR5WsqPockw3IGYuSgNgTdGq9JjsyoKa03pzXmRrcymC7XXlb/lLlQOsX7/XH/ZeRBENPMvAMMH0aS1RhudE6vYNRej0hM8p6ViokAFUkJpFQy61PqVrmVJM9lMElgR3FL6PJcQj2hDh1EooQTn/mCntXrBvlBL1S38r6n0W/avCMI/oxf1aeMvNJk7+hUsdqvsPpZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272231; c=relaxed/relaxed;
	bh=oZ1AowApc/PRY0r87/lSl1Wjfw0qRgN5y5um+Kjjl7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzV6b9EKYZvvrPrOMpbq+gUZs3nBYw472yPVzHGbYPy6d+g7lE6kzYQpXA4W9pysC/bTsagaaOadqT1OkM+0oXYKqh6MEa/6uYHdKRoiGcZVQS8GCgd4wAPHZF87Ddg5F8cw1ZvO8+cOUu2t08n5NSIFLQpY7HFDn9HHxJCe8UNlg8ICUumJpsPai5WSjSMpWP7MrtYuCQBaS3n+o0JH7RhLLQpYHPg9sVtQ6suE3vDILPdH30e/rqxoMLm5uGyfWyHw4jFk308k1Ngu/g95sEnACVvlXg2EbNf1xPQ7UFQnku2ctF7oS7QE/8Bf7Vr+N8S/OFftFUXtSAe49M6v8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEqbaQXr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KEqbaQXr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddYy2TPCz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:10:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2dDRM025977;
	Wed, 30 Oct 2024 07:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=oZ1AowApc/PRY0r87
	/lSl1Wjfw0qRgN5y5um+Kjjl7A=; b=KEqbaQXrRynNEeAPvzcjBw2xIDS49CdYP
	QWbr8oQV8Ac2DTAANMJ/PlD3Whx92NKXDIGBLjhNmrqwOdG62R6Nz8BVaZOjmiAQ
	jh9Cw++uXfXMJ1rByFac1R74x8GTROsSRFlS12rJx/J7z0asOHrKtyBGo7mIHAne
	l3ALnwtLNQNcpj1/KFDyXSqmbACYsBnpuDczhI/i5lNB1AZBVlrNnyZWR2yjLhDj
	u1/+k7RzuKVl0dlmGUAQSnrGDzXzh2jlVmmCOKvWwT19ZiQfnJ0CVTS5iWp3t19a
	QNpu87+1xbCXwmesRBaMvkTPbST72YI43t1NYAqq8NSHRv1mcle1w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jb65h31p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:10:05 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U7A47B020264;
	Wed, 30 Oct 2024 07:10:04 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42jb65h31g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:10:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U6Fq7h017313;
	Wed, 30 Oct 2024 07:10:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42harsf3r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:10:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U79xZO55836950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:10:00 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D34B72004D;
	Wed, 30 Oct 2024 07:09:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EB4920043;
	Wed, 30 Oct 2024 07:09:56 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:09:56 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v7 16/17] samples/ftrace: Add support for ftrace direct samples on powerpc
Date: Wed, 30 Oct 2024 12:38:49 +0530
Message-ID: <20241030070850.1361304-17-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ApWN3iQfSSLBXpmr9kfI1z1tgQ00qjKB
X-Proofpoint-GUID: 7frY_guCnwMQrJ0q6ccn_3Wi4vkeEPku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=968
 impostorscore=0 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
index 73e9e42b2e75..a9dd4c39ec00 100644
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
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
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
2.47.0


