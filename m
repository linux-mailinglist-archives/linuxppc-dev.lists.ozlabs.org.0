Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC13E95CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFR84g0Wz3f1G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:20:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=A9uYqJaR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A9uYqJaR; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF385LFpz3d7k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:00 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id j1so4192626pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B1FzzEpWRWY6cyBzpZZ3791Kwi4/Y0fUuP+n4T9dwEg=;
 b=A9uYqJaRiCkqI8Cb3FkasbSgEl3gK5mwm5eqEJmExODe/P//TGj+1FTMJseEzS0fqc
 zAWshLkHMARXKwONch0fIYzJfAMDa+TjfNHDW12dPlExNUInelsRUrdWIgOdHBdRHJc1
 gBI8wj2zM1QYPwnIAVjrtDtHSsU2Q5ygmHRQtOP/0M1IOCNo3lt29gLdGH12kLvdJP03
 fnFc8IhlHHqo/oTCdONAMPdJFFlDHWxRIOAa6bm4veqFCYdNtER7TfyWEy3iTFIKaduX
 FqS0PGqjsWEFbypa7+mNhSCdK/ccLLJs+mIUS3qhcUYYbZlwTS+ysaeNV6HuM1ELOZGq
 ZWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B1FzzEpWRWY6cyBzpZZ3791Kwi4/Y0fUuP+n4T9dwEg=;
 b=ER9xi5AqckvUJOQ0CuIEC4g+MBIjrjimcvViyvvFD4ocDeLWGmi1DjnBdPfezDTIiN
 3rn9tvNyl+X3yqQdb87jAsMhbU+m3plHo3Pb+RlvSJfBHK+XKLJdVcONUQqiVyiPsxC3
 2EZNammqwAosbBw47NeFR2kuTGUXVIaMHGk3M5dV5A67HNzycDHsZ0RlZLlMRdf/U4pq
 lki2HY46HBYZSP3sO8NLGu3KdSh/1tT2/OSwL7FgBtPUq5B6YesZmJ7oCCKHiiA/l0y3
 GCWq+mE7dVj7+JjlVMSQ6A9DEsybjJkMMMd2Ir15/i50khxUtyXBlhoi0JH4FmEdMAVV
 XpOQ==
X-Gm-Message-State: AOAM531yDjeDt274CIQyXpRCAsvWKo8yTINZe36x7XpuW2oof0u0oWGH
 V3VbxQ5dXWOHv8pFu9rrAns=
X-Google-Smtp-Source: ABdhPJyN2EA7DwVy9t1bAH9Q7tLIwAsGs34tgc8S/b0Te5GkFuudS97nzvmnpFCRgNmjiSPTv3hh1A==
X-Received: by 2002:a05:6a00:1c6d:b029:3cd:da92:7296 with SMTP id
 s45-20020a056a001c6db02903cdda927296mr9159427pfw.33.1628697778762; 
 Wed, 11 Aug 2021 09:02:58 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 28/60] KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by
 delaying MSR[EE] disable
Date: Thu, 12 Aug 2021 02:01:02 +1000
Message-Id: <20210811160134.904987-29-npiggin@gmail.com>
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

Moving the mtmsrd after the host SPRs are saved and before the guest
SPRs start to be loaded can prevent an SPR scoreboard stall (because
the mtmsrd is L=1 type which does not cause context synchronisation.

This is also now more convenient to combined with the mtmsrd L=0
instruction to enable facilities just below, but that is not done yet.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 77a4138732af..376687286fef 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4155,6 +4155,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
+	/*
+	 * This could be combined with MSR[RI] clearing, but that expands
+	 * the unrecoverable window. It would be better to cover unrecoverable
+	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
+	 *
+	 * Much more difficult and less worthwhile to combine with IR/DR
+	 * disable.
+	 */
+	hard_irq_disable();
+	if (lazy_irq_pending())
+		return 0;
+
 	/* MSR bits may have been cleared by context switch */
 	msr = 0;
 	if (IS_ENABLED(CONFIG_PPC_FPU))
@@ -4654,6 +4666,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	unsigned long flags;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4697,11 +4710,11 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (kvm_is_radix(kvm))
 		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
-	local_irq_disable();
-	hard_irq_disable();
+	/* flags save not required, but irq_pmu has no disable/enable API */
+	powerpc_local_irq_pmu_save(flags);
 	if (signal_pending(current))
 		goto sigpend;
-	if (lazy_irq_pending() || need_resched() || !kvm->arch.mmu_ready)
+	if (need_resched() || !kvm->arch.mmu_ready)
 		goto out;
 
 	if (!nested) {
@@ -4756,7 +4769,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
-	local_irq_enable();
+	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
@@ -4814,7 +4827,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	run->exit_reason = KVM_EXIT_INTR;
 	vcpu->arch.ret = -EINTR;
  out:
-	local_irq_enable();
+	powerpc_local_irq_pmu_restore(flags);
 	preempt_enable();
 	goto done;
 }
-- 
2.23.0

