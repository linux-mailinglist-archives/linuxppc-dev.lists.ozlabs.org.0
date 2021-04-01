Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B297351628
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Sb07S0z3hn3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:25:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cdIRn0hw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cdIRn0hw; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB62F5wwZz3c7P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:57 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id w10so115527pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=50wI4g94uBoPMDWP5CQyWSU8mLhPtuvsQ4KwM3oKed4=;
 b=cdIRn0hwtvftPic4GPsZFEVE2jO6ffKRNKGVXil7S7w+HtrPf0uBZuTOfLvbL0y7GP
 85iHVnL7V70mMCs+3Y5SBr1cFpXEQqhpQU3HVwnE1aG5F3JCxPZjsUlO9JkoQ3uCR0YW
 BWsELXizPG0pKiSAxsCVcOaLXJ4IrY1mx6uv7shLU+hDMuMlDVCng1RKuvRdGccTwqNS
 uwi7IzAlwkpHfggO+0BFT/PUsFd27cc89wvGuru9iMZyB0/WU0xv1vPJJRZ+B77hNBPS
 FGLdAvQnML3i/6cJqwXSBmJvJ2L20AE8DrYKVJNs/UEdY2CRQItrgvihgiGXPii5pOIZ
 PFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=50wI4g94uBoPMDWP5CQyWSU8mLhPtuvsQ4KwM3oKed4=;
 b=NqX0usQrfTFV7cAC4UJ+Fl2LmElErXm/4csuwqueLB6s0MRQLS3TiVdmv86JfAP7LC
 HSx+IYXVLHnlsZ7sdcKTV0RfBYR7DEmiKrWWAol/xj8XT+bmS5gK7GKKgxnQzJInj5XQ
 3LITAnrm2cRuY2f1Yz6Z7h+g4ajrgZInQIddyBH1FZQn4tvAv9GQKR35zgBnHYJQGbAl
 xu4jmkTzfs8BbBBkMrjPwhUCDj5nigMnY9vv3QFCY+kjp0/t6XSt0Ap5dd/EB6VxsRED
 m3+F70LYq7mwNMONQ9CATWCyEvRurG8m18hRBDPaqOJlRHxvpS40aqfP2U8k6Wv34uE2
 QlSQ==
X-Gm-Message-State: AOAM532qFB1NfMzVEChNyod+H+lTt6gff+JPVU23dJH0g8OPsN57UorS
 Mi+3qNye2NWKjpUWRIuoWhQNSc6RXJ4=
X-Google-Smtp-Source: ABdhPJygWx5zzxGBLyX84fdQN1TZJrY9lWy1HSRfN1NIK332rZsKQwmBaHIIr9Zeb7//6d+2CwV6UA==
X-Received: by 2002:a05:6a00:13a3:b029:203:5c4d:7a22 with SMTP id
 t35-20020a056a0013a3b02902035c4d7a22mr7850200pfg.22.1617289555988; 
 Thu, 01 Apr 2021 08:05:55 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 47/48] KVM: PPC: Book3S HV P9: implement hash host / hash
 guest support
Date: Fri,  2 Apr 2021 01:03:24 +1000
Message-Id: <20210401150325.442125-48-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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

P9 and later CPUs now always go via the P9 path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_entry.S     |  6 +++++
 arch/powerpc/kvm/book3s_hv.c           |  4 ++-
 arch/powerpc/kvm/book3s_hv_interrupt.c | 35 ++++++++++++++++++++++----
 3 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 45743f5aff64..ee6345266280 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -347,6 +347,12 @@ kvmppc_p9_exit_interrupt:
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
index 728e98bb61eb..a25583204829 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4480,7 +4480,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (radix_enabled())
+		if (cpu_has_feature(CPU_FTR_ARCH_300))
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
@@ -5569,6 +5569,8 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 		return -EPERM;
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
+	if (!radix_enabled())
+		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
 	if (kvm)
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 9b093167dd79..f57abd3d0c47 100644
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
@@ -293,15 +310,23 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_AMOR, ~0UL);
 
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
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

