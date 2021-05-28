Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E711393FB4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:17:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzcD2m8Kz3fRC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:17:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pze/qoiE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pze/qoiE; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPz0KBJz3c1Y
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:55 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 6so2056208pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6WnyysEPzsCU61bVE24Dt3x6obGrJzUOMq2zRF9Y1b4=;
 b=pze/qoiEbXtd7O1DLxW5UrTeSMSz+1XEnFZEgM9rdhIAhabhJQZgxZt2h/wtLDqByh
 Xa0O2YEdWHQU6Jx2JJpLQCqCJ8bEfuTrVWAAIVv2NJgPjXFmGZDilHpfJYiTNTGMNaG7
 PrmN9HCWuDkInfaCVCuC/K0X6s6TL6N+Uq0YAiekuAmnAnGve64VuLzikKcnj/5ZKBNS
 c8xLOJJNCE6kI+1GkwXAgpG4OMy1UqzYJ9YWfvS8gA5VK+1I3ydSg3NmIXeunHvtknOK
 vN+Dl3c/gl3FWWzpCLzOY8iPGwfjYsW/JjOFJhhaPe7vD1pKxXaLPasNPhjWFWr2QANB
 vT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WnyysEPzsCU61bVE24Dt3x6obGrJzUOMq2zRF9Y1b4=;
 b=QEw8kP0CyFoLtG03bfilVu0D9PymyYOxClKZEWtW2uTfA75TA/YW9yh5Mn2HN3KM4+
 nK3K4aH+PnGI2/oWTkK6Vz8oDjSPS8desbnoNTmdvIdu9u67BVCQUcJva9wHLantPhQ6
 tvjRQ0mpUp+uZFD4yWzAVlmJGmIAIP8S+TlvCBa87UlKjDrQABX8Owvr7nE0q4CidxdE
 O48zXeM1papiSo5NqBayj/IKc9bBzKKn62XQRemJ8Of/dZoz/1BmRB991Qm4fbPnXDgD
 U1Rr+Kspki9K5FP8xOzrWQRMFbxWtR02XCrIaSfQ5Bu2ROwGX6w76gKeZljec+HwRwK2
 PBAg==
X-Gm-Message-State: AOAM532mEPnEQgWNOR8rMj7SmJ9poCT83txM5KURcSMlOgo93u9L126p
 eaY6CXkCqMouPUxtssNzi5w=
X-Google-Smtp-Source: ABdhPJwJi1/tz54kQ+NdcfLLZc7HO0u8hXyCG7dVlhF16t5mlf7HMMPtdw5S3UD27DPtp6w9VVdeBQ==
X-Received: by 2002:a63:6387:: with SMTP id x129mr7924259pgb.58.1622192933014; 
 Fri, 28 May 2021 02:08:53 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 21/32] KVM: PPC: Book3S HV: Implement radix prefetch
 workaround by disabling MMU
Date: Fri, 28 May 2021 19:07:41 +1000
Message-Id: <20210528090752.3542186-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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

Rather than partition the guest PID space + flush a rogue guest PID to
work around this problem, instead fix it by always disabling the MMU when
switching in or out of guest MMU context in HV mode.

This may be a bit less efficient, but it is a lot less complicated and
allows the P9 path to trivally implement the workaround too. Newer CPUs
are not subject to this issue.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmu_context.h   |  6 ----
 arch/powerpc/kvm/book3s_hv.c             | 21 +++++++----
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 14 ++++++--
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  | 34 ------------------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 27 +++++---------
 arch/powerpc/mm/book3s64/radix_tlb.c     | 46 ------------------------
 arch/powerpc/mm/mmu_context.c            |  4 +--
 7 files changed, 34 insertions(+), 118 deletions(-)

diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 4bc45d3ed8b0..84e192aa54fd 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -122,12 +122,6 @@ static inline bool need_extra_context(struct mm_struct *mm, unsigned long ea)
 }
 #endif
 
