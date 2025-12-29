Return-Path: <linuxppc-dev+bounces-15087-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8BCE5EEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 05:57:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dfkSp2SBPz2ypV;
	Mon, 29 Dec 2025 15:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766984170;
	cv=none; b=KuKQipSYZd0ZyS31PsOXwcGzEAunkLtJjCORGpBel41e+uwWnlFmLkCxCH+H6z0P1MWHmRgHboLPN9o9eS/JAAoSjSEyk5yiesI8Tyft9ngNcnJNcprwrvF9+K38Y2RwIOXMzZWNwUgfRWML5vI/NQmx70E1FX0/lVFY03qEhO9w5Hj28cx/knvU95KA/RbPdyPAK9Beae25WOtmyMF002LyUZYVCwffn3OAgBytaaEq8uFVYw6DqeLjNvAEXxsA4Yx4S6dH+wpHnpoHaQ2lmbHzjXwuoYQd+QbCFwRYivbIYg21zwchcrj0OG6ggUOhVw/6c3GB0Yc6PrmVny2LAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766984170; c=relaxed/relaxed;
	bh=g+YCVBojIfFcTwi0KCeKQqdw/keAiTiBtWbfV1tcZ8A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FD+zCk30AWCaHfHRO1CdVL0u6iumsPfTsp50CIpKGUQunT6XxYCnEdAZ9HWTX9AF9Zk2aeb9KSlg+6E9OcQX2zzHFC71DAVMunLVF4DNt3JFBgVQwhHfsq5prDSOCF4CXBZl8jPrDnt7Njr/UxNLstrRJMzlkqgbdNSVXBQPdw+c0KFHch/N9ojCEpzX21bxF/AxcZyJ4M8v6eN8Fqmg2E3OqLgp2b5CGnBHKqraaVaHd2OkdW0yuDSTCVrJEED1Km2aZFYFfxv/yE6Qz1OC+Ttv7PUthM7zIDmLchoiuoUplxenm6WfRJ+jEWHuxU317oH6jJtSUkIl/XGPmMfHHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g2NCsSyr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g2NCsSyr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dfkSn3z0hz2ynT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Dec 2025 15:56:09 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BS9bAh0024314;
	Mon, 29 Dec 2025 04:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g+YCVBojIfFcTwi0K
	CeKQqdw/keAiTiBtWbfV1tcZ8A=; b=g2NCsSyrizWo7tM3VgtjS047Tabg4zpIS
	gkt4W+0E2bID1ovlsuRxdFjESQqaJWSGdhjPAT2oxStOy0Jx/bsLOssin14MpdoB
	z1hfcgCC6wtvtj0JDRp2a9oCZS+HNuW6dzIR2h6Tona1rDJ0Fq0bOCF0sMt5bh4Z
	0Wr7uN+SFBrv6TgSz2tJoYJE3XwrPgXn2G8Pmkcw8OrVVaCIa69uDSGdTETFrR6P
	Iqf+pSUkkeYv11Q+9TnYEm8REjaeVfGh8yAfUaskuF4dy5qWBu+jia03D7gRVVTO
	jAzFnP4IxhUn6DdnhTKDRXxCCdp1Zm7NbCklhrtyxXlE/cU+u7kxA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74twtaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:37 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BT4tagf030938;
	Mon, 29 Dec 2025 04:55:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74twtam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BT1PG0X023899;
	Mon, 29 Dec 2025 04:55:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bat5y43mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 04:55:35 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BT4tVVr52363556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Dec 2025 04:55:31 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BCE420043;
	Mon, 29 Dec 2025 04:55:31 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74BA820040;
	Mon, 29 Dec 2025 04:55:25 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com (unknown [9.39.24.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Dec 2025 04:55:25 +0000 (GMT)
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
Subject: [PATCH v3 6/8] powerpc: Prepare for IRQ entry exit
Date: Mon, 29 Dec 2025 10:24:14 +0530
Message-ID: <20251229045416.3193779-7-mkchauras@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: E7QOoR0eiPTrgOW7tXptStO5561XZ-ZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MSBTYWx0ZWRfX1uXuwn1y2Sbm
 pX+DvuKqrcSiGqJfzfBZOe9CUWnJ873NA+GtCADnZsb8DskrHnUbBjcpyUzrS6OJeN+wpF28gb+
 3T+e+cBTT5v3EloMH2XLLF2+bowjjICRl6gYkfMVeEM+TgkiHPP+3r0vmXhdC+cQu8lo/mJIqPU
 jmxXAc5bxgRQwHWqjDeuI3rqxrtZF2cg8c3ctJqWV81Ety0L6YJJHelqIlunt0izHUQ31gWL+nP
 AzxlC7M9oKsu8x1Ux7Zof0HANEp1SgD9977+jAMUbQEXzC1NfKQe+HaVgRBnD4t69z7KWre5GyN
 Bsi13TAS9Ncmspz1FlQl/g6aF4IVPEdvwiyecELjGD8xhDxxTCtaYnU5Z0D8Kg/qARkOiR6dKG/
 5pr8REgQ8O0BhkFCgvatjSMNU86hwoDG1FJvpGue0Kzw+bT5LnAPyQpNS2obRSj3FJ3H4g3W9il
 hRaZPF7yB5YuSW5tjJg==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=695209c9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=Ed76zSDasvk_NLogn_cA:9
X-Proofpoint-GUID: EKyy5ijb5wZblp7FZbBdyi5_dk6r3mH2
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

Move interrupt entry and exit helper routines from interrupt.h into the
PowerPC-specific entry-common.h header as a preparatory step for enabling
the generic entry/exit framework.

This consolidation places all PowerPC interrupt entry/exit handling in a
single common header, aligning with the generic entry infrastructure.
The helpers provide architecture-specific handling for interrupt and NMI
entry/exit sequences, including:

 - arch_interrupt_enter/exit_prepare()
 - arch_interrupt_async_enter/exit_prepare()
 - arch_interrupt_nmi_enter/exit_prepare()
 - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
   debug register maintenance, and soft mask handling.

The functions are copied verbatim from interrupt.h.Subsequent patches will
integrate these routines into the generic entry/exit flow.

No functional change intended.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 419 ++++++++++++++++++++++++
 1 file changed, 419 insertions(+)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 2684bc91e79b..295e1db56d2e 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -5,10 +5,429 @@
 
 #include <asm/cputime.h>
 #include <asm/interrupt.h>
+#include <asm/runlatch.h>
 #include <asm/stacktrace.h>
 #include <asm/switch_to.h>
 #include <asm/tm.h>
 
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+/*
+ * WARN/BUG is handled with a program interrupt so minimise checks here to
+ * avoid recursion and maximise the chance of getting the first oops handled.
+ */
+#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
+do {									\
+	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
+		BUG_ON(cond);						\
+} while (0)
+#else
+#define INT_SOFT_MASK_BUG_ON(regs, cond)
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+extern char __end_soft_masked[];
+bool search_kernel_soft_mask_table(unsigned long addr);
+unsigned long search_kernel_restart_table(unsigned long addr);
+
+DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
+
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	if (user_mode(regs))
+		return false;
+
+	if (regs->nip >= (unsigned long)__end_soft_masked)
+		return false;
+
+	return search_kernel_soft_mask_table(regs->nip);
+}
+
+static inline void srr_regs_clobbered(void)
+{
+	local_paca->srr_valid = 0;
+	local_paca->hsrr_valid = 0;
+}
+#else
+static inline unsigned long search_kernel_restart_table(unsigned long addr)
+{
+	return 0;
+}
+
+static inline bool is_implicit_soft_masked(struct pt_regs *regs)
+{
+	return false;
+}
+
+static inline void srr_regs_clobbered(void)
+{
+}
+#endif
+
+static inline void nap_adjust_return(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_970_NAP
+	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		/* Can avoid a test-and-clear because NMIs do not call this */
+		clear_thread_local_flags(_TLF_NAPPING);
+		regs_set_return_ip(regs, (unsigned long)power4_idle_nap_return);
+	}
+#endif
+}
+
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
+static inline void booke_restore_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+	unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+	if (IS_ENABLED(CONFIG_PPC32) && unlikely(dbcr0 & DBCR0_IDM)) {
+		mtspr(SPRN_DBSR, -1);
+		mtspr(SPRN_DBCR0, global_dbcr0[smp_processor_id()]);
+	}
+#endif
+}
+
+static inline void check_return_regs_valid(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	unsigned long trap, srr0, srr1;
+	static bool warned;
+	u8 *validp;
+	char *h;
+
+	if (trap_is_scv(regs))
+		return;
+
+	trap = TRAP(regs);
+	// EE in HV mode sets HSRRs like 0xea0
+	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
+		trap = 0xea0;
+
+	switch (trap) {
+	case 0x980:
+	case INTERRUPT_H_DATA_STORAGE:
+	case 0xe20:
+	case 0xe40:
+	case INTERRUPT_HMI:
+	case 0xe80:
+	case 0xea0:
+	case INTERRUPT_H_FAC_UNAVAIL:
+	case 0x1200:
+	case 0x1500:
+	case 0x1600:
+	case 0x1800:
+		validp = &local_paca->hsrr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_HSRR0);
+		srr1 = mfspr(SPRN_HSRR1);
+		h = "H";
+
+		break;
+	default:
+		validp = &local_paca->srr_valid;
+		if (!READ_ONCE(*validp))
+			return;
+
+		srr0 = mfspr(SPRN_SRR0);
+		srr1 = mfspr(SPRN_SRR1);
+		h = "";
+		break;
+	}
+
+	if (srr0 == regs->nip && srr1 == regs->msr)
+		return;
+
+	/*
+	 * A NMI / soft-NMI interrupt may have come in after we found
+	 * srr_valid and before the SRRs are loaded. The interrupt then
+	 * comes in and clobbers SRRs and clears srr_valid. Then we load
+	 * the SRRs here and test them above and find they don't match.
+	 *
+	 * Test validity again after that, to catch such false positives.
+	 *
+	 * This test in general will have some window for false negatives
+	 * and may not catch and fix all such cases if an NMI comes in
+	 * later and clobbers SRRs without clearing srr_valid, but hopefully
+	 * such things will get caught most of the time, statistically
+	 * enough to be able to get a warning out.
+	 */
+	if (!READ_ONCE(*validp))
+		return;
+
+	if (!data_race(warned)) {
+		data_race(warned = true);
+		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
+		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
+		show_regs(regs);
+	}
+
+	WRITE_ONCE(*validp, 0); /* fixup */
+#endif
+}
+
+static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC64
+	irq_soft_mask_set(IRQS_ALL_DISABLED);
+
+	/*
+	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
+	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
+	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
+	 * soft-masked. The interrupt handler may later call
+	 * interrupt_cond_local_irq_enable() to achieve a regular process
+	 * context.
+	 */
+	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
+		INT_SOFT_MASK_BUG_ON(regs, !(regs->msr & MSR_EE));
+		__hard_irq_enable();
+	} else {
+		__hard_RI_enable();
+	}
+	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
+#endif
+
+	if (!regs_irqs_disabled(regs))
+		trace_hardirqs_off();
+
+	if (user_mode(regs)) {
+		kuap_lock();
+		account_cpu_user_entry();
+		account_stolen_time();
+	} else {
+		kuap_save_and_lock(regs);
+		/*
+		 * CT_WARN_ON comes here via program_check_exception,
+		 * so avoid recursion.
+		 */
+		if (TRAP(regs) != INTERRUPT_PROGRAM)
+			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
+				   ct_state() != CT_STATE_IDLE);
+		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
+		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
+				     search_kernel_restart_table(regs->nip));
+	}
+	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
+			     !(regs->msr & MSR_EE));
+
+	booke_restore_dbcr0();
+}
+
+/*
+ * Care should be taken to note that arch_interrupt_exit_prepare and
+ * arch_interrupt_async_exit_prepare do not necessarily return immediately to
+ * regs context (e.g., if regs is usermode, we don't necessarily return to
+ * user mode). Other interrupts might be taken between here and return,
+ * context switch / preemption may occur in the exit path after this, or a
+ * signal may be delivered, etc.
+ *
+ * The real interrupt exit code is platform specific, e.g.,
+ * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
+ *
+ * However arch_interrupt_nmi_exit_prepare does return directly to regs, because
+ * NMIs do not do "exit work" or replay soft-masked interrupts.
+ */
+static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
+{
+}
+
+static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC64
+	/* Ensure arch_interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
+	arch_interrupt_enter_prepare(regs);
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * RI=1 is set by arch_interrupt_enter_prepare, so this thread flags access
+	 * has to come afterward (it can cause SLB faults).
+	 */
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+#endif
+	irq_enter();
+}
+
+static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
+{
+	/*
+	 * Adjust at exit so the main handler sees the true NIA. This must
+	 * come before irq_exit() because irq_exit can enable interrupts, and
+	 * if another interrupt is taken before nap_adjust_return has run
+	 * here, then that interrupt would return directly to idle nap return.
+	 */
+	nap_adjust_return(regs);
+
+	irq_exit();
+	arch_interrupt_exit_prepare(regs);
+}
+
+struct interrupt_nmi_state {
+#ifdef CONFIG_PPC64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+	u8 ftrace_enabled;
+	u64 softe;
+#endif
+};
+
+static inline bool nmi_disables_ftrace(struct pt_regs *regs)
+{
+	/* Allow DEC and PMI to be traced when they are soft-NMI */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+		if (TRAP(regs) == INTERRUPT_DECREMENTER)
+			return false;
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+			return false;
+	}
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+			return false;
+	}
+
+	return true;
+}
+
+static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
+						    struct interrupt_nmi_state *state)
+{
+#ifdef CONFIG_PPC64
+	state->irq_soft_mask = local_paca->irq_soft_mask;
+	state->irq_happened = local_paca->irq_happened;
+	state->softe = regs->softe;
+
+	/*
+	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
+	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
+	 * because that goes through irq tracing which we don't want in NMI.
+	 */
+	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
+		/*
+		 * Adjust regs->softe to be soft-masked if it had not been
+		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
+		 * not yet set disabled), or if it was in an implicit soft
+		 * masked state. This makes regs_irqs_disabled(regs)
+		 * behave as expected.
+		 */
+		regs->softe = IRQS_ALL_DISABLED;
+	}
+
+	__hard_RI_enable();
+
+	/* Don't do any per-CPU operations until interrupt state is fixed */
+
+	if (nmi_disables_ftrace(regs)) {
+		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+		this_cpu_set_ftrace_enabled(0);
+	}
+#endif
+
+	/* If data relocations are enabled, it's safe to use nmi_enter() */
+	if (mfmsr() & MSR_DR) {
+		nmi_enter();
+		return;
+	}
+
+	/*
+	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
+	 * NMI because not everything it touches is within the RMA limit.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+	    firmware_has_feature(FW_FEATURE_LPAR) &&
+	    !radix_enabled())
+		return;
+
+	/*
+	 * Likewise, don't use it if we have some form of instrumentation (like
+	 * KASAN shadow) that is not safe to access in real mode (even on radix)
+	 */
+	if (IS_ENABLED(CONFIG_KASAN))
+		return;
+
+	/*
+	 * Likewise, do not use it in real mode if percpu first chunk is not
+	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
+	 * are chances where percpu allocation can come from vmalloc area.
+	 */
+	if (percpu_first_chunk_is_paged)
+		return;
+
+	/* Otherwise, it should be safe to call it */
+	nmi_enter();
+}
+
+static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
+						   struct interrupt_nmi_state *state)
+{
+	if (mfmsr() & MSR_DR) {
+		// nmi_exit if relocations are on
+		nmi_exit();
+	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+		   firmware_has_feature(FW_FEATURE_LPAR) &&
+		   !radix_enabled()) {
+		// no nmi_exit for a pseries hash guest taking a real mode exception
+	} else if (IS_ENABLED(CONFIG_KASAN)) {
+		// no nmi_exit for KASAN in real mode
+	} else if (percpu_first_chunk_is_paged) {
+		// no nmi_exit if percpu first chunk is not embedded
+	} else {
+		nmi_exit();
+	}
+
+	/*
+	 * nmi does not call nap_adjust_return because nmi should not create
+	 * new work to do (must use irq_work for that).
+	 */
+
+#ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S
+	if (regs_irqs_disabled(regs)) {
+		unsigned long rst = search_kernel_restart_table(regs->nip);
+
+		if (rst)
+			regs_set_return_ip(regs, rst);
+	}
+#endif
+
+	if (nmi_disables_ftrace(regs))
+		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+
+	/* Check we didn't change the pending interrupt mask. */
+	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	regs->softe = state->softe;
+	local_paca->irq_happened = state->irq_happened;
+	local_paca->irq_soft_mask = state->irq_soft_mask;
+#endif
+}
+
 static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
 {
 	kuap_lock();
-- 
2.52.0


