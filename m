Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD2353AEC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:41:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCzr69Vlz3hlg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:41:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jXgo5euk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jXgo5euk; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCZR5Dg0z3cns
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:22:39 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id m11so4567703pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lT40J0V9NBeZrLgQ+b5j14kA1GasZu+lHS7oD02caS4=;
 b=jXgo5eukd93CxmPdudi1Zn0FIJaqPSsy1qHvxo75HcVhOEH7W+hEhBRb1OHItsXyyc
 bOubrUn/wR7nXIHrYfam7CHwoPG5ynGStpqzErf2svhEE64yxcL/c+cR+UntSdufwB40
 tYTNIwxkcX0/mB5p1bJXdOnF9JMk5ExupVExCl9Yl/vqyj/noUh84hSlqcp5Kro7J7Xk
 pSXgb/CidGfElyMub/GoKEau9tTnFMSDK3puqtFn5nWk0B5el4V3t85L8+B71jDcYCkF
 xmmfw9yRpdcP51VUFVUHplm3bvIRWfMkWFXLtge31hluxG0l5nasQ0W7lNPFNTzt8L0I
 g5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lT40J0V9NBeZrLgQ+b5j14kA1GasZu+lHS7oD02caS4=;
 b=ua9kFASJuBWz69vyJMH0T+xaXdIqcn6b3554j6FUw+FkKp9qq5zj9vGPF1MQ9KRb3B
 onNMmd2lgbvoHbZxO5QqSieWAXEJ+/S83O4fVc+nDXolU77XW2EbmXQiz8YRVACvf5ON
 rQ/41IzBHEyGTu04RVyd3L6dkJsxyku/IcXRY4ZEiLMcK/c6at+6D0l2wIUAANkHMLAo
 GyLribh2ZnDLARw4Qhe37X0JpNpM3OZdQ3kUDwBL+9VwbppuaLg0q+sgcnbhIJRwU5QA
 R/iHX8CXe6eVi/xlZTIK7SXGonGTSBeoh99l21wwu78M+dxLqLM3qIVRWbQsWHPSllBd
 H6uA==
X-Gm-Message-State: AOAM532BbDtcEazzXaQEM4WFftMknuerYov2oFE6WKKl2/x6kCXE4IMW
 VSxRE5PV24aAmCJR0jZwAh1VywNCGc9/Yg==
X-Google-Smtp-Source: ABdhPJxoA8OIPEFbQEQagSInxYL96zfWuvboWl4YHV7EzCzMQjkCQ05iYPmJk7B0/tVcy6mOAvi3lw==
X-Received: by 2002:a63:4763:: with SMTP id w35mr21011033pgk.226.1617585757754; 
 Sun, 04 Apr 2021 18:22:37 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:22:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 47/48] KVM: PPC: Book3S HV P9: implement hash host / hash
 guest support
Date: Mon,  5 Apr 2021 11:19:47 +1000
Message-Id: <20210405011948.675354-48-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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

This additionally has to save and restore the host SLB, and also
ensure that the MMU is off while switching into the guest SLB.

P9 and later CPUs now always go via the P9 path. The "fast" guest
mode is now renamed to the P9 mode, which is consistent with
functionality and naming.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_asm.h     |  2 +-
 arch/powerpc/kvm/book3s_64_entry.S     | 12 ++++++---
 arch/powerpc/kvm/book3s_hv.c           |  4 ++-
 arch/powerpc/kvm/book3s_hv_interrupt.c | 37 +++++++++++++++++++++-----
 4 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index b4f9996bd331..b996002882b1 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -146,7 +146,7 @@
 #define KVM_GUEST_MODE_GUEST	1
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
-#define KVM_GUEST_MODE_GUEST_HV_FAST	4 /* ISA v3.0 with host radix mode */
+#define KVM_GUEST_MODE_GUEST_HV_P9	4 /* ISA >= v3.0 path */
 #define KVM_GUEST_MODE_HOST_HV	5
 
 #define KVM_INST_FETCH_FAILED	-1
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index d98ad580fd98..5d7eca29b471 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -35,7 +35,7 @@
 .balign IFETCH_ALIGN_BYTES
 kvmppc_hcall:
 	lbz	r10,HSTATE_IN_GUEST(r13)
