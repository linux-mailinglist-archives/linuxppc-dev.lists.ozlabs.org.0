Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 404724EC633
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 16:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7by0QfKz308B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 01:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T0CZyg5y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T0CZyg5y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7Yj6zm2z2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 01:07:53 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBvYRs000462; 
 Wed, 30 Mar 2022 14:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cn8YbZCuUcFr3TYEnoDpf1/ppdBGQ/6Y/74D75Go+YI=;
 b=T0CZyg5ygaIpm3ukBtQBsEMPDq116WimJhMhrnDgvsSNwDSahccsL7sJz0q3r640m/kZ
 qPcTGZcTWUeTeMJIKClTJjzXROd1I8z35cuUUJs5qH3SsSulx2943h3huu6I81nob5gO
 IlwMxFsAS00vkgSiEmx8DU05xwe4tgLxytw71DV8tX9VU6EtGcux55VBmADwJFOqyCLm
 q5MiEt9jWqaK4U2yTImctk35kJuT4udx50Et3fgmX8uHtP2R8fIETVLd0U12TeLcdKbz
 ZvSvfAzc+OXlPTdC8Rlvnoiyysf8LMkj3vYOUumEzJXLoOuaFjPNR7LdjJiipDUx3mVe Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4psu2x1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:45 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UE4DJm018703;
 Wed, 30 Mar 2022 14:07:45 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4psu2x09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UE2RXe012002;
 Wed, 30 Mar 2022 14:07:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3f1t3hyfmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UE7df234734342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 14:07:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC498A4053;
 Wed, 30 Mar 2022 14:07:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30FD3A404D;
 Wed, 30 Mar 2022 14:07:38 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.30.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 14:07:37 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, mopsfelder@gmail.com
Subject: [PATCH v2 2/3] powerpc: Reject probes on instructions that can't be
 single stepped
Date: Wed, 30 Mar 2022 19:37:18 +0530
Message-Id: <f56ee979d50b8711fae350fc97870f3ca34acd75.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ir538Epise0dv-_wJLtAcmI1grm9CHBf
X-Proofpoint-GUID: UE8X2SQAYV3G-F6BlJJeeJgTsVnoxaKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=617
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300069
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Per the ISA, a Trace interrupt is not generated for:
- [h|u]rfi[d]
- rfscv
- sc, scv, and Trap instructions that trap
- Power-Saving Mode instructions
- other instructions that cause interrupts (other than Trace interrupts)
- the first instructions of any interrupt handler (applies to Branch and Single Step tracing;
CIABR matches may still occur)
- instructions that are emulated by software

Add a helper to check for instructions belonging to the first four
categories above and to reject kprobes, uprobes and xmon breakpoints on
such instructions. We reject probing on instructions belonging to these
categories across all ISA versions and across both BookS and BookE.

For trap instructions, we can't know in advance if they can cause a
trap, and there is no good reason to allow probing on those. Also,
uprobes already refuses to probe trap instructions and kprobes does not
allow probes on trap instructions used for kernel warnings and bugs. As
such, stop allowing any type of probes/breakpoints on trap instruction
across uprobes, kprobes and xmon.

For some of the fp/altivec instructions that can generate an interrupt
and which we emulate in the kernel (altivec assist, for example), we
check and turn off single stepping in emulate_single_step().

Instructions generating a DSI are restarted and single stepping normally
completes once the instruction is completed.

In uprobes, if a single stepped instruction results in a non-fatal
signal to be delivered to the task, such signals are "delayed" until
after the instruction completes. For fatal signals, single stepping is
cancelled and the instruction restarted in-place so that core dump
captures proper addresses.

In kprobes, we do not allow probes on instructions having an extable
entry and we also do not allow probing interrupt vectors.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 18 ++++++++++++++
 arch/powerpc/include/asm/probes.h     | 36 +++++++++++++++++++++++++++
 arch/powerpc/kernel/kprobes.c         |  4 +--
 arch/powerpc/kernel/uprobes.c         |  5 ++++
 arch/powerpc/xmon/xmon.c              | 11 ++++----
 5 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index a5d89cd3e8d12d..683e9bc618a74d 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -130,6 +130,8 @@
 #define OP_PREFIX	1
 #define OP_TRAP_64	2
 #define OP_TRAP		3
+#define OP_SC		17
+#define OP_19		19
 #define OP_31		31
 #define OP_LWZ		32
 #define OP_LWZU		33
@@ -159,6 +161,20 @@
 #define OP_LD		58
 #define OP_STD		62
 
+#define OP_19_XOP_RFID		18
+#define OP_19_XOP_RFMCI		38
+#define OP_19_XOP_RFDI		39
+#define OP_19_XOP_RFI		50
+#define OP_19_XOP_RFCI		51
+#define OP_19_XOP_RFSCV		82
+#define OP_19_XOP_HRFID		274
+#define OP_19_XOP_URFID		306
+#define OP_19_XOP_STOP		370
+#define OP_19_XOP_DOZE		402
+#define OP_19_XOP_NAP		434
+#define OP_19_XOP_SLEEP		466
+#define OP_19_XOP_RVWINKLE	498
+
 #define OP_31_XOP_TRAP      4
 #define OP_31_XOP_LDX       21
 #define OP_31_XOP_LWZX      23
