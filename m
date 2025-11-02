Return-Path: <linuxppc-dev+bounces-13672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06221C28EA2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 02 Nov 2025 12:55:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cztSh3wcmz3d44;
	Sun,  2 Nov 2025 22:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762084516;
	cv=none; b=Ho8I52048Kc2NXCB05df9TevDVDjCv9Lm4SIX4ryYKOz7BlZQP6s/vUyWXpcNgSJYarp50PCSSVrwP3NQ5ZKzP/x+BA6DUhgy85aaRzVtNP2Cdm+B0QkpCD1oIDONW+PBjvdzjYj/YD12JqJCw1DTbRIXud6n9UbXnUYwYs2NcZk8Eyg49Ig4NZ5JNbv2cNGR3XEiQF79KUxupTUIl9lRfzAbaxFWjKqbLz4rGIh892jJK91dgRSOqejONQ5NVrb2M1f0beqBJ89GO2Wu52Xs7wPaevLzqhplGnuQbWs9sZraC/gintbs9jceEJK6HFY+cszPhMb7dRnNGlpcFRe3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762084516; c=relaxed/relaxed;
	bh=1GDk7nUpB7qb7NyYqmXPXzKd4xTnu95duvTWlRgrAi8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hbeEr4AGXawb17ijntV3HGq2eyHDH3+5jYTvkTiKCv1Llo9l2hn6LH4I+hukyfFD2tcld5eroPHCc7ZBK7sf8Y748JHiCrZC7b9K7gc65hLjARtkjaWBvv6RCxsz0ks1XyTLEFUO0Q0V2gph9yiUiXwTw1h3IxBcQ7z9okAWXP1TSJHlajXBKK1NrFXbwWAE6UgEzAjuj8CxY+PmghH8LtFQLiKb2FoBHdswxwrV43d1U+J95InWS6M674ZElwuA61fc2ipIjutvxOIRkUHgGA+KaHqsI5Mg0QJQs7QjDa73d0RvHRD6W+/k7cZtCSD02mnSXPEX0wCidsYcKrzewg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HIdyIKRJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HIdyIKRJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cztSg4drkz3cbF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 22:55:15 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A29CtOC002323;
	Sun, 2 Nov 2025 11:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=1GDk7nUpB7qb7NyYq
	mXPXzKd4xTnu95duvTWlRgrAi8=; b=HIdyIKRJy5mOO8jCrs1cv6060opdXCIhY
	jU7KHwEkpdDfgVzbgrpDnPPeS8fGLkNsTy5pRaUtcV4fp/ntBEuMLlTnYr8CEDU3
	6EBqUd1IvVFolrKK7v/KUuvQ1GNZCxgLI95oOMuqLjAhnYAqJcTO9Bhvit9f3aKF
	RkzBGMm6KGTlX4K1XF3Lh+svam3tYO+HyO8dS7XRylUq4QLKbw3wsu1QUmChid0V
	WNJaLRuzsgX0MbzMQeJ4xKQfO21NbFh23M2XOLhrlSBjdCAyFWeYP2Y9wFIbXL7r
	7igVbafyx7L4GlXDEj38k1cTH++rDGQkO/BUU1SbCPlSt/rXbFU7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mqugg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:29 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A2BsTkV017949;
	Sun, 2 Nov 2025 11:54:29 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mqugfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:29 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A26djFa025556;
	Sun, 2 Nov 2025 11:54:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vhs9jm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 02 Nov 2025 11:54:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A2BsODU51184090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 2 Nov 2025 11:54:24 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4529820043;
	Sun,  2 Nov 2025 11:54:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34A9520040;
	Sun,  2 Nov 2025 11:54:19 +0000 (GMT)
Received: from li-ce33bfcc-25cf-11b2-a85c-dc105c39188e.ibm.com.com (unknown [9.124.213.75])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  2 Nov 2025 11:54:19 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, sshegde@linux.ibm.com, akpm@linux-foundation.org,
        macro@orcam.me.uk, ldv@strace.io, deller@gmx.de, charlie@rivosinc.com,
        bigeasy@linutronix.de, segher@kernel.crashing.org,
        thomas.weissschuh@linutronix.de, menglong8.dong@gmail.com,
        ankur.a.arora@oracle.com, peterz@infradead.org, namcao@linutronix.de,
        tglx@linutronix.de, kan.liang@linux.intel.com, mingo@kernel.org,
        atrajeev@linux.vnet.ibm.com, mark.barnett@arm.com,
        coltonlewis@google.com, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] powerpc: introduce arch_enter_from_user_mode
Date: Sun,  2 Nov 2025 17:23:53 +0530
Message-ID: <20251102115358.1744304-4-mkchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
References: <20251102115358.1744304-1-mkchauras@linux.ibm.com>
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
X-Proofpoint-GUID: TkgwHu4G9zEPmWHrmwPwMsLRUEOru-ZI
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=69074675 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=T-nl45EEozRawLcqnCYA:9 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: lIuMI9_kt59sjoSswG6FEltRSbo3kTYd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX4Ee41j2ZWg0Y
 nF4oM6A67gjrOYSG67cXR8hGsdGfkZ1X2M+PlyiShWzmVhh8GLHRaI51nr78Vy6X+led5qxglrS
 B5ZAmzFnuNAKGw1T3vtJL13T0PcA9i0efUb3KJxiekbhIpFAP76jk34s6Jyht2B9f2kjMZtRtnr
 4TXpeqkTIBfYM58Ts+3xKUkF/ij/nh8Wm7bG/KllDchTO7MsuiSGPE5bGUY6EI8mpFHHG742Kxo
 TXivWdiw47tlA4/mEkgQDilcRBZ4cUFEkqHQ7QhweYZIus3Kw+qUFwCDPu4t8r/unTOFc7BNv8+
 VlB2UpWuCDbyesgqf4teBNSCBTFrBvFqTbUwDZXtUL9bH0BZSO1GWnarNBmM2TYhmJBfULDapFw
 8D3pSjQAlE8xFA5ZjW08o7okqSMcnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
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
2.51.0


