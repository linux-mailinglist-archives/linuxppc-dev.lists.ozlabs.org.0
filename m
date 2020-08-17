Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AE246491
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:32:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVjV0FBKzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZWHYDnDD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVWv6x2HzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:24:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HA1OOu165560; Mon, 17 Aug 2020 06:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JH9fVNVopnEc5T/w26SW0BnlAhebizpHWgpXDm4bo8U=;
 b=ZWHYDnDDjJNJsK0uKygCzvvZZtbIUAcS0OjwneTtVmV63rfS4I8CTmmuOUCiyaW6wMd6
 9HXJZQg68t0uBiv1kBTUDvP+iG/LUyEyo86XmoHq4pbsrvlvjvZFud+uZcpDNta6bezo
 Z04+WwSPRNBB/BkdvZhMxB2OhQjL3V5AGLiAkft44+Y009l0/GQdJcosXsFaxctlmo0H
 8dYGLAZn4GebyQhmFpHW30KQJCQ/zzffaBbIMBiO+NJWvw4koOIhSBISHUb3x4hABoZQ
 blwabY2Fvuaz+Pe0ptPsuTtlGykFp/zSQqprAE7CBBmoOi39OuZn0EQfeFQHR9No8Ygu 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y7ayn6s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:05 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HA1fFa167408;
 Mon, 17 Aug 2020 06:24:04 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y7ayn6rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:04 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HALIeK015160;
 Mon, 17 Aug 2020 10:24:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 32x7b824na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:24:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07HANwo763373714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:23:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FD144C04E;
 Mon, 17 Aug 2020 10:23:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59C3A4C046;
 Mon, 17 Aug 2020 10:23:55 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.13])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:23:55 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v4 3/6] powerpc/watchpoint: Fix exception handling for
 CONFIG_HAVE_HW_BREAKPOINT=N
Date: Mon, 17 Aug 2020 15:53:27 +0530
Message-Id: <20200817102330.777537-4-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
References: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170071
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, rogealve@br.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jniethe5@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, ptrace watchpoint works in one-shot mode. i.e. kernel
disables event every time it fires and user has to re-enable it.
Also, in case of ptrace watchpoint, kernel notifies ptrace user
before executing instruction.

With CONFIG_HAVE_HW_BREAKPOINT=N, kernel is missing to disable
ptrace event and thus it's causing infinite loop of exceptions.
This is especially harmful when user watches on a data which is
also read/written by kernel, eg syscall parameters. In such case,
infinite exceptions happens in kernel mode which causes soft-lockup.

Fixes: 9422de3e953d ("powerpc: Hardware breakpoints rewrite to handle non DABR breakpoint registers")
Reported-by: Pedro Miraglia Franco de Carvalho <pedromfc@br.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/include/asm/hw_breakpoint.h  |  3 ++
 arch/powerpc/kernel/process.c             | 48 +++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-noadv.c |  5 +++
 3 files changed, 56 insertions(+)

diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index f71f08a7e2e0..90d5b3a9f433 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -18,6 +18,7 @@ struct arch_hw_breakpoint {
 	u16		type;
 	u16		len; /* length of the target data symbol */
 	u16		hw_len; /* length programmed in hw */
+	u8		flags;
 };
 
 /* Note: Don't change the first 6 bits below as they are in the same order
@@ -37,6 +38,8 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+#define HW_BRK_FLAG_DISABLED	0x1
+
 /* Minimum granularity */
 #ifdef CONFIG_PPC_8xx
 #define HW_BREAKPOINT_SIZE  0x4
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index e4fcc817c46c..cab6febe6eb6 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -636,6 +636,44 @@ void do_send_trap(struct pt_regs *regs, unsigned long address,
 				    (void __user *)address);
 }
 #else	/* !CONFIG_PPC_ADV_DEBUG_REGS */
+
+static void do_break_handler(struct pt_regs *regs)
+{
+	struct arch_hw_breakpoint null_brk = {0};
+	struct arch_hw_breakpoint *info;
+	struct ppc_inst instr = ppc_inst(0);
+	int type = 0;
+	int size = 0;
+	unsigned long ea;
+	int i;
+
+	/*
+	 * If underneath hw supports only one watchpoint, we know it
+	 * caused exception. 8xx also falls into this category.
+	 */
+	if (nr_wp_slots() == 1) {
+		__set_breakpoint(0, &null_brk);
+		current->thread.hw_brk[0] = null_brk;
+		current->thread.hw_brk[0].flags |= HW_BRK_FLAG_DISABLED;
+		return;
+	}
+
+	/* Otherwise findout which DAWR caused exception and disable it. */
+	wp_get_instr_detail(regs, &instr, &type, &size, &ea);
+
+	for (i = 0; i < nr_wp_slots(); i++) {
+		info = &current->thread.hw_brk[i];
+		if (!info->address)
+			continue;
+
+		if (wp_check_constraints(regs, instr, ea, type, size, info)) {
+			__set_breakpoint(i, &null_brk);
+			current->thread.hw_brk[i] = null_brk;
+			current->thread.hw_brk[i].flags |= HW_BRK_FLAG_DISABLED;
+		}
+	}
+}
+
 void do_break (struct pt_regs *regs, unsigned long address,
 		    unsigned long error_code)
 {
@@ -647,6 +685,16 @@ void do_break (struct pt_regs *regs, unsigned long address,
 	if (debugger_break_match(regs))
 		return;
 
+	/*
+	 * We reach here only when watchpoint exception is generated by ptrace
+	 * event (or hw is buggy!). Now if CONFIG_HAVE_HW_BREAKPOINT is set,
+	 * watchpoint is already handled by hw_breakpoint_handler() so we don't
+	 * have to do anything. But when CONFIG_HAVE_HW_BREAKPOINT is not set,
+	 * we need to manually handle the watchpoint here.
+	 */
+	if (!IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT))
+		do_break_handler(regs);
+
 	/* Deliver the signal to userspace */
 	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 57a0ab822334..866597b407bc 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -286,11 +286,16 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
 	}
 	return ret;
 #else /* CONFIG_HAVE_HW_BREAKPOINT */
+	if (child->thread.hw_brk[data - 1].flags & HW_BRK_FLAG_DISABLED)
+		goto del;
+
 	if (child->thread.hw_brk[data - 1].address == 0)
 		return -ENOENT;
 
+del:
 	child->thread.hw_brk[data - 1].address = 0;
 	child->thread.hw_brk[data - 1].type = 0;
+	child->thread.hw_brk[data - 1].flags = 0;
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
 	return 0;
-- 
2.26.2

