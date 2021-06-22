Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5D3B0253
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NqQ0ZZZz3fLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EnTO5pAT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EnTO5pAT; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ng46g41z307q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:40 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id q192so9540639pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ITsM8tsSlbJfZ+Ldu3+rnsEdugvf0kDy/XukEdbFsjQ=;
 b=EnTO5pATCYsvRcWdXxyJ6W7Fxo/rRQqLPIyemWuVLXBgKllP/1xL/m4xUJYnl5PJyM
 uKEvHtc9ApQ8Qtc8lrOXNFh8whU7RqcinCXLB/985370eQQVBjxnH2jV7+XvqkyKeUUm
 XKjZBLnF/mVmIfPWpKegR2sElsc19gyZKZPk11PY4gwJ3Wobjft41PK01X2P+TbX0JxY
 wCxAp73TOj6UOzJlndW6S2zc7mJW/K+XrBM1MinEYlXj0/Njze4TCwTPaZf3MVAWlu5u
 HDOq2Ubx/9SpbUqv7tk0CAmJ6Ib+kwqHDHVVlo3ArZC6zEueieDhP5DEaSVM2F0PyWx8
 MV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ITsM8tsSlbJfZ+Ldu3+rnsEdugvf0kDy/XukEdbFsjQ=;
 b=c20d0vALsn/f96Mb1sCjjVdWbEqDqICRK9eiXVyuonEYcJ6uj0pLpqkpfoD6a0kPCl
 A0LGS+1zInU2wdMlrY9m5YGFRRfXi1QrlF+1WjCKVEAnTrKb086gXmf39BR+m7VXzAjj
 Sd5i5ydRUNaDwE4ey0xgGdhO8YclP567ojU9FcV2zxRhS+ko82sw94QiTKI/W0vGQDbQ
 VFBoB6D89gv8PT2amRmdu4MTdW2iYQOGLYVwqmZVrf7wYeF8W/8FPyyyvRFBU5/ZQkCA
 8y5XpS1SzRlKIY7ivyrMUSxcS2SW5Ei5OBaZXhTgt8fslXXjaO1JZGuMLIxY1nJt2H5n
 iOOg==
X-Gm-Message-State: AOAM532tzh6imhPxFq7tuQYBRivPP6PNjbj38z0gzEzC7hE3+wAyDp9L
 18nQz8Gvj807iyh8RAc9a5+O03PegNs=
X-Google-Smtp-Source: ABdhPJxIIZAvQmzaJTvmYW4LqZlCrYqx0NmFAljNw5JsMIzHF8VzZ/zsIoG4Y66YeAzgs1nNSwkyVg==
X-Received: by 2002:a63:1f25:: with SMTP id f37mr3206644pgf.61.1624359517599; 
 Tue, 22 Jun 2021 03:58:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 17/43] KVM: PPC: Book3S HV P9: Reduce mtmsrd instructions
 required to save host SPRs
Date: Tue, 22 Jun 2021 20:57:10 +1000
Message-Id: <20210622105736.633352-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

This reduces the number of mtmsrd required to enable facility bits when
saving/restoring registers, by having the KVM code set all bits up front
rather than using individual facility functions that set their particular
MSR bits.

-42 cycles (7803) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c         | 24 +++++++++++
 arch/powerpc/kvm/book3s_hv.c          | 57 ++++++++++++++++++---------
 arch/powerpc/kvm/book3s_hv_p9_entry.c |  1 +
 3 files changed, 64 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..dfce089ac424 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -592,6 +592,30 @@ static void save_all(struct task_struct *tsk)
 	msr_check_and_clear(msr_all_available);
 }
 
