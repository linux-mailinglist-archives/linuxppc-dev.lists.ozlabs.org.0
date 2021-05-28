Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1980A393FAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:15:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzYF1NG7z3dyT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:15:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VxqfuL11;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VxqfuL11; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPj2rqfz3bxK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:41 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id g18so2767586pfr.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SbUHtkstldNhzTuJQSTPfLuVu1OmNZeSeC6mYnONH9A=;
 b=VxqfuL11DumsojX/L3TaNXOzx9qcq9Fe7vkn7DfRfvUh42UpRc5ecrrtfYDfXfRJM/
 VpXLZoGZDLRp2q5ZV282CDD5LSZKEBZJUYww0ShKhmOheiBUJeccXz+vHZlFqdB8468w
 2w/MZlsOkStZ/ZXNefny31yo7rkASesDP4jCxzT+w0tEQB0CcXlPkAzSzKv71zUC/GrO
 vYdz8ADdTQVHl/XmWiDWBjoJeFsKWwGRalnY7b0BE5pY/Mcvz98s9f0f9R4u3PnPkQP9
 m2PN1yNpOSX7XLae77h6X/7kIttC9lHpF7HNkY04GmqugN/U/FG+WDDUyzvDcA7PXEks
 iC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SbUHtkstldNhzTuJQSTPfLuVu1OmNZeSeC6mYnONH9A=;
 b=bKgu4BOOWmNMJS4TJRulHhqyytFiIH9rH39RbRfiNygVTpTkqPJEaY8OHOraOmTJ4u
 HV8TJrVjoIh9Yx5hB/p4brClMu8c71+xIJa4ZyqM0asBZIV9Z5D+5rup7Strvgp/4jpW
 wetiav6q+rcEuR9X1vXf1XSpM7H3UVhpSWmouQxWpqxqimQJz70jdoTys6wCTBKLKoyz
 8IobyDw+gXOoflErh3cYmFX41F5I2FlWAztr+FcCkzF1Rzvv/Ci0xvwfpwJNnwf370aO
 4h1w4vewHrMofCvCL3ETh2VbAZBKO0dOz5tNNqDwQptqHZvw+7qDlYprxAsg07IiLffx
 FNmw==
X-Gm-Message-State: AOAM531yC3ZNQlyPwjDdwXnN7cZ42DIegmEMW52vq0belBQ6DIFzabPp
 i+9Ofw74eiGd9CeKtEbR6f4YubNEfOQ=
X-Google-Smtp-Source: ABdhPJz4vFdbFRIqeQlLeWGFYk/PQ2cNpWc7jz/wTEkzAd9SwM9D5gWeICi2s19roFejuHAGBJEeHw==
X-Received: by 2002:a63:f749:: with SMTP id f9mr7883215pgk.369.1622192918814; 
 Fri, 28 May 2021 02:08:38 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 15/32] KVM: PPC: Book3S HV P9: inline
 kvmhv_load_hv_regs_and_go into __kvmhv_vcpu_entry_p9
Date: Fri, 28 May 2021 19:07:35 +1000
Message-Id: <20210528090752.3542186-16-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now the initial C implementation is done, inline more HV code to make
rearranging things easier.

And rename __kvmhv_vcpu_entry_p9 to drop the leading underscores as it's
now C, and is now a more complete vcpu entry.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |   2 +-
 arch/powerpc/kvm/book3s_hv.c             | 190 +----------------------
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 177 ++++++++++++++++++++-
 3 files changed, 178 insertions(+), 191 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index c214bcffb441..eaf3a562bf1e 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -153,7 +153,7 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
-int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu);
+int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr);
 
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
 #endif
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 665279927437..777ec786ef71 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3501,192 +3501,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
 }
 
