Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05121393FCA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:22:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzjZ0LGFz3dZv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:22:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KN841DqO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KN841DqO; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQQ56fmz3c4s
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:09:18 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id p39so2752651pfw.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odpgGURx+7R/s14DvMRfmE9djTm9dneqqyjT3+mISFI=;
 b=KN841DqOJiH/xnJThwxvJzFd0pT/GlYidUp24Nm6pgNYMbZAstELwFavSXl99NQ858
 L9f33GruY9fiHIrsF0HHoxylu7sSKXuQYcVgxtD1peulOBVVErHoDdx2Ec6a4EZkinzh
 +pnCZi56uMhaAZo6rwWK7uO/x7gR16XUKl6OU/wOnLw08iKz3G4Lv+t32SKzXihu5W1Q
 mi/+yf5K81qv2VCH9CVusVmPDteTsPUSLqB178Jx9ucx0QF8OKahORmxIrJ/jyjzLLiU
 IhUqf3NX+6rw6Ed8X7bQ8qxtSiiwWTNqQ1cErQRUoY1UuZWDPCia0rcMC70NSNTeU+2s
 VokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odpgGURx+7R/s14DvMRfmE9djTm9dneqqyjT3+mISFI=;
 b=Ut+xFyeQDoSQ5K/O+HWqXb5jS/8uJhd/sQnjqa0ZgQAQadWEcnT9JGBvG6DOEcQRtv
 eASRQxRqOOYak3LNXlHHUrolH9NTHbTDfPidkPJi7vN8dcr7M08ttLbrE2mN7Z5JaEBU
 RJBl+OOyr4TJTUHWd7lRz3NHqU74BT12ExVBbtFEz3WVlFNME3h0G+lpQXpmFqFfZZmQ
 eWAkr5uCZuEFCFXCnQM/AHGVmczjyyrjtcV8t7lej53uZI3ir8yw0lyectkw0bt2njP5
 er4FVVGDY2iCF9KnjmVFkOZHX5Sh6VC9YnUOZ72Y9bQrsh4LtADk31jEpg1SeIuH3rJM
 6WHQ==
X-Gm-Message-State: AOAM531oqC48+C8LTBAv8L8VE58KcTKP/RxjAgt4xYbGp2zmck2BiYei
 EI6anPX+LPgAMwK2qbT3Hn0=
X-Google-Smtp-Source: ABdhPJzZlRCZA7VNlCYYAIueTKD7jVKJgSB8Clp8xTk61pwf0O3s/fNxcQEViBP7N8hS62FTMceAIQ==
X-Received: by 2002:a62:a101:0:b029:2e8:e878:bdc0 with SMTP id
 b1-20020a62a1010000b02902e8e878bdc0mr2863001pff.38.1622192956718; 
 Fri, 28 May 2021 02:09:16 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:09:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 31/32] KVM: PPC: Book3S HV P9: implement hash host / hash
 guest support
Date: Fri, 28 May 2021 19:07:51 +1000
Message-Id: <20210528090752.3542186-32-npiggin@gmail.com>
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

Implement support for hash guests under hash host. This has to save and
restore the host SLB, and ensure that the MMU is off while switching
into the guest SLB.

POWER9 and later CPUs now always go via the P9 path. The "fast" guest
mode is now renamed to the P9 mode, which is consistent with its
functionality and the rest of the naming.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_asm.h    |  2 +-
 arch/powerpc/kvm/book3s_64_entry.S    | 15 +++++++----
 arch/powerpc/kvm/book3s_hv.c          |  4 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 36 ++++++++++++++++++++++-----
 4 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index e479487488f4..fbbf3cec92e9 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -147,7 +147,7 @@
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
 #define KVM_GUEST_MODE_HOST_HV	4
-#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host radix */
+#define KVM_GUEST_MODE_HV_P9	5 /* ISA >= v3.0 path */
 
 #define KVM_INST_FETCH_FAILED	-1
 
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 7322fea971e4..983b8c18bc31 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -36,7 +36,7 @@
 kvmppc_hcall:
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	lbz	r10,HSTATE_IN_GUEST(r13)
-	cmpwi	r10,KVM_GUEST_MODE_HV_FAST
+	cmpwi	r10,KVM_GUEST_MODE_HV_P9
 	beq	kvmppc_p9_exit_hcall
 #endif
 	ld	r10,PACA_EXGEN+EX_R13(r13)
@@ -68,7 +68,7 @@ kvmppc_interrupt:
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 	std	r10,HSTATE_SCRATCH0(r13)
 	lbz	r10,HSTATE_IN_GUEST(r13)
-	cmpwi	r10,KVM_GUEST_MODE_HV_FAST
+	cmpwi	r10,KVM_GUEST_MODE_HV_P9
 	beq	kvmppc_p9_exit_interrupt
 	ld	r10,HSTATE_SCRATCH0(r13)
 #endif
@@ -183,8 +183,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 /*
  * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
  *
- * Enter the guest on a ISAv3.0 or later system where we have exactly
- * one vcpu per vcore, and the host is radix.
+ * Enter the guest on a ISAv3.0 or later system.
  */
 .balign	IFETCH_ALIGN_BYTES
 _GLOBAL(kvmppc_p9_enter_guest)
@@ -284,7 +283,7 @@ kvmppc_p9_exit_hcall:
 .balign	IFETCH_ALIGN_BYTES
 kvmppc_p9_exit_interrupt:
 	/*
-	 * If set to KVM_GUEST_MODE_HV_FAST but we're still in the
+	 * If set to KVM_GUEST_MODE_HV_P9 but we're still in the
 	 * hypervisor, that means we can't return from the entry stack.
 	 */
 	rldicl. r10,r12,64-MSR_HV_LG,63
@@ -358,6 +357,12 @@ kvmppc_p9_exit_interrupt:
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
 	 * Clean up guest registers to give host a chance to run.
 	 */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 662f599bdc0e..045458e7192a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4511,7 +4511,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (radix_enabled())
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -5599,6 +5599,8 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 		return -EPERM;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
+	if (!radix_enabled())
+		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
 	if (kvm)
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 4460f1c23a9d..83f592eadcd2 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -130,7 +130,7 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 	isync();
 }
 
-static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 {
 	isync();
 	mtspr(SPRN_PID, pid);
@@ -139,6 +139,22 @@ static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
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
+		slb_clear_invalidate_partition();
+	}
 }
 
 static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
@@ -271,16 +287,24 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_FAST;
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_P9;
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
 
@@ -468,7 +492,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_HDEC, 0x7fffffff);
 
 	save_clear_guest_mmu(kvm, vcpu);
-	switch_mmu_to_host_radix(kvm, host_pidr);
+	switch_mmu_to_host(kvm, host_pidr);
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	/*
-- 
2.23.0

