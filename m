Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0934EC637
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 16:10:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7cj317dz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 01:10:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Li/YNSC+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Li/YNSC+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7Ym0fdQz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 01:07:55 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UDioCN019085; 
 Wed, 30 Mar 2022 14:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DSSi90HA3kIr2aEYvWpaL1Y+vIyopACLH4lQpBLTkRY=;
 b=Li/YNSC+f1HM+JA96S0Nt7pX0x/s+AhB+3UFI63zXKxiNVKHiiDf+t1T5SD/f/xM+mVU
 4yPSMDJV2SOFOjVyxSO/evKQ2oln1RxRWMBJviqBP4gGbR1j7O5ChPK4dCImxcEJzbRS
 vB5uisZoafp9rVqYkt5mhuc0O2ksJYQLRJzWo2EtdUf18AM815sEHThINB6FZ7vRcp3p
 pkogwJGqo61jncD9xQVyJWV7fZ9vvL/aqL05YfEJh6Vd1m1BmutM/dSXhjlaPdV287Rf
 4+mj33D0cZoAf3RnfwNQDEEhiEYVeSoGnnnA8lkbEubZTXVktfj64uwwt7kdPUPgv3lW fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4rc1ggd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:47 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UDlb5f028915;
 Wed, 30 Mar 2022 14:07:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4rc1ggch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:46 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UE3K1L030605;
 Wed, 30 Mar 2022 14:07:44 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3kr6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:44 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UE7fr436241884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 14:07:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C93EFA405D;
 Wed, 30 Mar 2022 14:07:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37681A4040;
 Wed, 30 Mar 2022 14:07:40 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.30.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 14:07:39 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, mopsfelder@gmail.com
Subject: [PATCH v2 3/3] powerpc/64: remove system call instruction emulation
Date: Wed, 30 Mar 2022 19:37:19 +0530
Message-Id: <a412e3b3791ed83de18704c8d90f492e7a0049c0.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jbbHz2mpPOKm_TETIBWibcUYpyX7b8eJ
X-Proofpoint-GUID: S6MoUhprBiCdXIxM6E4SulyHJ9lF51pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300069
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

From: Nicholas Piggin <npiggin@gmail.com>

emulate_step() instruction emulation including sc instruction emulation
initially appeared in xmon. It was then moved into sstep.c where kprobes
could use it too, and later hw_breakpoint and uprobes started to use it.

Until uprobes, the only instruction emulation users were for kernel
mode instructions.

- xmon only steps / breaks on kernel addresses.
- kprobes is kernel only.
- hw_breakpoint only emulates kernel instructions, single steps user.

At one point, there was support for the kernel to execute sc
instructions, although that is long removed and it's not clear whether
there were any in-tree users. So system call emulation is not required
by the above users.

uprobes uses emulate_step and it appears possible to emulate sc
instruction in userspace. Userspace system call emulation is broken and
it's not clear it ever worked well.

The big complication is that userspace takes an interrupt to the kernel
to emulate the instruction. The user->kernel interrupt sets up registers
and interrupt stack frame expecting to return to userspace, then system
call instruction emulation re-directs that stack frame to the kernel,
early in the system call interrupt handler. This means the interrupt
return code takes the kernel->kernel restore path, which does not
restore everything as the system call interrupt handler would expect
coming from userspace. regs->iamr appears to get lost for example,
because the kernel->kernel return does not restore the user iamr.
Accounting such as irqflags tracing and CPU accounting does not get
flipped back to user mode as the system call handler expects, so those
appear to enter the kernel twice without returning to userspace.

These things may be individually fixable with various complication, but
it is a big complexity for unclear real benefit.

Furthermore, it is not possible to single step a system call instruction
since it causes an interrupt. As such, a separate patch disables probing
on system call instructions.

This patch removes system call emulation and disables stepping system
calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[minor commit log edit, and also get rid of '#ifdef CONFIG_PPC64']
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/interrupt_64.S | 10 -------
 arch/powerpc/lib/sstep.c           | 46 +++++++-----------------------
 2 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 7bab2d7de372e0..6471034c790973 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -219,16 +219,6 @@ system_call_vectored common 0x3000
  */
 system_call_vectored sigill 0x7ff0
 
-
-/*
- * Entered via kernel return set up by kernel/sstep.c, must match entry regs
- */
-	.globl system_call_vectored_emulate
-system_call_vectored_emulate:
-_ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	b	system_call_vectored_common
 #endif /* CONFIG_PPC_BOOK3S */
 
 	.balign IFETCH_ALIGN_BYTES
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 3fda8d0a05b43f..01c8fd39f34981 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -15,9 +15,6 @@
 #include <asm/cputable.h>
 #include <asm/disassemble.h>
 
-extern char system_call_common[];
-extern char system_call_vectored_emulate[];
-
 #ifdef CONFIG_PPC64
 /* Bits in SRR1 that are copied from MSR */
 #define MSR_MASK	0xffffffff87c0ffffUL
@@ -1376,7 +1373,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		if (branch_taken(word, regs, op))
 			op->type |= BRTAKEN;
 		return 1;
-#ifdef CONFIG_PPC64
 	case 17:	/* sc */
 		if ((word & 0xfe2) == 2)
 			op->type = SYSCALL;
@@ -1388,7 +1384,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		} else
 			op->type = UNKNOWN;
 		return 0;
-#endif
 	case 18:	/* b */
 		op->type = BRANCH | BRTAKEN;
 		imm = word & 0x03fffffc;
@@ -3643,43 +3638,22 @@ int emulate_step(struct pt_regs *regs, ppc_inst_t instr)
 		regs_set_return_msr(regs, (regs->msr & ~op.val) | (val & op.val));
 		goto instr_done;
 
-#ifdef CONFIG_PPC64
 	case SYSCALL:	/* sc */
 		/*
-		 * N.B. this uses knowledge about how the syscall
-		 * entry code works.  If that is changed, this will
-		 * need to be changed also.
+		 * Per ISA v3.1, section 7.5.15 'Trace Interrupt', we can't
+		 * single step a system call instruction:
+		 *
+		 *   Successful completion for an instruction means that the
+		 *   instruction caused no other interrupt. Thus a Trace
+		 *   interrupt never occurs for a System Call or System Call
+		 *   Vectored instruction, or for a Trap instruction that
+		 *   traps.
 		 */
-		if (IS_ENABLED(CONFIG_PPC_FAST_ENDIAN_SWITCH) &&
-				cpu_has_feature(CPU_FTR_REAL_LE) &&
-				regs->gpr[0] == 0x1ebe) {
-			regs_set_return_msr(regs, regs->msr ^ MSR_LE);
-			goto instr_done;
-		}
-		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
-		regs->gpr[11] = regs->nip + 4;
-		regs->gpr[12] = regs->msr & MSR_MASK;
-		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_common);
-		regs_set_return_msr(regs, MSR_KERNEL);
-		return 1;
-
-#ifdef CONFIG_PPC_BOOK3S_64
+		return -1;
 	case SYSCALL_VECTORED_0:	/* scv 0 */
-		regs->gpr[9] = regs->gpr[13];
-		regs->gpr[10] = MSR_KERNEL;
-		regs->gpr[11] = regs->nip + 4;
-		regs->gpr[12] = regs->msr & MSR_MASK;
-		regs->gpr[13] = (unsigned long) get_paca();
-		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate);
-		regs_set_return_msr(regs, MSR_KERNEL);
-		return 1;
-#endif
-
+		return -1;
 	case RFI:
 		return -1;
-#endif
 	}
 	return 0;
 
-- 
2.35.1

