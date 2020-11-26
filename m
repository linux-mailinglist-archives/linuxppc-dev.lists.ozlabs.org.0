Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 264782C5BEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 19:24:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChmP74fZBzDrNw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 05:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rssAqDZ2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Chm4v2zwMzDrN0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 05:10:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AQI2WqN011183; Thu, 26 Nov 2020 13:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ULChrGupF18dnNEyzbnRMep8LQr1A0a0FIOtr61hb2k=;
 b=rssAqDZ2Dg4/VtowRvnX3EU/xXZemqOHKGJzgoXp/A8h49eSUdWLQoHF+SJXmEg7v7wS
 Cg915LY+TuWcEol0CSOIx8L9RIcF+E6VTTosb0jozcM4Mv2THv90iKAeHsEz5JGqSE8b
 VIx6k8TUi44hfeq8BgICRh5q5ASQpegqL2+Agee7WHo4IaKdOjll0TSIpvGVtPXyI0kw
 RawM6iL2OAmn5vymk3G5fzvMsPXO9+opvzZyNTk8q299bOAWVL8EGJciTKtNY/mF4Iqc
 rcuCBHK1UdFOnr0K3oOiQDdaSHzyisRkyfhR8sXKQDwHZmz10kJaaQljSTQqe4I/hUqU aA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352ccerj4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 13:09:36 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AQI8EOD011512;
 Thu, 26 Nov 2020 18:09:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 34xth8dw6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 18:09:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AQI9Vst10551994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Nov 2020 18:09:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CABCBA405F;
 Thu, 26 Nov 2020 18:09:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03592A4054;
 Thu, 26 Nov 2020 18:09:30 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.81.45])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Nov 2020 18:09:29 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [RFC PATCH 06/14] powerpc: Add support for
 CONFIG_HAVE_FUNCTION_ARG_ACCESS_API
Date: Thu, 26 Nov 2020 23:38:43 +0530
Message-Id: <907637b5f6bbd5fdd8f8a1c165539c7d919a1d5c.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1606412433.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-26_08:2020-11-26,
 2020-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011260108
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add register_get_kernel_argument() for a rudimentary way to access
kernel function arguments.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/ptrace.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe084929b..cfc6dd787f532c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -202,6 +202,7 @@ config PPC
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS	if !(CPU_LITTLE_ENDIAN && POWER7_CPU)
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
+	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index e2c778c176a3a6..956828c07abd70 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -62,6 +62,8 @@ struct pt_regs
 };
 #endif
 
+#define NR_REG_ARGUMENTS 8
+
 #ifdef __powerpc64__
 
 /*
@@ -85,8 +87,10 @@ struct pt_regs
 
 #ifdef PPC64_ELF_ABI_v2
 #define STACK_FRAME_MIN_SIZE	32
+#define STACK_FRAME_PARM_SAVE	32
 #else
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
+#define STACK_FRAME_PARM_SAVE	48
 #endif
 
 /* Size of dummy stack frame allocated when calling signal handler. */
@@ -103,6 +107,7 @@ struct pt_regs
 #define STACK_INT_FRAME_SIZE	(sizeof(struct pt_regs) + STACK_FRAME_OVERHEAD)
 #define STACK_FRAME_MARKER	2
 #define STACK_FRAME_MIN_SIZE	STACK_FRAME_OVERHEAD
+#define STACK_FRAME_PARM_SAVE	8
 
 /* Size of stack frame allocated when calling signal handler. */
 #define __SIGNAL_FRAMESIZE	64
@@ -309,6 +314,32 @@ static inline unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
 		return 0;
 }
 
+/**
+ * regs_get_kernel_argument() - get Nth function argument in kernel
+ * @regs:	pt_regs of that context
+ * @n:		function argument number (start from 0)
+ *
+ * regs_get_argument() returns @n th argument of the function call.
+ * Note that this chooses most probable assignment, and is incorrect
+ * in scenarios where double or fp/vector parameters are involved.
+ * This also doesn't take into account stack alignment requirements.
+ *
+ * This is expected to be called from kprobes or ftrace with regs
+ * at function entry, so the current function has not setup its stack.
+ */
+static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
+						     unsigned int n)
+{
+	if (n >= NR_REG_ARGUMENTS) {
+#ifndef __powerpc64__
+		n -= NR_REG_ARGUMENTS;
+#endif
+		n += STACK_FRAME_PARM_SAVE / sizeof(unsigned long);
+		return regs_get_kernel_stack_nth(regs, n);
+	} else {
+		return regs_get_register(regs, offsetof(struct pt_regs, gpr[n + 3]));
+	}
+}
 #endif /* __ASSEMBLY__ */
 
 #ifndef __powerpc64__
-- 
2.25.4

