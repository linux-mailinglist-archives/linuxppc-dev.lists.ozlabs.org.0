Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB7393FA4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:13:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzWX23nqz3dkN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:13:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=KlC59Q89;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KlC59Q89; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPY0t5tz3bwZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:33 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id v13so1321275ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=90UbIhNw44kMuPFz5PZ0UyL76p1SAQF9XbdrCoVC4mU=;
 b=KlC59Q894TGyiqIL/PDRDeSNxIVSdnTihZ/Zllgx5Yz2DOYXhq6T/2xH8l1Bu8W8nk
 hCxocXQR8B8Rfv+PrkLp42a0fdNdMMt/R5xjp+lpagguIezP5APqfJ/WMcIFr31uRK+r
 hpqP8/dzjQeuxmIYqkqEXISExK7/CBg23fj/q3T08IF8r66291cLRDGySRc6OhfUjlMJ
 fKqt9Az6AjfF79+AW4rTk7jv6Fndv8W03SBqItQGuFq7zS1XEyhddQvxt7S9hroHGfzA
 Hv1evA67jvOjY05jlEXvMa+fbIBeXJlcG+wTt09PUhT2zvcW7f9GA/vpDA2gkfTgVntX
 nvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=90UbIhNw44kMuPFz5PZ0UyL76p1SAQF9XbdrCoVC4mU=;
 b=J5wfzRZC5nhZDh/MXFLxcMVkqqjnn+9oDyJjOU0w8oIOtIFSSmCT2Je324inq6k0yT
 I1AV3Mi8Q9hxWfcXXZTbJEOBYcIFcvKdK4vFMGsgGS2bCQ9KAFMeoWdLOjhY7hQngxhc
 oCmzNI1Z1d642jyW0uY73xuS8EbLuZgxkYWErSOxXRXJ4vkgdnl9onxJiGQXoeO12meI
 eq9uB6UV8hiJYdP0Fy5oEr29l3FIIf+GSvb328pJ3dAMyzsi4dazDMtkNyKzq3nOJHl1
 frjdrc9aAOnxGmFQZGk+9+/zRvDCbtLH6QtsNAkNz3cJ6tjoxNWZRsU4Gc6ryVBZ5qpn
 hVrw==
X-Gm-Message-State: AOAM532z8kS/W11kyqW3DyApvsPevtNH9O6ZNAv3TBSjWk0VzI5MopUT
 52Z43UqbqBxLCl+e7JZvX5jp1tLnDb8=
X-Google-Smtp-Source: ABdhPJyOwoTcLd94aC0PGsSFhJqhLMIumtYVoLm57MiU1Ek3I8rZdur7L3qApayMee95/MqoRHq9AQ==
X-Received: by 2002:a17:90b:4b8f:: with SMTP id
 lr15mr3458363pjb.30.1622192910627; 
 Fri, 28 May 2021 02:08:30 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 12/32] KVM: PPC: Book3S HV P9: Move radix MMU switching
 instructions together
Date: Fri, 28 May 2021 19:07:32 +1000
Message-Id: <20210528090752.3542186-13-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switching the MMU from radix<->radix mode is tricky particularly as the
MMU can remain enabled and requires a certain sequence of SPR updates.
Move these together into their own functions.

This also includes the radix TLB check / flush because it's tied in to
MMU switching due to tlbiel getting LPID from LPIDR.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 62 ++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index bb326cfcf173..3ec1dc1bad16 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3478,12 +3478,49 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
 }
 
+static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
+{
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
 /*
  * Load up hypervisor-mode registers on P9.
  */
 static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 				     unsigned long lpcr)
 {
+	struct kvm *kvm = vcpu->kvm;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	s64 hdec;
 	u64 tb, purr, spurr;
@@ -3535,7 +3572,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 	mtspr(SPRN_IC, vcpu->arch.ic);
-	mtspr(SPRN_PID, vcpu->arch.pid);
 
 	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
@@ -3549,8 +3585,7 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	mtspr(SPRN_LPCR, lpcr);
-	isync();
+	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
 
 	/*
 	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
@@ -3593,7 +3628,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		mtspr(SPRN_DAWR1, host_dawr1);
 		mtspr(SPRN_DAWRX1, host_dawrx1);
 	}
-	mtspr(SPRN_PID, host_pidr);
 
 	/*
 	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
@@ -3608,9 +3642,6 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		asm volatile(PPC_CP_ABORT);
 
-	mtspr(SPRN_LPID, vcpu->kvm->arch.host_lpid);	/* restore host LPID */
-	isync();
-
 	vc->dpdes = mfspr(SPRN_DPDES);
 	vc->vtb = mfspr(SPRN_VTB);
 	mtspr(SPRN_DPDES, 0);
@@ -3627,7 +3658,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 
 	mtspr(SPRN_HDEC, 0x7fffffff);
-	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
+
+	switch_mmu_to_host_radix(kvm, host_pidr);
 
 	return trap;
 }
@@ -4181,7 +4213,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 {
 	struct kvm_run *run = vcpu->run;
 	int trap, r, pcpu;
-	int srcu_idx, lpid;
+	int srcu_idx;
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
@@ -4255,13 +4287,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->vcore_state = VCORE_RUNNING;
 	trace_kvmppc_run_core(vc, 0);
 
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-		mtspr(SPRN_LPID, lpid);
-		isync();
-		kvmppc_check_need_tlb_flush(kvm, pcpu, nested);
-	}
-
 	guest_enter_irqoff();
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -4280,11 +4305,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
-	if (cpu_has_feature(CPU_FTR_HVMODE)) {
-		mtspr(SPRN_LPID, kvm->arch.host_lpid);
-		isync();
-	}
-
 	set_irq_happened(trap);
 
 	kvmppc_set_host_core(pcpu);
-- 
2.23.0

