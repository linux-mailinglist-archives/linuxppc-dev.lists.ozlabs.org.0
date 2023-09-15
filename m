Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E23EF7A148A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 05:47:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gAF+lgmq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn0WK64gMz3dGW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 13:47:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gAF+lgmq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn0VP1jlxz3cPF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 13:46:36 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F3cLuh022670;
	Fri, 15 Sep 2023 03:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=VZo8fqyOeIvWIGEytDbtOz/ZJPXVA9yBNGNn+Z0orqk=;
 b=gAF+lgmqhYFPmP72Pptpw/YUn6wObSgbcWyhz/Oumjyul9mCZS80ZwtY+baUaa83TFhX
 sa2zt9E8RS9+EcpD5wtbWWfyQ65Ltljy42JxAP8jgsT1QOOjSv+a6EL2zPY4jEA44UsR
 zYWPchucflJmISeIACz4Da2Kzjy1/IjuyEfrYHN4iL39h3JkGyVm5a3JiaYH5uizm87N
 zyinZKhFDtCojtapjgK9i4Y+GMXOdsaXch3DufG2chHiligwqfNVNE67KZhmkZHtbf0t
 ZXxqCj6o3JtS4n6VBrJcPt4BCEgDJylb0IP/tiZBtic/LyQyr81s8HUcUCsn0BX6czdE Tg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4fcag7gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 03:46:28 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38F1AMJD024088;
	Fri, 15 Sep 2023 03:46:27 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t131tr9h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 03:46:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38F3kQ7I45548234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 03:46:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4AE120043;
	Fri, 15 Sep 2023 03:46:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED07D20040;
	Fri, 15 Sep 2023 03:46:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 Sep 2023 03:46:24 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E4EFF600A1;
	Fri, 15 Sep 2023 13:46:18 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/dexcr: Move HASHCHK trap handler
Date: Fri, 15 Sep 2023 13:46:04 +1000
Message-ID: <20230915034604.45393-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OyyopesmszYqN_SOK3rykS6B-Ztf7aFd
X-Proofpoint-GUID: OyyopesmszYqN_SOK3rykS6B-Ztf7aFd
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_02,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=850 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309150030
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

Syzkaller reported a sleep in atomic context bug relating to the HASHCHK
handler logic

  BUG: sleeping function called from invalid context at arch/powerpc/kernel/traps.c:1518
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 25040, name: syz-executor
  preempt_count: 0, expected: 0
  RCU nest depth: 0, expected: 0
  no locks held by syz-executor/25040.
  irq event stamp: 34
  hardirqs last  enabled at (33): [<c000000000048b38>] prep_irq_for_enabled_exit arch/powerpc/kernel/interrupt.c:56 [inline]
  hardirqs last  enabled at (33): [<c000000000048b38>] interrupt_exit_user_prepare_main+0x148/0x600 arch/powerpc/kernel/interrupt.c:230
  hardirqs last disabled at (34): [<c00000000003e6a4>] interrupt_enter_prepare+0x144/0x4f0 arch/powerpc/include/asm/interrupt.h:176
  softirqs last  enabled at (0): [<c000000000281954>] copy_process+0x16e4/0x4750 kernel/fork.c:2436
  softirqs last disabled at (0): [<0000000000000000>] 0x0
  CPU: 15 PID: 25040 Comm: syz-executor Not tainted 6.5.0-rc5-00001-g3ccdff6bb06d #3
  Hardware name: IBM,9105-22A POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1040.00 (NL1040_021) hv:phyp pSeries
  Call Trace:
  [c0000000a8247ce0] [c00000000032b0e4] __might_resched+0x3b4/0x400 kernel/sched/core.c:10189
  [c0000000a8247d80] [c0000000008c7dc8] __might_fault+0xa8/0x170 mm/memory.c:5853
  [c0000000a8247dc0] [c00000000004160c] do_program_check+0x32c/0xb20 arch/powerpc/kernel/traps.c:1518
  [c0000000a8247e50] [c000000000009b2c] program_check_common_virt+0x3bc/0x3c0

To determine if a trap was caused by a HASHCHK instruction, we inspect
the user instruction that triggered the trap. However this may sleep
if the page needs to be faulted in (get_user_instr() reaches
__get_user(), which calls might_fault() and triggers the bug message).

Move the HASHCHK handler logic to after we allow IRQs, which is fine
because we are only interested in HASHCHK if it's a user space trap.

Fixes: 5bcba4e6c13f ("powerpc/dexcr: Handle hashchk exception")
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v1: https://lore.kernel.org/all/20230825014910.488822-1-bgray@linux.ibm.com/

v1 -> v2: Changed commit description to mention Syzkaller and bug output
---
 arch/powerpc/kernel/traps.c | 56 ++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index eeff136b83d9..64ff37721fd0 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1512,23 +1512,11 @@ static void do_program_check(struct pt_regs *regs)
 			return;
 		}
 
-		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) && user_mode(regs)) {
-			ppc_inst_t insn;
-
-			if (get_user_instr(insn, (void __user *)regs->nip)) {
-				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
-				return;
-			}
-
-			if (ppc_inst_primary_opcode(insn) == 31 &&
-			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
-				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-				return;
-			}
+		/* User mode considers other cases after enabling IRQs */
+		if (!user_mode(regs)) {
+			_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
+			return;
 		}
-
-		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
-		return;
 	}
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (reason & REASON_TM) {
@@ -1561,16 +1549,44 @@ static void do_program_check(struct pt_regs *regs)
 
 	/*
 	 * If we took the program check in the kernel skip down to sending a
-	 * SIGILL. The subsequent cases all relate to emulating instructions
-	 * which we should only do for userspace. We also do not want to enable
-	 * interrupts for kernel faults because that might lead to further
-	 * faults, and loose the context of the original exception.
+	 * SIGILL. The subsequent cases all relate to user space, such as
+	 * emulating instructions which we should only do for user space. We
+	 * also do not want to enable interrupts for kernel faults because that
+	 * might lead to further faults, and loose the context of the original
+	 * exception.
 	 */
 	if (!user_mode(regs))
 		goto sigill;
 
 	interrupt_cond_local_irq_enable(regs);
 
+	/*
+	 * (reason & REASON_TRAP) is mostly handled before enabling IRQs,
+	 * except get_user_instr() can sleep so we cannot reliably inspect the
+	 * current instruction in that context. Now that we know we are
+	 * handling a user space trap and can sleep, we can check if the trap
+	 * was a hashchk failure.
+	 */
+	if (reason & REASON_TRAP) {
+		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
+			ppc_inst_t insn;
+
+			if (get_user_instr(insn, (void __user *)regs->nip)) {
+				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
+				return;
+			}
+
+			if (ppc_inst_primary_opcode(insn) == 31 &&
+			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
+				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
+				return;
+			}
+		}
+
+		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
+		return;
+	}
+
 	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
 	 * but there seems to be a hardware bug on the 405GP (RevD)
 	 * that means ESR is sometimes set incorrectly - either to
-- 
2.41.0