-	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
+	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_P9
 	beq	kvmppc_p9_exit_hcall
 	ld	r10,PACA_EXGEN+EX_R13(r13)
 	SET_SCRATCH0(r10)
@@ -65,7 +65,7 @@ kvmppc_hcall:
 kvmppc_interrupt:
 	std	r10,HSTATE_SCRATCH0(r13)
 	lbz	r10,HSTATE_IN_GUEST(r13)
-	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_FAST
+	cmpwi	r10,KVM_GUEST_MODE_GUEST_HV_P9
 	beq	kvmppc_p9_exit_interrupt
 	ld	r10,HSTATE_SCRATCH0(r13)
 	lbz	r11,HSTATE_IN_GUEST(r13)
@@ -280,7 +280,7 @@ kvmppc_p9_exit_hcall:
 .balign	IFETCH_ALIGN_BYTES
 kvmppc_p9_exit_interrupt:
 	/*
-	 * If set to KVM_GUEST_MODE_GUEST_HV_FAST but we're still in the
+	 * If set to KVM_GUEST_MODE_GUEST_HV_P9 but we're still in the
 	 * hypervisor, that means we can't return from the entry stack.
 	 */
 	rldicl. r10,r12,64-MSR_HV_LG,63
@@ -354,6 +354,12 @@ kvmppc_p9_exit_interrupt:
  * effort for a small bit of code. Lots of other things to do first.
  */
 kvmppc_p9_bad_interrupt:
+BEGIN_MMU_FTR_SECTION
+	/*
+	 * Hash host doesn't try to recover MMU (requires host SLB reload)
+	 */
+	b	.
+END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 	/*
 	 * Set GUEST_MODE_NONE so the handler won't branch to KVM, and clear
 	 * MSR_RI in r12 ([H]SRR1) so the handler won't try to return.
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4d0bb5b31307..e8d9843a134d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4502,7 +4502,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (radix_enabled())
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -5591,6 +5591,8 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 		return -EPERM;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
+	if (!radix_enabled())
+		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
 	if (kvm)
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index a878cb5ec1b8..db24962f52f5 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -150,7 +150,7 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 	 */
 }
 
-static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 {
 	isync();
 	mtspr(SPRN_PID, pid);
@@ -159,6 +159,23 @@ static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
 	isync();
 	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
 	isync();
+
+	if (!radix_enabled())
+		slb_restore_bolted_realmode();
+}
+
+static void save_clear_host_mmu(struct kvm *kvm)
+{
+	if (!radix_enabled()) {
+		/*
+		 * Hash host could save and restore host SLB entries to
+		 * reduce SLB fault overheads of VM exits, but for now the
+		 * existing code clears all entries and restores just the
+		 * bolted ones when switching back to host.
+		 */
+		mtslb(0, 0, 0);
+		slb_invalidate(6);
+	}
 }
 
 static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
@@ -292,16 +309,24 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_P9;
+
+	/*
+	 * Hash host, hash guest, or radix guest with prefetch bug, all have
+	 * to disable the MMU before switching to guest MMU state.
+	 */
+	if (!radix_enabled() || !kvm_is_radix(kvm) ||
+			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+
+	save_clear_host_mmu(kvm);
+
 	if (kvm_is_radix(kvm)) {
-		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-			__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
 		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 		if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
 			__mtmsrd(0, 1); /* clear RI */
 
 	} else {
-		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
 		switch_mmu_to_guest_hpt(kvm, vcpu, lpcr);
 	}
 
@@ -487,7 +512,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_HDEC, decrementer_max);
 
 	save_clear_guest_mmu(kvm, vcpu);
-	switch_mmu_to_host_radix(kvm, host_pidr);
+	switch_mmu_to_host(kvm, host_pidr);
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	/*
-- 
2.23.0