+void save_user_regs_kvm(void)
+{
+	unsigned long usermsr;
+
+	if (!current->thread.regs)
+		return;
+
+	usermsr = current->thread.regs->msr;
+
+	if (usermsr & MSR_FP)
+		save_fpu(current);
+
+	if (usermsr & MSR_VEC)
+		save_altivec(current);
+
+	if (usermsr & MSR_TM) {
+                current->thread.tm_tfhar = mfspr(SPRN_TFHAR);
+                current->thread.tm_tfiar = mfspr(SPRN_TFIAR);
+                current->thread.tm_texasr = mfspr(SPRN_TEXASR);
+                current->thread.regs->msr &= ~MSR_TM;
+	}
+}
+EXPORT_SYMBOL_GPL(save_user_regs_kvm);
+
 void flush_all_to_thread(struct task_struct *tsk)
 {
 	if (tsk->thread.regs) {
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 73a8b45249e8..3ac5dbdb59f8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3999,6 +3999,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
 	u64 tb, next_timer;
+	unsigned long msr;
 	int trap;
 
 	WARN_ON_ONCE(vcpu->arch.ceded);
@@ -4010,8 +4011,23 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (next_timer < time_limit)
 		time_limit = next_timer;
 
+	vcpu->arch.ceded = 0;
+
 	save_p9_host_os_sprs(&host_os_sprs);
 
+	/* MSR bits may have been cleared by context switch */
+	msr = 0;
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr |= MSR_VSX;
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		msr |= MSR_TM;
+	msr = msr_check_and_set(msr);
+
 	kvmppc_subcore_enter_guest();
 
 	vc->entry_exit_map = 1;
@@ -4025,7 +4041,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
-	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
 	load_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
 	load_vr_state(&vcpu->arch.vr);
@@ -4134,7 +4149,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
-	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
 	store_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
 	store_vr_state(&vcpu->arch.vr);
@@ -4663,6 +4677,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	goto done;
 }
 
+void save_user_regs_kvm(void);
+
 static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
@@ -4672,19 +4688,24 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	unsigned long user_tar = 0;
 	unsigned int user_vrsave;
 	struct kvm *kvm;
+	unsigned long msr;
 
 	if (!vcpu->arch.sane) {
 		run->exit_reason = KVM_EXIT_INTERNAL_ERROR;
 		return -EINVAL;
 	}
 
+	/* No need to go into the guest when all we'll do is come back out */
+	if (signal_pending(current)) {
+		run->exit_reason = KVM_EXIT_INTR;
+		return -EINTR;
+	}
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
 	 * Don't allow entry with a suspended transaction, because
 	 * the guest entry/exit code will lose it.
-	 * If the guest has TM enabled, save away their TM-related SPRs
-	 * (they will get restored by the TM unavailable interrupt).
 	 */
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (cpu_has_feature(CPU_FTR_TM) && current->thread.regs &&
 	    (current->thread.regs->msr & MSR_TM)) {
 		if (MSR_TM_ACTIVE(current->thread.regs->msr)) {
@@ -4692,12 +4713,6 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 			run->fail_entry.hardware_entry_failure_reason = 0;
 			return -EINVAL;
 		}
-		/* Enable TM so we can read the TM SPRs */
-		mtmsr(mfmsr() | MSR_TM);
-		current->thread.tm_tfhar = mfspr(SPRN_TFHAR);
-		current->thread.tm_tfiar = mfspr(SPRN_TFIAR);
-		current->thread.tm_texasr = mfspr(SPRN_TEXASR);
-		current->thread.regs->msr &= ~MSR_TM;
 	}
 #endif
 
@@ -4712,18 +4727,24 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 
 	kvmppc_core_prepare_to_enter(vcpu);
 
-	/* No need to go into the guest when all we'll do is come back out */
-	if (signal_pending(current)) {
-		run->exit_reason = KVM_EXIT_INTR;
-		return -EINTR;
-	}
-
 	kvm = vcpu->kvm;
 	atomic_inc(&kvm->arch.vcpus_running);
 	/* Order vcpus_running vs. mmu_ready, see kvmppc_alloc_reset_hpt */
 	smp_mb();
 
-	flush_all_to_thread(current);
+	msr = 0;
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr |= MSR_VSX;
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		msr |= MSR_TM;
+	msr = msr_check_and_set(msr);
+
+	save_user_regs_kvm();
 
 	/* Save userspace EBB and other register values */
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a3281f0c9214..065bfd4d2c63 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -224,6 +224,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = vc->tb_offset;
 	}
 
+	/* Could avoid mfmsr by passing around, but probably no big deal */
 	msr = mfmsr();
 
 	host_hfscr = mfspr(SPRN_HFSCR);
-- 
2.23.0