@@ -179,6 +195,8 @@
 #define OP_31_XOP_LHZUX     311
 #define OP_31_XOP_MSGSNDP   142
 #define OP_31_XOP_MSGCLRP   174
+#define OP_31_XOP_MTMSR     146
+#define OP_31_XOP_MTMSRD    178
 #define OP_31_XOP_TLBIE     306
 #define OP_31_XOP_MFSPR     339
 #define OP_31_XOP_LWAX      341
diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm/probes.h
index c5d984700d241a..6f66e358aa3780 100644
--- a/arch/powerpc/include/asm/probes.h
+++ b/arch/powerpc/include/asm/probes.h
@@ -8,6 +8,7 @@
  * Copyright IBM Corporation, 2012
  */
 #include <linux/types.h>
+#include <asm/disassemble.h>
 
 typedef u32 ppc_opcode_t;
 #define BREAKPOINT_INSTRUCTION	0x7fe00008	/* trap */
@@ -31,6 +32,41 @@ typedef u32 ppc_opcode_t;
 #define MSR_SINGLESTEP	(MSR_SE)
 #endif
 
+static inline bool can_single_step(u32 inst)
+{
+	switch (get_op(inst)) {
+	case OP_TRAP_64:	return false;
+	case OP_TRAP:		return false;
+	case OP_SC:		return false;
+	case OP_19:
+		switch (get_xop(inst)) {
+		case OP_19_XOP_RFID:		return false;
+		case OP_19_XOP_RFMCI:		return false;
+		case OP_19_XOP_RFDI:		return false;
+		case OP_19_XOP_RFI:		return false;
+		case OP_19_XOP_RFCI:		return false;
+		case OP_19_XOP_RFSCV:		return false;
+		case OP_19_XOP_HRFID:		return false;
+		case OP_19_XOP_URFID:		return false;
+		case OP_19_XOP_STOP:		return false;
+		case OP_19_XOP_DOZE:		return false;
+		case OP_19_XOP_NAP:		return false;
+		case OP_19_XOP_SLEEP:		return false;
+		case OP_19_XOP_RVWINKLE:	return false;
+		}
+		break;
+	case OP_31:
+		switch (get_xop(inst)) {
+		case OP_31_XOP_TRAP:		return false;
+		case OP_31_XOP_TRAP_64:		return false;
+		case OP_31_XOP_MTMSR:		return false;
+		case OP_31_XOP_MTMSRD:		return false;
+		}
+		break;
+	}
+	return true;
+}
+
 /* Enable single stepping for the current task */
 static inline void enable_single_step(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9a492fdec1dfbe..0936a6c8c256b9 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -129,8 +129,8 @@ int arch_prepare_kprobe(struct kprobe *p)
 	if ((unsigned long)p->addr & 0x03) {
 		printk("Attempt to register kprobe at an unaligned address\n");
 		ret = -EINVAL;
-	} else if (IS_MTMSRD(insn) || IS_RFID(insn)) {
-		printk("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
+	} else if (!can_single_step(ppc_inst_val(insn))) {
+		printk("Cannot register a kprobe on instructions that can't be single stepped\n");
 		ret = -EINVAL;
 	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
 		   ppc_inst_prefixed(ppc_inst_read(p->addr - 1))) {
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index c6975467d9ffdc..95a41ae9dfa755 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -48,6 +48,11 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
 		return -EINVAL;
 	}
 
+	if (!can_single_step(ppc_inst_val(ppc_inst_read(auprobe->insn)))) {
+		pr_info_ratelimited("Cannot register a uprobe on instructions that can't be single stepped\n");
+		return -ENOTSUPP;
+	}
+
 	return 0;
 }
 
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad502..a92c5739d954e2 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -921,9 +921,9 @@ static void insert_bpts(void)
 			bp->enabled = 0;
 			continue;
 		}
-		if (IS_MTMSRD(instr) || IS_RFID(instr)) {
-			printf("Breakpoint at %lx is on an mtmsrd or rfid "
-			       "instruction, disabling it\n", bp->address);
+		if (!can_single_step(ppc_inst_val(instr))) {
+			printf("Breakpoint at %lx is on an instruction that can't be single stepped, disabling it\n",
+					bp->address);
 			bp->enabled = 0;
 			continue;
 		}
@@ -1470,9 +1470,8 @@ static long check_bp_loc(unsigned long addr)
 		printf("Can't read instruction at address %lx\n", addr);
 		return 0;
 	}
-	if (IS_MTMSRD(instr) || IS_RFID(instr)) {
-		printf("Breakpoints may not be placed on mtmsrd or rfid "
-		       "instructions\n");
+	if (!can_single_step(ppc_inst_val(instr))) {
+		printf("Breakpoints may not be placed on instructions that can't be single stepped\n");
 		return 0;
 	}
 	return 1;
-- 
2.35.1

