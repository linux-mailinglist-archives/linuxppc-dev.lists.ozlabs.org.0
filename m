Return-Path: <linuxppc-dev+bounces-11895-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69481B49B7A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 23:05:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLKH61MQ0z30Pl;
	Tue,  9 Sep 2025 07:05:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757365538;
	cv=none; b=kUsBM5+UyLpMRcgGPFJn9qfx1ir33OoiZhGFxLNvfxewtUnQe2RG9Ke7tGc6sVpdTSHWCD0CsLXKt6fOlZlQWLEWStyGL96VqtFn3pN7AM68C20chC4n3K7F2IrRCP0IhV5cc80RtBQF4u8LZOdjIh25G20yHuEkyx7RmAJh0UI5BtvzW9fSWuay5XU/lhgc0aITjEZIC84VjbuMZn2TsukxCbEW+6CYIz/ejm5rXCbngM6TGXsk2d14+PDd63l1jJ5g0ws2fZdwGZUryU89F/ZxmqZT/oQn/lSWpJsTJpqfy23LLObC3dPsAygnMUZjJOoxWs18keeCdQpy89EQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757365538; c=relaxed/relaxed;
	bh=JtTpPYQBR4fTzUkV0ipyqOAutcC4dgdEajUYF789LdM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBKyFqp+GH/FU70aDTGV/nJvou513Bm2eBIYiQY8MBmrqVT2BOZAmdmNvLn1i5UULFuXeIwwRSjoDUR08eUTx/xJ+f8267RkgDvCKSez5u30V428fxO+JukoAu0V3769LPRv3sKIRHH1Z8yxSk8ZXg/q76SvixnAaW1dwhgiCi/aVr+pCmzbVSXw710ZZFYPrVj6fKN6rRFVaPEVWjWrVtrW5yHKmDSuKVDUEWYZUiC9FWYfyqWsb3T1j31VtzKKoDiFD4AT0FU3/oQdDoqeoXNhf4/nwq/5kYQ5EfB3Ki5SXJQys7j0GbATW9KV1K1FvcBZcwDr/NoxIzx+HaH4OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4zYvw1P; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G4zYvw1P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLKH52lDsz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 07:05:37 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588I5vWE021524;
	Mon, 8 Sep 2025 21:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=JtTpPYQBR4fTzUkV0
	ipyqOAutcC4dgdEajUYF789LdM=; b=G4zYvw1PPHLZIe/rW77/EGc0woc0LhzWv
	8Ofh19cGHl6Tv9J9W/Ij2HP9PRBNjupLM6opJxCKKiV54UArkFjxA8EQFQkvx+FZ
	qJ+0Xx3k8NqVZuuu7dNCruVSHJmVrSBmAdYYzqGxzvgLmaELRjsii0CR3W5C5VQR
	Y/jQhvPNyXUjRo40DxgS1kLIwQPpQHXOP4hA/mfTrFCpRd8C9i8Ckw61BmbJICfW
	u7EkrBuIstQIgwKDbtpE/vMAg2xwAZW85hypbxmHTtyTiR+v3inZGu0YSiey/6RM
	bXrZpQWQbIXtvgQkkm4dBFx9Mj6szfFA58zedMIqjgzuLgUYjIiPA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490uke96dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:05:14 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 588L5DRt012964;
	Mon, 8 Sep 2025 21:05:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490uke96da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:05:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 588Hvdsd017163;
	Mon, 8 Sep 2025 21:05:12 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gm7rfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 21:05:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 588L58Tl56361346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 21:05:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A55E820049;
	Mon,  8 Sep 2025 21:05:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F15620040;
	Mon,  8 Sep 2025 21:05:00 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.29.251])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Sep 2025 21:04:59 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, charlie@rivosinc.com,
        akpm@linux-foundation.org, bigeasy@linutronix.de,
        ankur.a.arora@oracle.com, sshegde@linux.ibm.com, naveen@kernel.org,
        thomas.weissschuh@linutronix.de, Jason@zx2c4.com, peterz@infradead.org,
        tglx@linutronix.de, namcao@linutronix.de, kan.liang@linux.intel.com,
        mingo@kernel.org, oliver.upton@linux.dev, mark.barnett@arm.com,
        atrajeev@linux.vnet.ibm.com, rppt@kernel.org, coltonlewis@google.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [RFC V2 6/8] powerpc: Prepare for IRQ entry exit
