Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CDB2F99ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 07:31:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DK2431Z8szDrPy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 17:31:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nHhpSO2F; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DK20l0blZzDq6k
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 17:28:21 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id x20so3705571pjh.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jan 2021 22:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JC1VYOs+CH5JO8fZ/ztMYzmuxS2FRScVLehNpWQSNFI=;
 b=nHhpSO2FGtbPs2xr1N6s9IxLPwzMocGQiCYFPnEYLuMJR9ivZe98FyLp9rcBFI7Vx0
 NFe9d3kHlVzNUC6pvHd/6wr5B8ZrNSNgiGYKnYIpQ7lfXu0T1Vjv6c8OhbjlSwsVjjlD
 pp8zUcr5/I5lquVAUX2aGvvtbfN/y3LdVDLJ856TLNOR49nzywHwrnPv3I1szG0Gc6Qv
 CtR2ys71VS44+qMveeFawnvTKnYJZ+u06hiXAe4jRdgEMvAIXEnETAjmN7rYl6yH7Q05
 SSQxxMbSuRMWLAfgnqO9+In4tyuTDFaTUAeeQdcQha0qjdlP6//mKoPSJnKKSI94EXBx
 ED/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JC1VYOs+CH5JO8fZ/ztMYzmuxS2FRScVLehNpWQSNFI=;
 b=rJE5WiZcs92LvXyNtMbqOjYj2DSs8fM+dIMNK1wKcuieDdA1Pgp9gzsCd8A8UDSmti
 8JTpcCtynAlHifhmnn/Q9iYMbIjeiGumBkvw8ENDiTyRUaQlJPUEzAgqES3xWduXptAH
 o8tjAhoeIseQxNI76IA4jEGIvWLN/eu0KSrU8Q7k822Wg4OPkDmxC2ABLs23boKdWIyx
 MMtMwfsSOhyLHcCt/Qsixy2KOw+IcBs6z049LdH7alNtBSldBfz5p9ZI/KUZPmVS90V2
 ToLDVqJQRjyyFxpwXHnwzObqNQ4OzCWKIGpsomqt2BLsnH8HKWejZMLIz1B/Gl1Sny+t
 U/tA==
X-Gm-Message-State: AOAM531LHwpJp4ZIMLCAWecp3LeQeDnQAxE2dysAEEajIwVSCffcellj
 +m0yIypP3w8fHFibJ/qQfFkywp3ddBU=
X-Google-Smtp-Source: ABdhPJwx0zlkr7c6Cyfpp7QXu9KxikfBR4gGbKT58LjDnJfjD/cbieVsTEQ2EA4pX4iSrOCsy1hH6g==
X-Received: by 2002:a17:90a:aa91:: with SMTP id
 l17mr25902219pjq.177.1610951298835; 
 Sun, 17 Jan 2021 22:28:18 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id w25sm8502318pfg.103.2021.01.17.22.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 22:28:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 1/4] KVM: PPC: Book3S HV: Remove support for running HPT guest
 on RPT host without mixed mode support
