Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7546E393FAB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzYk4BjDz3f3r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:15:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UkidnPOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UkidnPOy; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPl5QpRz3byS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:43 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id p39so2751518pfw.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6KpH+2M2NCE7vEIU1Nz6fpHTX6XKtE5+K90w65CXFg=;
 b=UkidnPOytTHgxp+5Nrs9AOnPLENXvX9IF3QDZsU4qXb2+syQi2CK/EnVsUNXCAN2E/
 skxBMj0VG0QIpNGPr2pSUCC/IMUFWCiEK+XM0BlFsldgZcnQYU+Wwg1rocQXtfd+ZHVj
 OTVn6HxzbOdujBS7a3/5JTJDmVjcP0mEy4e9wx17xQVnQbukl8w0VmkiNbmtzSxuNmaO
 r4IOEvV9w1evC11dUdvVZZPWD3CodIDzxShwCupTjse2WL7EGnHe0ZM+j6mpszpy+kJi
 MyeW6L2yMoY/g0xg51VGWWxI//cEfds3JLcTWVYM+lbvq46WyuBdo9liCqzZAiq2TeBl
 eACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6KpH+2M2NCE7vEIU1Nz6fpHTX6XKtE5+K90w65CXFg=;
 b=ah9RWtzYZwKo/ySASxCV3BBOo279UAMnJUNpFpdoD89zkjAU8trWhawhsRdZh5nnCH
 +AnI54CrUHHRdk4DgjwsoG1hE78mcJhOl8u3c4M4/7RoUtWIr+WIG/X4iqYqMZ7wVPVr
 z9y5URhj2kZvh3BBQUzFNVtSWQ+5FNK3CTdEVTbMOF1l0WU1IFx9ARGnNo1R2H0BK7fF
 jNujwIMge07zb3oiE/cUOTKP3Xapu/Iw9AG4CmrnzQVTCjkjvgsvrsrWcHtdTTHUQ6B5
 y44q8MIlFanjyErR3RPbAdUGqSP1Qvi3IUQ4o61BV2EYTlW+0GZ/Rl18mPR5U6yjWulg
 ZjOw==
X-Gm-Message-State: AOAM531y2cIGb8zfuada3vdHi/2IizPr9JTV/t9EWFfUuwaR5oLqvZWk
 8CdHpNtXnLoyPg9JZCkHWmU=
X-Google-Smtp-Source: ABdhPJydiyWJc6CxT934TuxKsrIcrLlgYoKT+GWP+wfnHbnZ9eyFSPuHRLoFYa4+TAq9/qjfaFGniA==
X-Received: by 2002:a63:ed4d:: with SMTP id m13mr7947010pgk.433.1622192921383; 
 Fri, 28 May 2021 02:08:41 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 16/32] KVM: PPC: Book3S HV P9: Read machine check registers
 while MSR[RI] is 0
Date: Fri, 28 May 2021 19:07:36 +1000
Message-Id: <20210528090752.3542186-17-npiggin@gmail.com>
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

SRR0/1, DAR, DSISR must all be protected from machine check which can
clobber them. Ensure MSR[RI] is clear while they are live.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 11 +++++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 33 ++++++++++++++++++++++++---
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 777ec786ef71..6d39e4784af6 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3571,11 +3571,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
 	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
-	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
-	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
 
+	/*
+	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
+	 * clear (or hstate set appropriately to catch those registers
+	 * being clobbered if we take a MCE or SRESET), so those are done
+	 * later.
+	 */
+
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
@@ -3618,6 +3623,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			hvregs.vcpu_token = vcpu->vcpu_id;
 		}
 		hvregs.hdec_expiry = time_limit;
+		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
+		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 		trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
 					  __pa(&vcpu->arch.regs));
 		kvmhv_restore_hv_return_state(vcpu, &hvregs);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index d2e659940630..a6f89e30040b 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -122,6 +122,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	s64 hdec;
 	u64 tb, purr, spurr;
 	u64 *exsave;
+	bool ri_set;
 	unsigned long msr = mfmsr();
 	int trap;
 	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
@@ -192,9 +193,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
-	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
-
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
 	vcpu->arch.ceded = 0;
@@ -220,6 +218,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
+	__mtmsrd(0, 1); /* clear RI */
+
+	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
+	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
+	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
+	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
+
 	accumulate_time(vcpu, &vcpu->arch.guest_time);
 
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_FAST;
@@ -237,7 +242,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
 	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
+
+	/* HSRR interrupts leave MSR[RI] unchanged, SRR interrupts clear it. */
+	ri_set = false;
 	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
+		if (trap != BOOK3S_INTERRUPT_SYSCALL &&
+				(vcpu->arch.shregs.msr & MSR_RI))
+			ri_set = true;
 		exsave = local_paca->exgen;
 	} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
 		exsave = local_paca->exnmi;
@@ -247,6 +258,22 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
 	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
+
+	/*
+	 * Only set RI after reading machine check regs (DAR, DSISR, SRR0/1)
+	 * and hstate scratch (which we need to move into exsave to make
+	 * re-entrant vs SRESET/MCE)
+	 */
+	if (ri_set) {
+		if (unlikely(!(mfmsr() & MSR_RI))) {
+			__mtmsrd(MSR_RI, 1);
+			WARN_ON_ONCE(1);
+		}
+	} else {
+		WARN_ON_ONCE(mfmsr() & MSR_RI);
+		__mtmsrd(MSR_RI, 1);
+	}
+
 	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
 	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
 	vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
-- 
2.23.0