Date: Tue,  9 Sep 2025 02:32:35 +0530
Message-ID: <20250908210235.137300-9-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908210235.137300-2-mchauras@linux.ibm.com>
References: <20250908210235.137300-2-mchauras@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfXwi3HvJWb5EUT
 HBNFeVlexgdD32cDdr9z8rUTjciriwolbak8MamQJn9kNbZR9LaMMjZwxqnZAPboUBdyBDb6XOF
 fDyKhQ163XgFwjTNaUqJl2qMTN843luejx+wKAI/IQzEliphpt0RgXuCNYv32S2aJGOHy+5ct2Q
 YxyrmIkPs2LI2VFpiSXpCtOLYYwAr+Ura3+hDrUNAXTF6s1WCIxeG+/gEBJEUE+8kVm4pFnkDE4
 EnwpKjePqIlBBOWS6swPY2zgRj7NZ8wdVe1gREi+jfrnq/XfInCQ3KzoR81gUFZpBZsT7iOJOmt
 HEvo3GZQKfqnN1qauSCXmQyYffBg2s5CLIZ8J9kxZrQ6nn2a19Ec799dA9rfDCQEc8S9fGqPobi
 oSOXKQbU
X-Proofpoint-ORIG-GUID: Z5XV8RqqUiLkGd6TiKpalA8uJ8S_wV2_
X-Proofpoint-GUID: zcO2hPjJ8W-2X_7xpBojaARW7nRxdaDv
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68bf450a cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=QKOP9i3fA86Xk_0DPdgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Copy all the functions from interrupt.h to arch specific entry-common.h file
as it will be a part of common now.

No functional change intended here.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/include/asm/entry-common.h | 420 ++++++++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index adea093274279..28a96a84e83b5 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -7,10 +7,430 @@
 
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
+       unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+       if (likely(!(dbcr0 & DBCR0_IDM)))
+               return;
+
+       /*
+        * Check to see if the dbcr0 register is set up to debug.
+        * Use the internal debug mode bit to do this.
+        */
+       mtmsr(mfmsr() & ~MSR_DE);
+       if (IS_ENABLED(CONFIG_PPC32)) {
+               isync();
+               global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
+       }
+       mtspr(SPRN_DBCR0, dbcr0);
+       mtspr(SPRN_DBSR, -1);
+#endif
+}
+
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
+		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
+		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
+		show_regs(regs);
+	}
+
+	WRITE_ONCE(*validp, 0); /* fixup */
+#endif
+}
+
+static inline void interrupt_enter_prepare(struct pt_regs *regs)
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
+		CT_WARN_ON(ct_state() != CT_STATE_USER);
+		user_exit_irqoff();
+
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
+					   search_kernel_restart_table(regs->nip));
+	}
+	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
+				   !(regs->msr & MSR_EE));
+
+	booke_restore_dbcr0();
+}
+
+/*
+ * Care should be taken to note that interrupt_exit_prepare and
+ * interrupt_async_exit_prepare do not necessarily return immediately to
+ * regs context (e.g., if regs is usermode, we don't necessarily return to
+ * user mode). Other interrupts might be taken between here and return,
+ * context switch / preemption may occur in the exit path after this, or a
+ * signal may be delivered, etc.
+ *
+ * The real interrupt exit code is platform specific, e.g.,
+ * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
+ *
+ * However interrupt_nmi_exit_prepare does return directly to regs, because
+ * NMIs do not do "exit work" or replay soft-masked interrupts.
+ */
+static inline void interrupt_exit_prepare(struct pt_regs *regs)
+{
+}
+
+static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC64
+	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
+	interrupt_enter_prepare(regs);
+#ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * RI=1 is set by interrupt_enter_prepare, so this thread flags access
+	 * has to come afterward (it can cause SLB faults).
+	 */
+	if (cpu_has_feature(CPU_FTR_CTRL) &&
+	    !test_thread_local_flags(_TLF_RUNLATCH))
+		__ppc64_runlatch_on();
+#endif
+	irq_enter();
+}
+
+static inline void interrupt_async_exit_prepare(struct pt_regs *regs)
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
+	interrupt_exit_prepare(regs);
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
+		       return false;
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+		       return false;
+	}
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
+		if (TRAP(regs) == INTERRUPT_PERFMON)
+			return false;
+	}
+
+	return true;
+}
+
+static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
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
+static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
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
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-- 
2.51.0