Date: Mon, 18 Jan 2021 16:28:06 +1000
Message-Id: <20210118062809.1430920-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210118062809.1430920-1-npiggin@gmail.com>
References: <20210118062809.1430920-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts much of commit c01015091a770 ("KVM: PPC: Book3S HV: Run HPT
guests on POWER9 radix hosts"), which was required to run HPT guests on
RPT hosts on early POWER9 CPUs without support for "mixed mode", which
meant the host could not run with MMU on while guests were running.

This code has some corner case bugs, e.g., when the guest hits a machine
check or HMI the primary locks up waiting for secondaries to switch LPCR
to host, which they never do. This could all be fixed in software, but
most CPUs in production have mixed mode support, and those that don't
are believed to be all in installations that don't use this capability.
So simplify things and remove support.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_asm.h |  11 ---
 arch/powerpc/kernel/asm-offsets.c         |   3 -
 arch/powerpc/kvm/book3s_hv.c              |  56 +++--------
 arch/powerpc/kvm/book3s_hv_builtin.c      | 108 +---------------------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  80 ++++------------
 5 files changed, 32 insertions(+), 226 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index 078f4648ea27..b6d31bff5209 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -74,16 +74,6 @@ struct kvm_split_mode {
 	u8		do_nap;
 	u8		napped[MAX_SMT_THREADS];
 	struct kvmppc_vcore *vc[MAX_SUBCORES];
-	/* Bits for changing lpcr on P9 */
-	unsigned long	lpcr_req;
-	unsigned long	lpidr_req;
-	unsigned long	host_lpcr;
-	u32		do_set;
-	u32		do_restore;
-	union {
-		u32	allphases;
-		u8	phase[4];
-	} lpcr_sync;
 };
 
 /*
@@ -110,7 +100,6 @@ struct kvmppc_host_state {
 	u8 hwthread_state;
 	u8 host_ipi;
 	u8 ptid;		/* thread number within subcore when split */
-	u8 tid;			/* thread number within whole core */
 	u8 fake_suspend;
 	struct kvm_vcpu *kvm_vcpu;
 	struct kvmppc_vcore *kvm_vcore;
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index b12d7c049bfe..489a22cf1a92 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -668,7 +668,6 @@ int main(void)
 	HSTATE_FIELD(HSTATE_SAVED_XIRR, saved_xirr);
 	HSTATE_FIELD(HSTATE_HOST_IPI, host_ipi);
 	HSTATE_FIELD(HSTATE_PTID, ptid);
-	HSTATE_FIELD(HSTATE_TID, tid);
 	HSTATE_FIELD(HSTATE_FAKE_SUSPEND, fake_suspend);
 	HSTATE_FIELD(HSTATE_MMCR0, host_mmcr[0]);
 	HSTATE_FIELD(HSTATE_MMCR1, host_mmcr[1]);
@@ -698,8 +697,6 @@ int main(void)
 	OFFSET(KVM_SPLIT_LDBAR, kvm_split_mode, ldbar);
 	OFFSET(KVM_SPLIT_DO_NAP, kvm_split_mode, do_nap);
 	OFFSET(KVM_SPLIT_NAPPED, kvm_split_mode, napped);
-	OFFSET(KVM_SPLIT_DO_SET, kvm_split_mode, do_set);
-	OFFSET(KVM_SPLIT_DO_RESTORE, kvm_split_mode, do_restore);
 #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6f612d240392..2d8627dbd9f6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -134,7 +134,7 @@ static inline bool nesting_enabled(struct kvm *kvm)
 }
 
 /* If set, the threads on each CPU core have to be in the same MMU mode */
-static bool no_mixing_hpt_and_radix;
+static bool no_mixing_hpt_and_radix __read_mostly;
 
 static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu);
 
@@ -2862,11 +2862,6 @@ static bool can_dynamic_split(struct kvmppc_vcore *vc, struct core_info *cip)
 	if (one_vm_per_core && vc->kvm != cip->vc[0]->kvm)
 		return false;
 
-	/* Some POWER9 chips require all threads to be in the same MMU mode */
-	if (no_mixing_hpt_and_radix &&
-	    kvm_is_radix(vc->kvm) != kvm_is_radix(cip->vc[0]->kvm))
-		return false;
-
 	if (n_threads < cip->max_subcore_threads)
 		n_threads = cip->max_subcore_threads;
 	if (!subcore_config_ok(cip->n_subcores + 1, n_threads))
