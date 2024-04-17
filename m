Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C638B8A8211
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:27:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wj48OupW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJXj49jpz3vl7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wj48OupW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSs0NHgz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:56 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBKbHI000882;
	Wed, 17 Apr 2024 11:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Mr2kOwQSc1ll24+IfhRnodJmu3gZbtuSsqoODcFJo/Y=;
 b=Wj48OupWoWjUt7aYCzGCctOgAbluF7Wcmzqk/YUdlDuxsyO1QEooBJu0w/1+GVI0y9Po
 LqMNri1Zv+i+vQDD2dwT+v11c4tsFmm3Ka71nx06OMEN6DP9fa5qVoTLNCNs4VPZ8Ob/
 4IZX+pFuQxeb/gi6Hhh1jzmEoYY+B+32k5ewNpWOZ9dwoCigkUlKIP0sotZ14Y/7F9aL
 KAcpzzGT6XF+tM0Wi+2uNAAD6pCGEucZnbw9eGvQN5dX9oB7i5Rt7LJkk39B0y/JN8Yt
 5ad7gjeplgcahzKIRikPEUSO/f+ZsrONCmjdS0+9KDD/nH8raHZ2S7HigecHZel7GHAE kw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjd4fr1b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:51 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H89Lx3027304;
	Wed, 17 Apr 2024 11:23:50 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg4s043t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:50 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNkCL48038176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9519020043;
	Wed, 17 Apr 2024 11:23:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A778A20040;
	Wed, 17 Apr 2024 11:23:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:45 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A268D6083B;
	Wed, 17 Apr 2024 21:23:42 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 3/9] powerpc/dexcr: Reset DEXCR value across exec
Date: Wed, 17 Apr 2024 21:23:19 +1000
Message-ID: <20240417112325.728010-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y_PNSSugqORmdu_GqR4yNOFamNFjnl8H
X-Proofpoint-GUID: Y_PNSSugqORmdu_GqR4yNOFamNFjnl8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxlogscore=942
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Inheriting the DEXCR across exec can have security and usability
concerns. If a program is compiled with hash instructions it generally
expects to run with NPHIE enabled. But if the parent process disables
NPHIE then if it's not careful it will be disabled for any children too
and the protection offered by hash checks is basically worthless.

This patch introduces a per-process reset value that new execs in a
particular process tree are initialized with. This enables fine grained
control over what DEXCR value child processes run with by default. For
example, containers running legacy binaries that expect hash
instructions to act as NOPs could configure the reset value of the
container root to control the default reset value for all members of the
container.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

This differs from the previous iterations by making the reset value
totally independent of the process's current DEXCR value. The original
iterations stored an 'inherit' bitmask, where the mask decides which of
the current DEXCR aspects are kept across exec, and the others are reset
to a fixed default.

That approach has a flaw when trying to prevent unauthorized inherited
hash check disabling. With a hierarchy A -> B -> C of process execs,
suppose A is privileged and enables NPHIE as an inherited aspect. If B
is unprivileged but clears its NPHIE aspect, the clear is
unintentionally inherited down to C as well (which may be setuid).

This new approach lets processes control the reset value directly
without any reference to the values the process itself is using.
Compared to the original approach, we don't run into an issue where an
unprivileged middle child ever controls the reset value.
---
 arch/powerpc/include/asm/processor.h |  2 +-
 arch/powerpc/kernel/Makefile         |  1 +
 arch/powerpc/kernel/dexcr.c          | 21 +++++++++++++++++++++
 arch/powerpc/kernel/process.c        |  7 +++++++
 4 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/kernel/dexcr.c

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 882e31296ea6..aad85a24134a 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -261,7 +261,7 @@ struct thread_struct {
 	unsigned long   sier3;
 	unsigned long	hashkeyr;
 	unsigned long	dexcr;
-
+	unsigned long	dexcr_onexec;	/* Reset value to load on exec */
 #endif
 };
 
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index d3282fbea4f2..1d183b077948 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_DAWR)		+= dawr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= dexcr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
 obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_64e.o
 obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
new file mode 100644
index 000000000000..f65c359968cc
--- /dev/null
+++ b/arch/powerpc/kernel/dexcr.c
@@ -0,0 +1,21 @@
+#include <linux/capability.h>
+#include <linux/cpu.h>
+#include <linux/init.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/cputable.h>
+#include <asm/processor.h>
+#include <asm/reg.h>
+
+static int __init init_task_dexcr(void)
+{
+	if (!early_cpu_has_feature(CPU_FTR_ARCH_31))
+		return 0;
+
+	current->thread.dexcr_onexec = mfspr(SPRN_DEXCR);
+
+	return 0;
+}
+early_initcall(init_task_dexcr)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index d482c3fd81d7..8ab779a3bdde 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1641,6 +1641,13 @@ void arch_setup_new_exec(void)
 	current->thread.regs->amr  = default_amr;
 	current->thread.regs->iamr  = default_iamr;
 #endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		current->thread.dexcr = current->thread.dexcr_onexec;
+		mtspr(SPRN_DEXCR, current->thread.dexcr);
+	}
+#endif /* CONFIG_PPC_BOOK3S_64 */
 }
 
 #ifdef CONFIG_PPC64
-- 
2.44.0