-static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
-{
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	struct kvm_nested_guest *nested = vcpu->arch.nested;
-	u32 lpid;
-
-	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-
-	/*
-	 * All the isync()s are overkill but trivially follow the ISA
-	 * requirements. Some can likely be replaced with justification
-	 * comment for why they are not needed.
-	 */
-	isync();
-	mtspr(SPRN_LPID, lpid);
-	isync();
-	mtspr(SPRN_LPCR, lpcr);
-	isync();
-	mtspr(SPRN_PID, vcpu->arch.pid);
-	isync();
-
-	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
-	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
-}
-
-static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
-{
-	isync();
-	mtspr(SPRN_PID, pid);
-	isync();
-	mtspr(SPRN_LPID, kvm->arch.host_lpid);
-	isync();
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-	isync();
-}
-
-/*
- * Load up hypervisor-mode registers on P9.
- */
-static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
-				     unsigned long lpcr)
-{
-	struct kvm *kvm = vcpu->kvm;
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	s64 hdec;
-	u64 tb, purr, spurr;
-	int trap;
-	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
-	unsigned long host_ciabr = mfspr(SPRN_CIABR);
-	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
-	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
-	unsigned long host_psscr = mfspr(SPRN_PSSCR);
-	unsigned long host_pidr = mfspr(SPRN_PID);
-	unsigned long host_dawr1 = 0;
-	unsigned long host_dawrx1 = 0;
-
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
-	}
-
-	hdec = time_limit - mftb();
-	if (hdec < 0)
-		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-
-	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = vc->tb_offset;
-	}
-
-	if (vc->pcr)
-		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
-	mtspr(SPRN_DPDES, vc->dpdes);
-	mtspr(SPRN_VTB, vc->vtb);
-
-	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
-	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
-	mtspr(SPRN_PURR, vcpu->arch.purr);
-	mtspr(SPRN_SPURR, vcpu->arch.spurr);
-
-	if (dawr_enabled()) {
-		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
-		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
-		if (cpu_has_feature(CPU_FTR_DAWR1)) {
-			mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
-			mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
-		}
-	}
-	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
-	mtspr(SPRN_IC, vcpu->arch.ic);
-
-	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
-	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
-
-	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
-
-	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
-	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
-	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
-
-	mtspr(SPRN_AMOR, ~0UL);
-
-	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
-
-	/*
-	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
-	 * so set guest LPCR (with HDICE) before writing HDEC.
-	 */
-	mtspr(SPRN_HDEC, hdec);
-
-	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
-	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
-
-	trap = __kvmhv_vcpu_entry_p9(vcpu);
-
-	/* Advance host PURR/SPURR by the amount used by guest */
-	purr = mfspr(SPRN_PURR);
-	spurr = mfspr(SPRN_SPURR);
-	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr +
-	      purr - vcpu->arch.purr);
-	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr +
-	      spurr - vcpu->arch.spurr);
-	vcpu->arch.purr = purr;
-	vcpu->arch.spurr = spurr;
-
-	vcpu->arch.ic = mfspr(SPRN_IC);
-	vcpu->arch.pid = mfspr(SPRN_PID);
-	vcpu->arch.psscr = mfspr(SPRN_PSSCR) & PSSCR_GUEST_VIS;
-
-	vcpu->arch.shregs.sprg0 = mfspr(SPRN_SPRG0);
-	vcpu->arch.shregs.sprg1 = mfspr(SPRN_SPRG1);
-	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
-	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
-
-	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
-	mtspr(SPRN_PSSCR, host_psscr |
-	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
-	mtspr(SPRN_HFSCR, host_hfscr);
-	mtspr(SPRN_CIABR, host_ciabr);
-	mtspr(SPRN_DAWR0, host_dawr0);
-	mtspr(SPRN_DAWRX0, host_dawrx0);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		mtspr(SPRN_DAWR1, host_dawr1);
-		mtspr(SPRN_DAWRX1, host_dawrx1);
-	}
-
-	/*
-	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
-	 * case we interrupted the guest between a tlbie and a ptesync.
-	 */
-	asm volatile("eieio; tlbsync; ptesync");
-
-	/*
-	 * cp_abort is required if the processor supports local copy-paste
-	 * to clear the copy buffer that was under control of the guest.
-	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_31))
-		asm volatile(PPC_CP_ABORT);
-
-	vc->dpdes = mfspr(SPRN_DPDES);
-	vc->vtb = mfspr(SPRN_VTB);
-	mtspr(SPRN_DPDES, 0);
-	if (vc->pcr)
-		mtspr(SPRN_PCR, PCR_MASK);
-
-	if (vc->tb_offset_applied) {
-		u64 new_tb = mftb() - vc->tb_offset_applied;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = 0;
-	}
-
-	mtspr(SPRN_HDEC, 0x7fffffff);
-
-	switch_mmu_to_host_radix(kvm, host_pidr);
-
-	return trap;
-}
-
 static inline bool hcall_is_xics(unsigned long req)
 {
 	return req == H_EOI || req == H_CPPR || req == H_IPI ||
@@ -3784,7 +3598,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		 * We need to save and restore the guest visible part of the
 		 * psscr (i.e. using SPRN_PSSCR_PR) since the hypervisor
 		 * doesn't do this for us. Note only required if pseries since
-		 * this is done in kvmhv_load_hv_regs_and_go() below otherwise.
+		 * this is done in kvmhv_vcpu_entry_p9() below otherwise.
 		 */
 		unsigned long host_psscr;
 		/* call our hypervisor to load up HV regs and go */
@@ -3822,7 +3636,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
-		trap = kvmhv_load_hv_regs_and_go(vcpu, time_limit, lpcr);
+		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr);
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 9db0e031a443..d2e659940630 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -79,11 +79,121 @@ static void radix_clear_slb(void)
 		clear_slb_entry(i);
 }
 