@@ -2905,6 +2900,9 @@ static void prepare_threads(struct kvmppc_vcore *vc)
 	for_each_runnable_thread(i, vcpu, vc) {
 		if (signal_pending(vcpu->arch.run_task))
 			vcpu->arch.ret = -EINTR;
+		else if (no_mixing_hpt_and_radix &&
+			 kvm_is_radix(vc->kvm) != radix_enabled())
+			vcpu->arch.ret = -EINVAL;
 		else if (vcpu->arch.vpa.update_pending ||
 			 vcpu->arch.slb_shadow.update_pending ||
 			 vcpu->arch.dtl.update_pending)
@@ -3110,7 +3108,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	int controlled_threads;
 	int trap;
 	bool is_power8;
-	bool hpt_on_radix;
 
 	/*
 	 * Remove from the list any threads that have a signal pending
@@ -3143,11 +3140,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	 * this is a HPT guest on a radix host machine where the
 	 * CPU threads may not be in different MMU modes.
 	 */
-	hpt_on_radix = no_mixing_hpt_and_radix && radix_enabled() &&
-		!kvm_is_radix(vc->kvm);
-	if (((controlled_threads > 1) &&
-	     ((vc->num_threads > threads_per_subcore) || !on_primary_thread())) ||
-	    (hpt_on_radix && vc->kvm->arch.threads_indep)) {
+	if ((controlled_threads > 1) &&
+	    ((vc->num_threads > threads_per_subcore) || !on_primary_thread())) {
 		for_each_runnable_thread(i, vcpu, vc) {
 			vcpu->arch.ret = -EBUSY;
 			kvmppc_remove_runnable(vc, vcpu);
@@ -3215,7 +3209,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	is_power8 = cpu_has_feature(CPU_FTR_ARCH_207S)
 		&& !cpu_has_feature(CPU_FTR_ARCH_300);
 
-	if (split > 1 || hpt_on_radix) {
+	if (split > 1) {
 		sip = &split_info;
 		memset(&split_info, 0, sizeof(split_info));
 		for (sub = 0; sub < core_info.n_subcores; ++sub)
@@ -3237,13 +3231,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			split_info.subcore_size = subcore_size;
 		} else {
 			split_info.subcore_size = 1;
-			if (hpt_on_radix) {
-				/* Use the split_info for LPCR/LPIDR changes */
-				split_info.lpcr_req = vc->lpcr;
-				split_info.lpidr_req = vc->kvm->arch.lpid;
-				split_info.host_lpcr = vc->kvm->arch.host_lpcr;
-				split_info.do_set = 1;
-			}
 		}
 
 		/* order writes to split_info before kvm_split_mode pointer */
@@ -3253,7 +3240,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	for (thr = 0; thr < controlled_threads; ++thr) {
 		struct paca_struct *paca = paca_ptrs[pcpu + thr];
 
-		paca->kvm_hstate.tid = thr;
 		paca->kvm_hstate.napping = 0;
 		paca->kvm_hstate.kvm_split_mode = sip;
 	}
@@ -3327,10 +3313,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	 * When doing micro-threading, poke the inactive threads as well.
 	 * This gets them to the nap instruction after kvm_do_nap,
 	 * which reduces the time taken to unsplit later.
-	 * For POWER9 HPT guest on radix host, we need all the secondary
-	 * threads woken up so they can do the LPCR/LPIDR change.
 	 */
-	if (cmd_bit || hpt_on_radix) {
+	if (cmd_bit) {
 		split_info.do_nap = 1;	/* ask secondaries to nap when done */
 		for (thr = 1; thr < threads_per_subcore; ++thr)
 			if (!(active & (1 << thr)))
@@ -3391,19 +3375,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			cpu_relax();
 			++loops;
 		}
-	} else if (hpt_on_radix) {
-		/* Wait for all threads to have seen final sync */
-		for (thr = 1; thr < controlled_threads; ++thr) {
-			struct paca_struct *paca = paca_ptrs[pcpu + thr];
-
-			while (paca->kvm_hstate.kvm_split_mode) {
-				HMT_low();
-				barrier();
-			}
-			HMT_medium();
-		}
+		split_info.do_nap = 0;
 	}
-	split_info.do_nap = 0;
 
 	kvmppc_set_host_core(pcpu);
 
@@ -4173,7 +4146,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_clear_host_core(pcpu);
 
-	local_paca->kvm_hstate.tid = 0;
 	local_paca->kvm_hstate.napping = 0;
 	local_paca->kvm_hstate.kvm_split_mode = NULL;
 	kvmppc_start_thread(vcpu, vc);
@@ -4358,15 +4330,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	do {
 		/*
-		 * The early POWER9 chips that can't mix radix and HPT threads
-		 * on the same core also need the workaround for the problem
-		 * where the TLB would prefetch entries in the guest exit path
-		 * for radix guests using the guest PIDR value and LPID 0.
-		 * The workaround is in the old path (kvmppc_run_vcpu())
-		 * but not the new path (kvmhv_run_single_vcpu()).
+		 * The TLB prefetch bug fixup is only in the kvmppc_run_vcpu
+		 * path, which also handles hash and dependent threads mode.
 		 */
 		if (kvm->arch.threads_indep && kvm_is_radix(kvm) &&
-		    !no_mixing_hpt_and_radix)
+		    !cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 8053efdf7ea7..f3d3183249fe 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -277,8 +277,7 @@ void kvmhv_commence_exit(int trap)
 	struct kvmppc_vcore *vc = local_paca->kvm_hstate.kvm_vcore;
 	int ptid = local_paca->kvm_hstate.ptid;
 	struct kvm_split_mode *sip = local_paca->kvm_hstate.kvm_split_mode;
-	int me, ee, i, t;
-	int cpu0;
+	int me, ee, i;
 
 	/* Set our bit in the threads-exiting-guest map in the 0xff00
 	   bits of vcore->entry_exit_map */
@@ -320,22 +319,6 @@ void kvmhv_commence_exit(int trap)
 		if ((ee >> 8) == 0)
 			kvmhv_interrupt_vcore(vc, ee);
 	}
-
-	/*
-	 * On POWER9 when running a HPT guest on a radix host (sip != NULL),
-	 * we have to interrupt inactive CPU threads to get them to
-	 * restore the host LPCR value.
-	 */
-	if (sip->lpcr_req) {
-		if (cmpxchg(&sip->do_restore, 0, 1) == 0) {
-			vc = local_paca->kvm_hstate.kvm_vcore;
-			cpu0 = vc->pcpu + ptid - local_paca->kvm_hstate.tid;
-			for (t = 1; t < threads_per_core; ++t) {
-				if (sip->napped[t])
-					kvmhv_rm_send_ipi(cpu0 + t);
-			}
-		}
-	}
 }
 
 struct kvmppc_host_rm_ops *kvmppc_host_rm_ops_hv;
@@ -667,95 +650,6 @@ void kvmppc_bad_interrupt(struct pt_regs *regs)
 	panic("Bad KVM trap");
 }
 
-/*
- * Functions used to switch LPCR HR and UPRT bits on all threads
- * when entering and exiting HPT guests on a radix host.
- */
-
-#define PHASE_REALMODE		1	/* in real mode */
-#define PHASE_SET_LPCR		2	/* have set LPCR */
-#define PHASE_OUT_OF_GUEST	4	/* have finished executing in guest */
-#define PHASE_RESET_LPCR	8	/* have reset LPCR to host value */
-
-#define ALL(p)		(((p) << 24) | ((p) << 16) | ((p) << 8) | (p))
-
-static void wait_for_sync(struct kvm_split_mode *sip, int phase)
-{
-	int thr = local_paca->kvm_hstate.tid;
-
-	sip->lpcr_sync.phase[thr] |= phase;
-	phase = ALL(phase);
-	while ((sip->lpcr_sync.allphases & phase) != phase) {
-		HMT_low();
-		barrier();
-	}
-	HMT_medium();
-}
-
-void kvmhv_p9_set_lpcr(struct kvm_split_mode *sip)
-{
-	int num_sets;
-	unsigned long rb, set;
-
-	/* wait for every other thread to get to real mode */
-	wait_for_sync(sip, PHASE_REALMODE);
-
-	/* Set LPCR and LPIDR */
-	mtspr(SPRN_LPCR, sip->lpcr_req);
-	mtspr(SPRN_LPID, sip->lpidr_req);
-	isync();
-
-	/*
-	 * P10 will flush all the congruence class with a single tlbiel
-	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		num_sets =  1;
-	else
-		num_sets = POWER9_TLB_SETS_RADIX;
-
-	/* Invalidate the TLB on thread 0 */
-	if (local_paca->kvm_hstate.tid == 0) {
-		sip->do_set = 0;
-		asm volatile("ptesync" : : : "memory");
-		for (set = 0; set < num_sets; ++set) {
-			rb = TLBIEL_INVAL_SET_LPID +
-				(set << TLBIEL_INVAL_SET_SHIFT);
-			asm volatile(PPC_TLBIEL(%0, %1, 0, 0, 0) : :
-				     "r" (rb), "r" (0));
-		}
-		asm volatile("ptesync" : : : "memory");
-	}
-
-	/* indicate that we have done so and wait for others */
-	wait_for_sync(sip, PHASE_SET_LPCR);
-	/* order read of sip->lpcr_sync.allphases vs. sip->do_set */
-	smp_rmb();
-}
-
-/*
- * Called when a thread that has been in the guest needs
- * to reload the host LPCR value - but only on POWER9 when
- * running a HPT guest on a radix host.
- */
-void kvmhv_p9_restore_lpcr(struct kvm_split_mode *sip)
-{
-	/* we're out of the guest... */
-	wait_for_sync(sip, PHASE_OUT_OF_GUEST);
-
-	mtspr(SPRN_LPID, 0);
-	mtspr(SPRN_LPCR, sip->host_lpcr);
-	isync();
-
-	if (local_paca->kvm_hstate.tid == 0) {
-		sip->do_restore = 0;
-		smp_wmb();	/* order store of do_restore vs. phase */
-	}
-
-	wait_for_sync(sip, PHASE_RESET_LPCR);
-	smp_mb();
-	local_paca->kvm_hstate.kvm_split_mode = NULL;
-}
-
 static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.ceded = 0;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index cd9995ee8441..d5a9b57ec129 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -85,19 +85,6 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
 	RFI_TO_KERNEL
 
 kvmppc_call_hv_entry:
-BEGIN_FTR_SECTION
-	/* On P9, do LPCR setting, if necessary */
-	ld	r3, HSTATE_SPLIT_MODE(r13)
-	cmpdi	r3, 0
-	beq	46f
-	lwz	r4, KVM_SPLIT_DO_SET(r3)
-	cmpwi	r4, 0
-	beq	46f
-	bl	kvmhv_p9_set_lpcr
-	nop
-46:
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-
 	ld	r4, HSTATE_KVM_VCPU(r13)
 	bl	kvmppc_hv_entry
 
@@ -361,11 +348,11 @@ kvm_secondary_got_guest:
 	LOAD_REG_ADDR(r6, decrementer_max)
 	ld	r6, 0(r6)
 	mtspr	SPRN_HDEC, r6
+BEGIN_FTR_SECTION
 	/* and set per-LPAR registers, if doing dynamic micro-threading */
 	ld	r6, HSTATE_SPLIT_MODE(r13)
 	cmpdi	r6, 0
 	beq	63f
-BEGIN_FTR_SECTION
 	ld	r0, KVM_SPLIT_RPR(r6)
 	mtspr	SPRN_RPR, r0
 	ld	r0, KVM_SPLIT_PMMAR(r6)
@@ -373,16 +360,7 @@ BEGIN_FTR_SECTION
 	ld	r0, KVM_SPLIT_LDBAR(r6)
 	mtspr	SPRN_LDBAR, r0
 	isync
-FTR_SECTION_ELSE
-	/* On P9 we use the split_info for coordinating LPCR changes */
-	lwz	r4, KVM_SPLIT_DO_SET(r6)
-	cmpwi	r4, 0
-	beq	1f
-	mr	r3, r6
-	bl	kvmhv_p9_set_lpcr
-	nop
-1:
-ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
+END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 63:
 	/* Order load of vcpu after load of vcore */
 	lwsync
@@ -452,19 +430,15 @@ kvm_no_guest:
 	mtcr	r5
 	blr
 
-53:	HMT_LOW
+53:
+BEGIN_FTR_SECTION
+	HMT_LOW
 	ld	r5, HSTATE_KVM_VCORE(r13)
 	cmpdi	r5, 0
 	bne	60f
 	ld	r3, HSTATE_SPLIT_MODE(r13)
 	cmpdi	r3, 0
 	beq	kvm_no_guest
-	lwz	r0, KVM_SPLIT_DO_SET(r3)
-	cmpwi	r0, 0
-	bne	kvmhv_do_set
-	lwz	r0, KVM_SPLIT_DO_RESTORE(r3)
-	cmpwi	r0, 0
-	bne	kvmhv_do_restore
 	lbz	r0, KVM_SPLIT_DO_NAP(r3)
 	cmpwi	r0, 0
 	beq	kvm_no_guest
@@ -472,24 +446,19 @@ kvm_no_guest:
 	b	kvm_unsplit_nap
 60:	HMT_MEDIUM
 	b	kvm_secondary_got_guest
+FTR_SECTION_ELSE
+	HMT_LOW
+	ld	r5, HSTATE_KVM_VCORE(r13)
+	cmpdi	r5, 0
+	beq	kvm_no_guest
+	HMT_MEDIUM
+	b	kvm_secondary_got_guest
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
 
 54:	li	r0, KVM_HWTHREAD_IN_KVM
 	stb	r0, HSTATE_HWTHREAD_STATE(r13)
 	b	kvm_no_guest
 
-kvmhv_do_set:
-	/* Set LPCR, LPIDR etc. on P9 */
-	HMT_MEDIUM
-	bl	kvmhv_p9_set_lpcr
-	nop
-	b	kvm_no_guest
-
-kvmhv_do_restore:
-	HMT_MEDIUM
-	bl	kvmhv_p9_restore_lpcr
-	nop
-	b	kvm_no_guest
-
 /*
  * Here the primary thread is trying to return the core to
  * whole-core mode, so we need to nap.
@@ -527,7 +496,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	/* Set kvm_split_mode.napped[tid] = 1 */
 	ld	r3, HSTATE_SPLIT_MODE(r13)
 	li	r0, 1
-	lbz	r4, HSTATE_TID(r13)
+	lhz	r4, PACAPACAINDEX(r13)
+	clrldi	r4, r4, 61	/* micro-threading => P8 => 8 threads/core */
 	addi	r4, r4, KVM_SPLIT_NAPPED
 	stbx	r0, r3, r4
 	/* Check the do_nap flag again after setting napped[] */
@@ -1938,24 +1908,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 19:	lis	r8,0x7fff		/* MAX_INT@h */
 	mtspr	SPRN_HDEC,r8
 
-16:
-BEGIN_FTR_SECTION
-	/* On POWER9 with HPT-on-radix we need to wait for all other threads */
-	ld	r3, HSTATE_SPLIT_MODE(r13)
-	cmpdi	r3, 0
-	beq	47f
-	lwz	r8, KVM_SPLIT_DO_RESTORE(r3)
-	cmpwi	r8, 0
-	beq	47f
-	bl	kvmhv_p9_restore_lpcr
-	nop
-	b	48f
-47:
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
-	ld	r8,KVM_HOST_LPCR(r4)
+16:	ld	r8,KVM_HOST_LPCR(r4)
 	mtspr	SPRN_LPCR,r8
 	isync
-48:
+
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 	/* Finish timing, if we have a vcpu */
 	ld	r4, HSTATE_KVM_VCPU(r13)
@@ -2779,8 +2735,10 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
 	beq	kvm_end_cede
 	cmpwi	r0, NAPPING_NOVCPU
 	beq	kvm_novcpu_wakeup
+BEGIN_FTR_SECTION
 	cmpwi	r0, NAPPING_UNSPLIT
 	beq	kvm_unsplit_wakeup
+END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_300)
 	twi	31,0,0 /* Nap state must not be zero */
 
 33:	mr	r4, r3
-- 
2.23.0

