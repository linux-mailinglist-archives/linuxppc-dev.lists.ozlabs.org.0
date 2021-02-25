Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FB325103
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:57:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZ9k4m09z3fxM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:57:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cq9K5pem;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cq9K5pem; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYz34HR1z3dFH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:31 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id p21so3790045pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ughaSHH/tmuQhZEXSNwZbQ9e2et0A2HKfcBWJCpA71U=;
 b=cq9K5pem1WGdvui+SUXzh3YALeEpu0WY7nv0OhDWuZlwZbD//vv/onpE1o53RQnSAi
 eve0cC9bgbdTz5kdxSno47dB4DvF5ySSxhijsh8L3SIUPJKkKz+CEQNZELgSTUjCxAtu
 hSzDsshIAi1U3aRAyDDdHH/rtAnaXv0WgDWHMDherhqSojDsEXYZgsMWon66Pc0S4QV2
 eii0ZTizl9Gv3bb693b9CvHWSbXvsZK9RhMon+aGb81zGJ0HrvSgv4f6QL8sHO0we68N
 dqK3FXt/m6KJYk5u68UApW/eGZRhZux9M9YlUjWqH7QhHWkShv0/IRyZJYD2kpENZMD5
 vB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ughaSHH/tmuQhZEXSNwZbQ9e2et0A2HKfcBWJCpA71U=;
 b=RXLzLdgaRT9xhS3Et0Ca6TVlc81zHBeXSDGkR4bJmTPU9WIeK0C4L3o0fN51RmXOvq
 pNXKHKICBCxeoHPWhY+GImxJ8mDh7GHnOVFm75Bx8+4S76NgzWr/NF3cRjtFr39DCw90
 QpNJoy94/vnEmio2dTFAHuPB/VgJo9LOdANbcJ6MG1M/NR+h1pTG/s8RgR9Pm7LWTieu
 c9BFW+yyNy1wNH/bNMO6D+cr04F733RMjgoSeJKRz4wb8Q+wWLNuWZkdiegRuZYpu63x
 s21mEOGH0a6iwww7hM0mxkVXTyoPqk38ppQRxZKscId7+V6Yzd3ZMfq3DKi4TDRdm9kX
 Sp4Q==
X-Gm-Message-State: AOAM531yUeW7gbSMC6/qloC/0a13LdDR1S9FGwXjRsdL3/hmg08hfABJ
 TnHVNzrDdogQwce1Y8YeEbo=
X-Google-Smtp-Source: ABdhPJxJqz21DM/2kF4hrsQowLl3bgC4xxF4G8pprrbaZhPi5zNrQ/tTUUNg3tUBRu+qm/em8eRNxQ==
X-Received: by 2002:a63:d144:: with SMTP id c4mr3003929pgj.196.1614260909712; 
 Thu, 25 Feb 2021 05:48:29 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 25/37] KVM: PPC: Book3S HV P9: Read machine check registers
 while MSR[RI] is 0
Date: Thu, 25 Feb 2021 23:46:40 +1000
Message-Id: <20210225134652.2127648-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

SRR0/1, DAR, DSISR must all be protected from machine check which can
clobber them. Ensure MSR[RI] is clear while they are live.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c           |  5 +++--
 arch/powerpc/kvm/book3s_hv_interrupt.c | 26 +++++++++++++++++++++++---
 arch/powerpc/kvm/book3s_hv_ras.c       |  5 +++++
 3 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f99503acdda5..94989fe2fdfe 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3506,8 +3506,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
 	mtspr(SPRN_WORT, vcpu->arch.wort);
 	mtspr(SPRN_TIDR, vcpu->arch.tid);
-	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
-	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
+	/* XXX: DAR, DSISR must be set with MSR[RI] clear (or hstate as appropriate) */
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
 
@@ -3553,6 +3552,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			hvregs.vcpu_token = vcpu->vcpu_id;
 		}
 		hvregs.hdec_expiry = time_limit;
+		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
+		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 		trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
 					  __pa(&vcpu->arch.regs));
 		kvmhv_restore_hv_return_state(vcpu, &hvregs);
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index dea3eca3648a..f5fef7398e37 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -126,6 +126,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	s64 hdec;
 	u64 tb, purr, spurr;
 	u64 *exsave;
+	bool ri_clear;
 	unsigned long msr = mfmsr();
 	int trap;
 	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
@@ -197,9 +198,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
-	mtspr(SPRN_SRR1, vcpu->arch.shregs.srr1);
-
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
 	vcpu->arch.ceded = 0;
@@ -225,6 +223,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
 
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
@@ -240,6 +245,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
 	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
 
+	/* HSRR interrupts leave MSR[RI] unchanged, SRR interrupts clear it. */
+	if ((local_paca->kvm_hstate.scratch0 & 0x2) &&
+				(vcpu->arch.shregs.msr & MSR_RI))
+		ri_clear = false;
+	else
+		ri_clear = true;
+
 	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
 	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
 		exsave = local_paca->exgen;
@@ -251,6 +263,14 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
 	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
+
+	if (ri_clear) {
+/// XXX this fires maybe on syscalls on mambo		WARN_ON((mfmsr() & MSR_RI));
+		__mtmsrd(MSR_RI, 1); /* set RI after reading machine check regs (DAR, DSISR, SRR0/1) and hstate scratch (which we need to move into exsave) */
+	} else {
+		WARN_ON(!(mfmsr() & MSR_RI));
+	}
+
 	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
 	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
 	vcpu->arch.regs.gpr[11] = exsave[EX_R11/sizeof(u64)];
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index d4bca93b79f6..7a645f4428c2 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -198,6 +198,7 @@ static void kvmppc_tb_resync_done(void)
  * value. Hence the idea is to resync the TB on every HMI, so that we
  * know about the exact state of the TB value. Resync TB call will
  * restore TB to host timebase.
+ *  XXX: could use new opal hmi handler flags for this
  *
  * Things to consider:
  * - On TB error, HMI interrupt is reported on all the threads of the core
@@ -290,6 +291,10 @@ long kvmppc_realmode_hmi_handler(void)
 	 */
 	wait_for_subcore_guest_exit();
 
+	/*
+	 * XXX: Is this safe with independent threads mode?
+	 */
+
 	/*
 	 * At this point we are sure that primary threads from each
 	 * subcore on this core have completed guest->host partition
-- 
2.23.0

