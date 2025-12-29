Return-Path: <linuxppc-dev+bounces-15084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0ACE5EDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSh3X53z2yTH;
	Mon, 29 Dec 2025 15:56:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984164;
	cv=none; b=av7CYSNHyBJi4qau8Qx44psug+UGdvsM9CcdIt3oxAQFdHo9+TNOfYcJg28XIEkwtyu0jgOnCAqT+u0tNYLFrJn9A33/32WVQ+M9ejAAlTbvGK5PHG33YcfhIUiHEb2wmybzMVgRZJHJjqvKOHShge6Z2TQUWVWQWqTI/6ImgGRp7IV+AAl6kzLfhbwrFzkpiBAyGxDnVmVd5PVVIts8P8FHqf5Z5r0pyH4yiWyUoHcNNyIT/BK/yxvau64UIzT2tbjYr9D58StpEhi2PQrw9TpWw1lNwAIdGPtgGldp7KgTYmgk7+MfuibwVVKJd4z9A4/tsxzAvOZwoUwYNZ85LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984164; c=relaxed/relaxed;
	bh=8hA6Fp/Xlgroubtl1c/eBrQ9qO9HPip/8S6F3N+I19o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvhPkecwhHcXRt/NDu/iKSvWw2ieY9MeQHrVHogd+FDGF+LJX/RrvzT7OZXgDgfEcAia37QU8SSgzFq48ZRV6L7bSzVV2xliZdG8ozfY0mXFXIP4QGGYk0E2FWkoeiAKd7d1LJGfa+eZaoiQIUWJWq9lsdmWZWp0muGr7K+9j0ssQlQS8AV6+1hHnEdCZSAHKVA0ZxwusTRyFdlrg2z8c4yBa4FR8pQppKSRWbZ99GHHRgv6DthRAM9OSuqFyPLbksg/WeBrLQTlDZagN3j+GIUr0T7x8EZgXWPQLIwLe3PlqECJpmg0jLSJdC+yPPUJLQWqEeVpllVqoSoNrXlWxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YGAD9VEN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YGAD9VEN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSf5nqgz2yPR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:56:02 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BSINwm6012681;
	Mon, 29 Dec 2025 04:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8hA6Fp/Xlgroubtl1
	c/eBrQ9qO9HPip/8S6F3N+I19o=; b=YGAD9VENpM9MhrnfZexlHF1wRuudM3Ubp
	hPLN7hzYpWuKfZYEWQ/ApxNOfLbKQFoer/dMCehV+CEdRk3uPmFtLYuOTk4GNpbe
	1mmaauKYDWJUBpJSyRcEakOxOstqEEZa2vD9yHMsBpsVGYLjJolIVf8e1iNkp33I
	/bhbMuOQ/ropqALqd3I8IyVGdPhEmcQ59qsH7fEUaXmrJxbbk6/z5GbIPB1dLhE6
	QJJBiT+uL6VGUW+p8VRnI1ocH0SRADOhC+B/KBWgubFz8nGN0FA418qkMQL2mLkb
	dGIK1MMg+YcOpOT46lq884xz10AU2pQkCfheFFQs+2vVPaiOh/r7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74twt9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4qafJ025811;
	Mon, 29 Dec 2025 04:55:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74twt9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT14MWw012916;
	Mon, 29 Dec 2025 04:55:17 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4basssm4uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:17 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4tDNW51315178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC5AF20043;
	Mon, 29 Dec 2025 04:55:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EDF020040;
	Mon, 29 Dec 2025 04:55:08 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:55:08 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/8] powerpc: introduce arch_enter_from_user_mode
Date: Mon, 29 Dec 2025 10:24:11 +0530
Message-ID: <20251229045416.3193779-4-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7Gc5IkFMi-4P1UnybAhlSL8qoztezCAO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX0nAcAGH3MiBG
 S2XYrkMauYshzsyYoJPjLtDZzuLBZTBMYA1z/ZYMgqtkhGmSKhazSAhJWHQF6GeodRM3o4V5nlA
 bGuN+N+PikWfUF83hgukyut+VrTmQbchevBM7/796IvUSrOn/nxE3QJtl14uKh7nAZmojdcSIQv
 rjViup18HDDeR6YFUrqnpPdCHL5ClY9auycumY01tzIPWxUeP6/Jh1wgx42rQQhffB6nC77yYaH
 2PNKQASIn5fM3qkrJXVNWuWXR2oUvJw9PZDrakMYpV3CHtbuwLIdy0nOgHX7kW2M/PbQjb9QBve
 V2ct2VflNOpQqKatlP4AByVaZynS7rzyMMaezVTp2nO2V52CCZS0+JTAO9q1JWm/Rv/Uzp1k9xd
 xQK8AtwHMgzmSkclDwKpIUbLU1vIxtOs/422ocwSBdwI7mPI2o8dsxZzk4aMoN9x+F30+BjrX96
 cxMrM3BaPGaHc6sO8Ig==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=695209b7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=T-nl45EEozRawLcqnCYA:9
