Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790F86CFAF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCJk28Jlz3fW2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyf/yyol;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iyf/yyol;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCFz5ZwKz3chw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U3bkJZ008996;
	Thu, 30 Mar 2023 05:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0S3grYh8nBoHowjAd8/XMG71HPN+3pbrCfsSZU7hoLw=;
 b=iyf/yyolTvUYZqzoDobJnuUrC0uBVph8QiJ9S/4+PNbJT2E3bKMn8m9C33yjcFd86ytJ
 Nnw8e/kvTTLGVuiMp0a8GFjWatvYceYjELaNwbkAmLnY9hpQh2Z5YXCOQHM/+1SpVOPh
 t6RtWlZQKq00NYjtqRbViqA8kV38UsVlQ4YXlzz8ilM/Y8GBtYnW/seKjFqxyoa0eF3Z
 i5rf9GQPGzIqRmta6IM3NRQoHKgLsO7TLip2Xt3w1sDIFRFB1zdkeDrY1+hTNDtWu+ZK
 qBOCWA5o7z1lHxYVOVU26Ym0DH4UHQhDpI8G5X3RWKg6naCr0ruMn2TJpWvCI6iNvWoN ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmnusy5s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5kqEE019023;
	Thu, 30 Mar 2023 05:50:57 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmnusy5rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32U3vZ9W006447;
	Thu, 30 Mar 2023 05:50:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3phrk6vk92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5oqRF16122406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DA0020043;
	Thu, 30 Mar 2023 05:50:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D3BC20040;
	Thu, 30 Mar 2023 05:50:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:51 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4905F60488;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 04/12] powerpc/dexcr: Handle hashchk exception
Date: Thu, 30 Mar 2023 16:50:32 +1100
Message-Id: <20230330055040.434133-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330055040.434133-1-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tCYOLkUh69S64TOyFEmB3GI89iOa_AHg
X-Proofpoint-ORIG-GUID: LMXUYtoojROHl1bs6pj6agxeCF6JuO76
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=665 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303300043
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
Cc: npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recognise and pass the appropriate signal to the user program when a
hashchk instruction triggers. This is independent of allowing
configuration of DEXCR[NPHIE], as a hypervisor can enforce this aspect
regardless of the kernel.

The signal mirrors how ARM reports their similar check failure. For
example, their FPAC handler in arch/arm64/kernel/traps.c do_el0_fpac()
does this. When we fail to read the instruction that caused the fault
we send a segfault, similar to how emulate_math() does it.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1:	* Refactor the hashchk check to return 0 on success, an error
	  code on failure. Determine what to do based on specific error
	  code.
	* Motivate signal and code
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/include/asm/processor.h  |  9 +++++++
 arch/powerpc/kernel/Makefile          |  1 +
 arch/powerpc/kernel/dexcr.c           | 36 +++++++++++++++++++++++++++
 arch/powerpc/kernel/traps.c           | 10 ++++++++
 5 files changed, 57 insertions(+)
 create mode 100644 arch/powerpc/kernel/dexcr.c

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 21e33e46f4b8..89b316466ed1 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -215,6 +215,7 @@
 #define OP_31_XOP_STFSX	    663
 #define OP_31_XOP_STFSUX    695
 #define OP_31_XOP_STFDX     727
+#define OP_31_XOP_HASHCHK   754
 #define OP_31_XOP_STFDUX    759
 #define OP_31_XOP_LHBRX     790
 #define OP_31_XOP_LFIWAX    855
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index e96c9b8c2a60..bad64d6a5d36 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -455,6 +455,15 @@ int exit_vmx_usercopy(void);
 int enter_vmx_ops(void);
 void *exit_vmx_ops(void *dest);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+int check_hashchk_trap(struct pt_regs const *regs);
+#else
+static inline int check_hashchk_trap(struct pt_regs const *regs)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_PROCESSOR_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9bf2be123093..07181e508754 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
 obj-$(CONFIG_PPC_DAWR)		+= dawr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= dexcr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
 obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_64e.o
 obj-$(CONFIG_PPC_BARRIER_NOSPEC) += security.o
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
new file mode 100644
index 000000000000..f263e5439cc6
--- /dev/null
+++ b/arch/powerpc/kernel/dexcr.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * DEXCR infrastructure
+ *
+ * Copyright 2023, Benjamin Gray, IBM Corporation.
+ */
+#include <linux/compiler_types.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/cputable.h>
+#include <asm/disassemble.h>
+#include <asm/errno.h>
+#include <asm/inst.h>
+#include <asm/ppc-opcode.h>
+#include <asm/ptrace.h>
+#include <asm/reg.h>
+
+int check_hashchk_trap(struct pt_regs const *regs)
+{
+	ppc_inst_t insn;
+
+	if (!cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		return -EINVAL;
+
+	if (!user_mode(regs))
+		return -EINVAL;
+
+	if (get_user_instr(insn, (void __user *)regs->nip))
+		return -EFAULT;
+
+	if (ppc_inst_primary_opcode(insn) != 31 ||
+	    get_xop(ppc_inst_val(insn)) != OP_31_XOP_HASHCHK)
+		return -EINVAL;
+
+	return 0;
+}
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 9bdd79aa51cf..ade67e23b974 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1516,6 +1516,16 @@ static void do_program_check(struct pt_regs *regs)
 				return;
 			}
 		}
+
+		switch (check_hashchk_trap(regs)) {
+		case 0:
+			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
+			return;
+		case -EFAULT:
+			_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
+			return;
+		}
+
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
 		return;
 	}
-- 
2.39.2

