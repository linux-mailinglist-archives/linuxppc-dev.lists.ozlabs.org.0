Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54004E51A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 12:54:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNmwv3fFlz3bfp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 22:54:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KnVxHmiv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KnVxHmiv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNmtb69Q4z2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 22:52:23 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NAtNFj021712; 
 Wed, 23 Mar 2022 11:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ndWFjO7DF4CTxD0rXybl3lTSlt7zTbQTko/4ibiI4Bo=;
 b=KnVxHmivWXBKHn9eH+/IT02GoorMwst9rFHvAEBhl0dsEt84nD2SnAsCPOh9u+/cL1Dq
 GeXUSF0fXjPB5MwFg6NV5W7H7uhon/J85JNPFHIYQYJRhD81fzXhhR2g81Idbrk0bcnx
 K/Q3v8zp6Wk9/SQ3vcwMq9SdgXyM5RW6k1n2kwJpOAUMOrQXNBXsDpA18yi5zR8HEbmi
 ygaJY4vaSMdp38FmIwHgIoOBe/VjXpoFsVCM9xCmMfu1MMusuTh4VOe9xtZ1AVtMYrCl
 UQGkdnZ8+Z0Fb9nmXkc21VAeXMBOCZUa24COuQ8XZIbw52QuduTxtEBwwO8wKS04ssBW Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f027nh3vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22NBfO7Z013061;
 Wed, 23 Mar 2022 11:52:16 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f027nh3ut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:16 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NBi6MI004315;
 Wed, 23 Mar 2022 11:52:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3ew6ehy9j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22NBqCnb39387490
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 11:52:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0ECB4C044;
 Wed, 23 Mar 2022 11:52:11 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64D044C040;
 Wed, 23 Mar 2022 11:52:10 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.106.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 11:52:10 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/64: remove system call instruction emulation
Date: Wed, 23 Mar 2022 17:21:36 +0530
Message-Id: <daa580a615c4372fc68c5978cc5cbfbe1f0d218f.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a2dlMkPL4K-O1s1hjmeo4nxYmggGWH1V
X-Proofpoint-ORIG-GUID: WW-OJqSF0s6Y4SrrkqTnm6lfkCh6SQ0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_06,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230066
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

emulate_step instruction emulation including sc instruction emulation
initially appeared in xmon. It then emulation code was then moved into
sstep.c where kprobes could use it too, and later hw_breakpoint and
uprobes started to use it.

Until uprobes, the only instruction emulation users were for kernel
mode instructions.

- xmon only steps / breaks on kernel addresses.
- kprobes is kernel only.
- hw_breakpoint only emulates kernel instructions, single steps user.

At one point there was support for the kernel to execute sc
instructions, although that is long removed and it's not clear whether
there was any in-tree code. So system call emulation is not required by
the above users.

uprobes uses emulate_step and it appears possible to emulate sc
instruction in userspace. Userspace system call emulation is broken and
it's not clear it ever worked well.

The big complication is that userspace takes an interrupt to the kernel
to emulate the instruction. The user->kernel interrupt sets up registers
and interrupt stack frame expecting to return to userspace, then system
call instruction emulation re-directs that stack frame to the kernel,
early in the system call interrupt handler. This means the the interrupt
return code takes the kernel->kernel restore path, which does not restore
everything as the system call interrupt handler would expect coming from
userspace. regs->iamr appears to get lost for example, because the
kernel->kernel return does not restore the user iamr. Accounting such as
irqflags tracing and CPU accounting does not get flipped back to user
mode as the system call handler expects, so those appear to enter the
kernel twice without returning to userspace.

These things may be individually fixable with various complication, but
it is a big complexity for unclear real benefit.

This patch removes system call emulation and disables stepping system
calls (because they don't work with trace interrupts, as commented).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[also get rid of '#ifdef CONFIG_PPC64']
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