X-Proofpoint-GUID: 0_9AY287nqo5selaKbxxIMk_5mSjpWWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2512290041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>

Implement the arch_enter_from_user_mode() hook required by the generic
entry/exit framework. This helper prepares the CPU state when entering
the kernel from userspace, ensuring correct handling of KUAP/KUEP,
transactional memory, and debug register state.

As part of this change, move booke_load_dbcr0() from interrupt.c to
interrupt.h so it can be used by the new helper without introducing
cross-file dependencies.

This patch contains no functional changes, it is purely preparatory for
enabling the generic syscall and interrupt entry path on PowerPC.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 96 +++++++++++++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 22 ++++++
 arch/powerpc/kernel/interrupt.c         | 22 ------
 3 files changed, 118 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 05ce0583b600..4bfbc806f5ad 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -3,6 +3,102 @@
 #ifndef _ASM_PPC_ENTRY_COMMON_H
 #define _ASM_PPC_ENTRY_COMMON_H
 
+#include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/tm.h>
+
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
+{
+	kuap_lock();
+
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+
+	BUG_ON(regs_is_unrecoverable(regs));
+	BUG_ON(!user_mode(regs));
+	BUG_ON(regs_irqs_disabled(regs));
+
+#ifdef CONFIG_PPC_PKEY
+	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
+		unsigned long amr, iamr;
+		bool flush_needed = false;
+		/*
+		 * When entering from userspace we mostly have the AMR/IAMR
+		 * different from kernel default values. Hence don't compare.
+		 */
+		amr = mfspr(SPRN_AMR);
+		iamr = mfspr(SPRN_IAMR);
+		regs->amr  = amr;
+		regs->iamr = iamr;
+		if (mmu_has_feature(MMU_FTR_KUAP)) {
+			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
+			flush_needed = true;
+		}
+		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
+			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
+			flush_needed = true;
+		}
+		if (flush_needed)
+			isync();
+	}
+#endif
+	kuap_assert_locked();
+	booke_restore_dbcr0();
+	account_cpu_user_entry();
+	account_stolen_time();
+
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
+
+	/*
+	 * If system call is called with TM active, set _TIF_RESTOREALL to
+	 * prevent RFSCV being used to return to userspace, because POWER9
+	 * TM implementation has problems with this instruction returning to
+	 * transactional state. Final register values are not relevant because
+	 * the transaction will be aborted upon return anyway. Or in the case
+	 * of unsupported_scv SIGILL fault, the return state does not much
+	 * matter because it's an edge case.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
+		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
+
+	/*
+	 * If the system call was made with a transaction active, doom it and
+	 * return without performing the system call. Unless it was an
+	 * unsupported scv vector, in which case it's treated like an illegal
+	 * instruction.
+	 */
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
+	    !trap_is_unsupported_scv(regs)) {
+		/* Enable TM in the kernel, and disable EE (for scv) */
+		hard_irq_disable();
+		mtmsr(mfmsr() | MSR_TM);
+
+		/* tabort, this dooms the transaction, nothing else */
+		asm volatile(".long 0x7c00071d | ((%0) << 16)"
+			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
+
+		/*
+		 * Userspace will never see the return value. Execution will
+		 * resume after the tbegin. of the aborted transaction with the
+		 * checkpointed register state. A context switch could occur
+		 * or signal delivered to the process before resuming the
+		 * doomed transaction context, but that should all be handled
+		 * as expected.
+		 */
+		return;
+	}
+#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+}
+
+#define arch_enter_from_user_mode arch_enter_from_user_mode
 
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 0e2cddf8bd21..5a1c83bc4dae 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -138,6 +138,28 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
+static __always_inline void booke_load_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+	unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+	if (likely(!(dbcr0 & DBCR0_IDM)))
+		return;
+
+	/*
+	 * Check to see if the dbcr0 register is set up to debug.
+	 * Use the internal debug mode bit to do this.
+	 */
+	mtmsr(mfmsr() & ~MSR_DE);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		isync();
+		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
+	}
+	mtspr(SPRN_DBCR0, dbcr0);
+	mtspr(SPRN_DBSR, -1);
+#endif
+}
+
 static inline void booke_restore_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 9ce2013e70ae..7265c4635c75 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -78,28 +78,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 	return true;
 }
 
-static notrace void booke_load_dbcr0(void)
-{
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	unsigned long dbcr0 = current->thread.debug.dbcr0;
-
-	if (likely(!(dbcr0 & DBCR0_IDM)))
-		return;
-
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	mtmsr(mfmsr() & ~MSR_DE);
-	if (IS_ENABLED(CONFIG_PPC32)) {
-		isync();
-		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
-	}
-	mtspr(SPRN_DBCR0, dbcr0);
-	mtspr(SPRN_DBSR, -1);
-#endif
-}
-
 static notrace void check_return_regs_valid(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.52.0


