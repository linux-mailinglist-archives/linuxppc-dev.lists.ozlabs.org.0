Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18345A00A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:22:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0ZK60jKz304V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:22:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ofh0WM8w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ofh0WM8w; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxm0qJ4z3c7x
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:19 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id s137so124510pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qp69pn3wDlEWlnm2wT7mMNreMa17JUJZRygt9viEHAM=;
 b=Ofh0WM8w4ryaQRiiqyb/PcvZeFpuDipiBVs1sA2L/plnuwEk8ygi/XTiv3m12W3kUv
 zDjZea8G71rHfK/Kuaruvmv+ZPIF7Q5lDzLWC4eBti35EXMMVa/F/VMDZ4W997jPmxSx
 /nkJ+IEu4qTulK+cn3sONZiEALOiN2DNusbzP/NHHbWMKK4rKT1gud1ZF9GASB08OBQk
 9DdJX5HLeP4MJki+fh51Q8RPcL7XkXlL5a0YYT0jyatRVOQxuYT7U2k4ei+lam0I6LJt
 G2MuDL2jQjGtITHtMoVCdCifaP0mq0OYNZVgxZLuOfQ3vmw1UIAPoj77QIU7xzlpq18W
 8HiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qp69pn3wDlEWlnm2wT7mMNreMa17JUJZRygt9viEHAM=;
 b=KQqWMLupHDQ7Rq2SwFhdOrC7Ba4qfCW/ZApbsP/jlxklrsaIQQBJhtUlvNXmW3MIIs
 okUAfUpNPGWqxXC1RtLYKJzCWgBXlkl0kD1RLEKhJ11jwBW1POn1WBoF2E7BvWT0RRn9
 BBsRxw2RPWyVbwq3oJd09rZrvBJ7XdS/UTxMDc50zyGxKrc5m/vdDqoEixnz2uORfAKc
 8puWbCm5MOasZtJqtdIZdCLKuBWgcS22TPd2B4eO846pJOMwBg2LA0XBREKgJmHOr5u2
 cGOT85Q7xk+DzKTaDn41CzoFUI6R9AaDjMXYxoo8ry8MtbPQAoKgtKAkOMlwUVxq+WVs
 y1lw==
X-Gm-Message-State: AOAM531cA0URfHLZpdDmc/J1BjGuNN0hb2hWfe4jfeDdeV+8kiQQblBN
 6CI1+21wm6987IkUx45HvHT/DKanMd5D8w==
X-Google-Smtp-Source: ABdhPJx0nb06uTUXhQYYsK0iSbTi6n1zTZ8T41foNGz5q8hWWj8DGKenR9Ed/ZyOw094AjFlRbuN3g==
X-Received: by 2002:aa7:8198:0:b0:44b:e191:7058 with SMTP id
 g24-20020aa78198000000b0044be1917058mr3752130pfi.39.1637661258054; 
 Tue, 23 Nov 2021 01:54:18 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 45/53] KVM: PPC: Book3S HV P9: Improve mfmsr performance on
 entry
Date: Tue, 23 Nov 2021 19:52:23 +1000
Message-Id: <20211123095231.1036501-46-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
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
index 0a319ed9c2fd..96f0fda50a07 100644
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
index 65c9157579a3..e532a7010dba 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3896,6 +3896,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	s64 dec;
 	int trap;
 
+	msr = mfmsr();
+
 	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
@@ -3906,24 +3908,10 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
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
index 9e899c813803..d123813296ba 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -707,6 +707,44 @@ static void check_need_tlb_flush(struct kvm *kvm, int pcpu,
 	cpumask_clear_cpu(pcpu, need_tlb_flush);
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
@@ -740,6 +778,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
+	/* Save MSR for restore, with EE clear. */
+	msr = mfmsr() & ~MSR_EE;
+
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
 	host_psscr = mfspr(SPRN_PSSCR_PR);
@@ -761,35 +802,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
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

