Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A23E961D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFnv03HXz3ffv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:36:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jxQwq2T7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jxQwq2T7; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4K74xSz3dKj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:04:01 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so5352595pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7oBgAIHr3iz+YKgq9uJP4FTDyy08kLk6U1mSRH5irA=;
 b=jxQwq2T7WC7YROi7+OZ7M+dao1KyeAUQ075fReInC6El8usSkIMRgCX16fjms6CRMm
 exCRBhKYrw8cvlibk392a5RIXeeogqf+ej7kLRhlmJASwScfaXY1D6qXR8+8nH7mmSod
 gawmMPSYpSb0aDwjIQ1iOC3rfHd48G7QrCfMS3636A4cwDwuqWQ3yWB6/m/MIS7033PZ
 eshbDCZTmso6AE/RNzs7QV9WsmPt6joE4OSjgWexsEhNal6RJlc4JJIkgi/whj8GYXea
 iMzFVPb2TtFxq5JgLUHnhFeRwnY5clafZs1zXzoC2EQthANtMivh8HRw5DfQI+BU2Rx1
 U/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7oBgAIHr3iz+YKgq9uJP4FTDyy08kLk6U1mSRH5irA=;
 b=hV5/wLp2SL2Ya/McSLC5kTklqqQRuzn7ImQYyQBDbCtiLQ4zJ2Y/q/7L09ov3fgvge
 5spbIiHhSYrGXxdja4TYMY0detLjF7KQYmCZv/0Zym8ILt+43BxYy8GCk5awrrnItuZA
 N1k/H65qNEjXWtcsoq7/aQvpqXuL+Rdv6EAXK3ydyk0YvKEvt5g4VQx9blIz6002zou+
 kvYmnlCs8mUkUIVQ0yC7HIzYpgNJUq5VPhLWDXuxaw8wYGihd/Y4K4lCBMLh2OAeIbX1
 rFuyY0PNP3TDOrObvMcz4GLOETQC7Mf7nWlXB3lJSi+eaiKXWzQMKJPQnQkO33uGSC6D
 CncQ==
X-Gm-Message-State: AOAM530uymNsWGLjx8nYNiSxgN0MQRUvo8NVkIG+W9aJkM9duSn+O7Kh
 jY7ZwZ3AX1Wq/bMvB+GPE7U=
X-Google-Smtp-Source: ABdhPJwvBlzVT3tAQ86PfoQp6xob1AMq1vberonr4Ji92d2MowZKK4CXgDYZTwt7LDk9RZCxB7OB7g==
X-Received: by 2002:a65:5bc9:: with SMTP id o9mr407397pgr.24.1628697839973;
 Wed, 11 Aug 2021 09:03:59 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 52/60] KVM: PPC: Book3S HV P9: Improve mfmsr performance on
 entry
Date: Thu, 12 Aug 2021 02:01:26 +1000
Message-Id: <20210811160134.904987-53-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

Rearrange the MSR saving on entry so it does not follow the mtmsrd to
disable interrupts, avoiding a possible RAW scoreboard stall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  2 +
 arch/powerpc/kvm/book3s_hv.c             | 18 ++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 66 +++++++++++++++---------
 3 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index f721bb1a5eab..ee25e93febe6 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -154,6 +154,8 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
+unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsigned long msr);
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb);
 
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7337c0ca94c6..979223018c8e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3881,6 +3881,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	s64 dec;
 	int trap;
 
+	msr = mfmsr();
+
 	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
@@ -3891,24 +3893,10 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	 */
 	host_psscr = mfspr(SPRN_PSSCR_PR);
 
-	hard_irq_disable();
+	kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
 	if (lazy_irq_pending())
 		return 0;
 
-	/* MSR bits may have been cleared by context switch */
-	msr = 0;
-	if (IS_ENABLED(CONFIG_PPC_FPU))
-		msr |= MSR_FP;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		msr |= MSR_VEC;
-	if (cpu_has_feature(CPU_FTR_VSX))
-		msr |= MSR_VSX;
-	if ((cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
-		msr |= MSR_TM;
-	msr = msr_check_and_set(msr);
-
 	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
 		msr = mfmsr(); /* TM restore can update msr */
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 94b15294a388..fa6ac153c0f9 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -628,6 +628,44 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	}
 }
 
+unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsigned long msr)
+{
+	unsigned long msr_needed = 0;
+
+	msr &= ~MSR_EE;
+
+	/* MSR bits may have been cleared by context switch so must recheck */
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr_needed |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr_needed |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr_needed |= MSR_VSX;
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+			(vcpu->arch.hfscr & HFSCR_TM))
+		msr_needed |= MSR_TM;
+
+	/*
+	 * This could be combined with MSR[RI] clearing, but that expands
+	 * the unrecoverable window. It would be better to cover unrecoverable
+	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
+	 *
+	 * Much more difficult and less worthwhile to combine with IR/DR
+	 * disable.
+	 */
+	if ((msr & msr_needed) != msr_needed) {
+		msr |= msr_needed;
+		__mtmsrd(msr, 0);
+	} else {
+		__hard_irq_disable();
+	}
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	return msr;
+}
+EXPORT_SYMBOL_GPL(kvmppc_msr_hard_disable_set_facilities);
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct p9_host_os_sprs host_os_sprs;
@@ -661,6 +699,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
+	/* Save MSR for restore, with EE clear. */
+	msr = mfmsr() & ~MSR_EE;
+
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
 	host_psscr = mfspr(SPRN_PSSCR_PR);
@@ -682,35 +723,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
-	/*
-	 * This could be combined with MSR[RI] clearing, but that expands
-	 * the unrecoverable window. It would be better to cover unrecoverable
-	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
-	 *
-	 * Much more difficult and less worthwhile to combine with IR/DR
-	 * disable.
-	 */
-	hard_irq_disable();
+	msr = kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
 	if (lazy_irq_pending()) {
 		trap = 0;
 		goto out;
 	}
 
-	/* MSR bits may have been cleared by context switch */
-	msr = 0;
-	if (IS_ENABLED(CONFIG_PPC_FPU))
-		msr |= MSR_FP;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		msr |= MSR_VEC;
-	if (cpu_has_feature(CPU_FTR_VSX))
-		msr |= MSR_VSX;
-	if ((cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
-		msr |= MSR_TM;
-	msr = msr_check_and_set(msr);
-	/* Save MSR for restore. This is after hard disable, so EE is clear. */
-
 	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
 		msr = mfmsr(); /* MSR may have been updated */
 
-- 
2.23.0

