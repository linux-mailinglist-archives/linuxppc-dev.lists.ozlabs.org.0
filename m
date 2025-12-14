Return-Path: <linuxppc-dev+bounces-14748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A89C7CBBAE4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Dec 2025 14:05:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dTk1P1FgRz2ySB;
	Mon, 15 Dec 2025 00:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765717481;
	cv=none; b=fenQMkHun3Lh+WtOClEPXsMvGYpVpqH4DcD10pFuRk2oT1W6ExYeW+YhCk28zHdnQK1v/atlczqvUAywrF9atkLBWp+1WsAdXYQRr7ssKGoBqRXEa5IMWsSdcpBH5buhIX4qb/H4xDiP3wVLG24F/dOQscWkVaewYvgOV4858+49gfpRbkdoDk62PHLriOkw7rdVMTuOz85euuOYcTe3R/UPhZJXEk7DBvhIsDsV+pBCDDpdRZnGqExArBHG/vqle40Ysxj6CvIXXO0f1nmuPemWfw9DvqkGGz2RGZojGY78crhyNcfYAvmJzrWqK3+BiISLqDpyMyASjzo1X4JkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765717481; c=relaxed/relaxed;
	bh=ShwB2yzqArktwvTx3njFuPtYz4ahQWdpZISmiVFX36s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YI8Tyq8fIKoawKIYVOG7rnU7ErEWJWhG9fzpDgYla7hxMBvh8BHKV2/z8aqaWfZtttwgvpqQ6X9va4wJqs0LmsC0QBlOPxBVmNhnewQFqSxB+B79MdJbL4NWiiq6x4yETvQ5lo/dq7tQHqpe9SpyKcf5jBQBsB9XDnsun87pNBhMKxmJL0hb9wU+IBl4f5RhEsZmRw9Ws8PNIThCcvmS8VpKySyMxOxrgI9hKFlVXq4eK0TsYkbvJ0cDZ1EMSv/7/f3vp4uirlrbz/Z/ht3gOpZv7jgzzD3wmMwAGixrTiDr3rKQP2XgQY8+r3xXlkVGXYT02/Xt0jqDYVxyPaOfjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SOGZATxb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SOGZATxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dTk1N120tz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 00:04:39 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BEBQZ4l015766;
	Sun, 14 Dec 2025 13:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ShwB2yzqArktwvTx3
	njFuPtYz4ahQWdpZISmiVFX36s=; b=SOGZATxbF7Qnl2Pg/dC83of+raJ/r0VFL
	BMCQaPc7vHTM7wNcgEwO7qTXgb56vkPFnvdUQ6a8Oy7jj+d2GfXHt7crWU5yr6kS
	IR+/bsSFAzXJt2zqrWqF84cGgrfcuIwLg4h5nSqJSLI5Xrz3uYjH5islS0TSlo4F
	NpHTo+YKclf3/xRp53c9MF5XtJu+xw0SbhY4FuB0yum2KuzcQ3Z0VuFeZzExX/p8
	YHocffW4NTF4KFuyJRVDveqPK0FX2e8rIFL+bsEHDAOnz02dHxHacUWcarMCjrwT
	edmaGdFyLLTdUCUyh1RIdeS4oul6kCEHe7lQQzzalNuUyix3r4sUg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpnnrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BED43Of023494;
	Sun, 14 Dec 2025 13:04:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0wjpnnrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BE9JoqC005971;
	Sun, 14 Dec 2025 13:04:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1tgngja8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 14 Dec 2025 13:04:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BED3wVQ48038156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Dec 2025 13:03:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86FE320043;
	Sun, 14 Dec 2025 13:03:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31A0720040;
	Sun, 14 Dec 2025 13:03:52 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.124.210.21])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 14 Dec 2025 13:03:51 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
        macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io,
        deller@gmx.de, ankur.a.arora@oracle.com, segher@kernel.crashing.org,
        tglx@linutronix.de, thomas.weissschuh@linutronix.de,
        peterz@infradead.org, menglong8.dong@gmail.com, bigeasy@linutronix.de,
        namcao@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] powerpc: introduce arch_enter_from_user_mode
Date: Sun, 14 Dec 2025 18:32:39 +0530
Message-ID: <20251214130245.43664-4-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214130245.43664-1-mkchauras@linux.ibm.com>
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwMSBTYWx0ZWRfX0GCkjE9pRxFG
 HbyxLjLKjOowVskVEFsoES/GiC+ZfXHhHlnXHi+UCN8y462LMz+DzqeTbU0C+7l7TcdFVWvV5UB
 DaDVti1m7TvDtQe7w5xehKv8tlfTQS+djwmVsnvLEzLzGRJES2FNnT3+7WKu1TZT0e9a7t+nvah
 FG5bGP9iBJf8H1zV/7r5NZCa1rLohc1My2hI7GZVN9zO5z7d/+HhSF3Lz2u810RvhIWYQswQYeA
 m4sBOvjgY0JdIMV9/gY/S7b54Dp9cKHG4VfxVIBnnrGNLySkRrYtdD7egEnTVNTsndDTQVobovc
 zJARaCcR3dLe8o105aKh+E29zSP4hVt/gGwOmb/ldgaHa3Qk9ov0T57ZUBAQjEI7O+0mHMIKB84
 Vx9/CgI+hjvuKqDjbWCXDz8Palo1xA==
X-Proofpoint-GUID: Fn_12JMdKhLRIsMjAVSrrQea5-tm5Dh4
X-Proofpoint-ORIG-GUID: 0ieI2e7XsxJHIBYO424dMUSCtHR7bPSz
X-Authority-Analysis: v=2.4 cv=Kq5AGGWN c=1 sm=1 tr=0 ts=693eb5c4 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=T-nl45EEozRawLcqnCYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-14_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130001
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
 arch/powerpc/include/asm/entry-common.h | 97 +++++++++++++++++++++++++
 arch/powerpc/include/asm/interrupt.h    | 22 ++++++
 arch/powerpc/kernel/interrupt.c         | 22 ------
 3 files changed, 119 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 3af16d821d07..093ece06ef79 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -5,7 +5,104 @@
 
 #ifdef CONFIG_GENERIC_IRQ_ENTRY
 
+#include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/stacktrace.h>
+#include <asm/tm.h>
+
+static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
+{
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
+	} else
+#endif
+		kuap_assert_locked();
+
+	booke_restore_dbcr0();
+
+	account_cpu_user_entry();
+
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
 
 #endif /* CONFIG_GENERIC_IRQ_ENTRY */
 #endif /* _ASM_PPC_ENTRY_COMMON_H */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 0e2cddf8bd21..ca8a2cda9400 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -138,6 +138,28 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
+static inline void booke_load_dbcr0(void)
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
index 0d8fd47049a1..2a09ac5dabd6 100644
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