-int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
+static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
 {
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	u32 lpid;
+
+	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
+
+	/*
+	 * All the isync()s are overkill but trivially follow the ISA
+	 * requirements. Some can likely be replaced with justification
+	 * comment for why they are not needed.
+	 */
+	isync();
+	mtspr(SPRN_LPID, lpid);
+	isync();
+	mtspr(SPRN_LPCR, lpcr);
+	isync();
+	mtspr(SPRN_PID, vcpu->arch.pid);
+	isync();
+
+	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
+	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
+}
+
+static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+{
+	isync();
+	mtspr(SPRN_PID, pid);
+	isync();
+	mtspr(SPRN_LPID, kvm->arch.host_lpid);
+	isync();
+	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
+	isync();
+}
+
+int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	s64 hdec;
+	u64 tb, purr, spurr;
 	u64 *exsave;
 	unsigned long msr = mfmsr();
 	int trap;
+	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
+	unsigned long host_ciabr = mfspr(SPRN_CIABR);
+	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
+	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
+	unsigned long host_psscr = mfspr(SPRN_PSSCR);
+	unsigned long host_pidr = mfspr(SPRN_PID);
+	unsigned long host_dawr1 = 0;
+	unsigned long host_dawrx1 = 0;
+
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		host_dawr1 = mfspr(SPRN_DAWR1);
+		host_dawrx1 = mfspr(SPRN_DAWRX1);
+	}
+
+	hdec = time_limit - mftb();
+	if (hdec < 0)
+		return BOOK3S_INTERRUPT_HV_DECREMENTER;
+
+	if (vc->tb_offset) {
+		u64 new_tb = mftb() + vc->tb_offset;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = vc->tb_offset;
+	}
+
+	if (vc->pcr)
+		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
+	mtspr(SPRN_DPDES, vc->dpdes);
+	mtspr(SPRN_VTB, vc->vtb);
+
+	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
+	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
+	mtspr(SPRN_PURR, vcpu->arch.purr);
+	mtspr(SPRN_SPURR, vcpu->arch.spurr);
+
+	if (dawr_enabled()) {
+		mtspr(SPRN_DAWR0, vcpu->arch.dawr0);
+		mtspr(SPRN_DAWRX0, vcpu->arch.dawrx0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			mtspr(SPRN_DAWR1, vcpu->arch.dawr1);
+			mtspr(SPRN_DAWRX1, vcpu->arch.dawrx1);
+		}
+	}
+	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
+	mtspr(SPRN_IC, vcpu->arch.ic);
+
+	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
+	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+
+	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
+
+	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
+	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
+	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
+	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
+
+	mtspr(SPRN_AMOR, ~0UL);
+
+	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
+	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
+	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
 
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
@@ -202,6 +312,69 @@ int __kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu)
 
 	end_timing(vcpu);
 
+	/* Advance host PURR/SPURR by the amount used by guest */
+	purr = mfspr(SPRN_PURR);
+	spurr = mfspr(SPRN_SPURR);
+	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr +
+	      purr - vcpu->arch.purr);
+	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr +
+	      spurr - vcpu->arch.spurr);
+	vcpu->arch.purr = purr;
+	vcpu->arch.spurr = spurr;
+
+	vcpu->arch.ic = mfspr(SPRN_IC);
+	vcpu->arch.pid = mfspr(SPRN_PID);
+	vcpu->arch.psscr = mfspr(SPRN_PSSCR) & PSSCR_GUEST_VIS;
+
+	vcpu->arch.shregs.sprg0 = mfspr(SPRN_SPRG0);
+	vcpu->arch.shregs.sprg1 = mfspr(SPRN_SPRG1);
+	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
+	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
+
+	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
+	mtspr(SPRN_PSSCR, host_psscr |
+	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+	mtspr(SPRN_HFSCR, host_hfscr);
+	mtspr(SPRN_CIABR, host_ciabr);
+	mtspr(SPRN_DAWR0, host_dawr0);
+	mtspr(SPRN_DAWRX0, host_dawrx0);
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		mtspr(SPRN_DAWR1, host_dawr1);
+		mtspr(SPRN_DAWRX1, host_dawrx1);
+	}
+
+	/*
+	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
+	 * case we interrupted the guest between a tlbie and a ptesync.
+	 */
+	asm volatile("eieio; tlbsync; ptesync");
+
+	/*
+	 * cp_abort is required if the processor supports local copy-paste
+	 * to clear the copy buffer that was under control of the guest.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		asm volatile(PPC_CP_ABORT);
+
+	vc->dpdes = mfspr(SPRN_DPDES);
+	vc->vtb = mfspr(SPRN_VTB);
+	mtspr(SPRN_DPDES, 0);
+	if (vc->pcr)
+		mtspr(SPRN_PCR, PCR_MASK);
+
+	if (vc->tb_offset_applied) {
+		u64 new_tb = mftb() - vc->tb_offset_applied;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = 0;
+	}
+
+	mtspr(SPRN_HDEC, 0x7fffffff);
+
+	switch_mmu_to_host_radix(kvm, host_pidr);
+
 	return trap;
 }
-EXPORT_SYMBOL_GPL(__kvmhv_vcpu_entry_p9);
+EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