-#if defined(CONFIG_KVM_BOOK3S_HV_POSSIBLE) && defined(CONFIG_PPC_RADIX_MMU)
-extern void radix_kvm_prefetch_workaround(struct mm_struct *mm);
-#else
-static inline void radix_kvm_prefetch_workaround(struct mm_struct *mm) { }
-#endif
-
 extern void switch_cop(struct mm_struct *next);
 extern int use_cop(unsigned long acop, struct mm_struct *mm);
 extern void drop_cop(unsigned long acop, struct mm_struct *mm);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 12c35b0561d3..eb25605e23b9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -807,7 +807,8 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
 		 * KVM does not support mflags=2 (AIL=2) and AIL=1 is reserved.
 		 * Keep this in synch with kvmppc_filter_guest_lpcr_hv.
 		 */
-		if (mflags != 0 && mflags != 3)
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+				kvmhv_vcpu_is_radix(vcpu) && mflags == 3)
 			return H_UNSUPPORTED_FLAG_START;
 		return H_TOO_HARD;
 	default:
@@ -1677,6 +1678,14 @@ unsigned long kvmppc_filter_lpcr_hv(struct kvm *kvm, unsigned long lpcr)
 		lpcr &= ~LPCR_AIL;
 	if ((lpcr & LPCR_AIL) != LPCR_AIL_3)
 		lpcr &= ~LPCR_AIL; /* LPCR[AIL]=1/2 is disallowed */
+	/*
+	 * On some POWER9s we force AIL off for radix guests to prevent
+	 * executing in MSR[HV]=1 mode with the MMU enabled and PIDR set to
+	 * guest, which can result in Q0 translations with LPID=0 PID=PIDR to
+	 * be cached, which the host TLB management does not expect.
+	 */
+	if (kvm_is_radix(kvm) && cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		lpcr &= ~LPCR_AIL;
 
 	/*
 	 * On POWER9, allow userspace to enable large decrementer for the
@@ -4360,12 +4369,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		/*
-		 * The TLB prefetch bug fixup is only in the kvmppc_run_vcpu
-		 * path, which also handles hash and dependent threads mode.
-		 */
-		if (kvm->arch.threads_indep && kvm_is_radix(kvm) &&
-		    !cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		if (kvm->arch.threads_indep && kvm_is_radix(kvm))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -4995,6 +4999,9 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		if (!indep_threads_mode && !cpu_has_feature(CPU_FTR_HVMODE)) {
 			pr_warn("KVM: Ignoring indep_threads_mode=N in nested hypervisor\n");
 			kvm->arch.threads_indep = true;
+		} else if (!indep_threads_mode && cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
+			pr_warn("KVM: Ignoring indep_threads_mode=N on pre-DD2.2 POWER9\n");
+			kvm->arch.threads_indep = true;
 		} else {
 			kvm->arch.threads_indep = indep_threads_mode;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 0b5bd00c9d0f..178f771e299c 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -218,6 +218,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
+	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+
 	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
 	/*
@@ -226,7 +229,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	__mtmsrd(0, 1); /* clear RI */
+	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		__mtmsrd(0, 1); /* clear RI */
 
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
@@ -341,8 +345,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	radix_clear_slb();
 
-	__mtmsrd(msr, 0);
-
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
 	/* Advance host PURR/SPURR by the amount used by guest */
@@ -408,6 +410,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	/*
+	 * If we are in real mode, only switch MMU on after the MMU is
+	 * switched to host, to avoid the P9_RADIX_PREFETCH_BUG.
+	 */
+	__mtmsrd(msr, 0);
+
 	end_timing(vcpu);
 
 	return trap;
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index d742233dec55..3b8fd4bd2419 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1717,40 +1717,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
 	eieio
 	tlbsync
 	ptesync
-
-BEGIN_FTR_SECTION
-	/* Radix: Handle the case where the guest used an illegal PID */
-	LOAD_REG_ADDR(r4, mmu_base_pid)
-	lwz	r3, VCPU_GUEST_PID(r9)
-	lwz	r5, 0(r4)
-	cmpw	cr0,r3,r5
-	blt	2f
-
-	/*
-	 * Illegal PID, the HW might have prefetched and cached in the TLB
-	 * some translations for the  LPID 0 / guest PID combination which
-	 * Linux doesn't know about, so we need to flush that PID out of
-	 * the TLB. First we need to set LPIDR to 0 so tlbiel applies to
-	 * the right context.
-	*/
-	li	r0,0
-	mtspr	SPRN_LPID,r0
-	isync
-
-	/* Then do a congruence class local flush */
-	ld	r6,VCPU_KVM(r9)
-	lwz	r0,KVM_TLB_SETS(r6)
-	mtctr	r0
-	li	r7,0x400		/* IS field = 0b01 */
-	ptesync
-	sldi	r0,r3,32		/* RS has PID */
-1:	PPC_TLBIEL(7,0,2,1,1)		/* RIC=2, PRS=1, R=1 */
-	addi	r7,r7,0x1000
-	bdnz	1b
-	ptesync
-END_FTR_SECTION_IFSET(CPU_FTR_P9_RADIX_PREFETCH_BUG)
-
-2:
 #endif /* CONFIG_PPC_RADIX_MMU */
 
 	/*
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 5fef8db3b463..fe236c38ce00 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -357,30 +357,19 @@ static void __init radix_init_pgtable(void)
 	}
 
 	/* Find out how many PID bits are supported */
-	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
-		if (!mmu_pid_bits)
-			mmu_pid_bits = 20;
-		mmu_base_pid = 1;
-	} else if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		if (!mmu_pid_bits)
-			mmu_pid_bits = 20;
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
+			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
-		 * When KVM is possible, we only use the top half of the
-		 * PID space to avoid collisions between host and guest PIDs
-		 * which can cause problems due to prefetch when exiting the
-		 * guest with AIL=3
+		 * Older versions of KVM on these machines perfer if the
+		 * guest only uses the low 19 PID bits.
 		 */
-		mmu_base_pid = 1 << (mmu_pid_bits - 1);
-#else
-		mmu_base_pid = 1;
-#endif
-	} else {
-		/* The guest uses the bottom half of the PID space */
 		if (!mmu_pid_bits)
 			mmu_pid_bits = 19;
-		mmu_base_pid = 1;
+	} else {
+		if (!mmu_pid_bits)
+			mmu_pid_bits = 20;
 	}
+	mmu_base_pid = 1;
 
 	/*
 	 * Allocate Partition table and process table for the
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 409e61210789..312236a6b085 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1336,49 +1336,3 @@ void radix__flush_tlb_all(void)
 		     : : "r"(rb), "i"(r), "i"(prs), "i"(ric), "r"(0) : "memory");
 	asm volatile("eieio; tlbsync; ptesync": : :"memory");
 }
-
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-extern void radix_kvm_prefetch_workaround(struct mm_struct *mm)
-{
-	unsigned long pid = mm->context.id;
-
-	if (unlikely(pid == MMU_NO_CONTEXT))
-		return;
-
-	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		return;
-
-	/*
-	 * If this context hasn't run on that CPU before and KVM is
-	 * around, there's a slim chance that the guest on another
-	 * CPU just brought in obsolete translation into the TLB of
-	 * this CPU due to a bad prefetch using the guest PID on
-	 * the way into the hypervisor.
-	 *
-	 * We work around this here. If KVM is possible, we check if
-	 * any sibling thread is in KVM. If it is, the window may exist
-	 * and thus we flush that PID from the core.
-	 *
-	 * A potential future improvement would be to mark which PIDs
-	 * have never been used on the system and avoid it if the PID
-	 * is new and the process has no other cpumask bit set.
-	 */
-	if (cpu_has_feature(CPU_FTR_HVMODE) && radix_enabled()) {
-		int cpu = smp_processor_id();
-		int sib = cpu_first_thread_sibling(cpu);
-		bool flush = false;
-
-		for (; sib <= cpu_last_thread_sibling(cpu) && !flush; sib++) {
-			if (sib == cpu)
-				continue;
-			if (!cpu_possible(sib))
-				continue;
-			if (paca_ptrs[sib]->kvm_hstate.kvm_vcpu)
-				flush = true;
-		}
-		if (flush)
-			_tlbiel_pid(pid, RIC_FLUSH_ALL);
-	}
-}
-EXPORT_SYMBOL_GPL(radix_kvm_prefetch_workaround);
-#endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index a857af401738..74246536b832 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -83,9 +83,7 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		asm volatile ("dssall");
 
-	if (new_on_cpu)
-		radix_kvm_prefetch_workaround(next);
-	else
+	if (!new_on_cpu)
 		membarrier_arch_switch_mm(prev, next, tsk);
 
 	/*
-- 
2.23.0

