Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32623B0255
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nqt4Wzpz3fR3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oXgKGnSJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oXgKGnSJ; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ng64Jqzz308h
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:42 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id y13so4136708plc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZsiQN9J6oa0kU+XOcLhtqmzOw5qPUAZ0H870q5gDHs=;
 b=oXgKGnSJWf02f7//UKclDr/sY/W/n5Ltsl+LkJNmPb7GfodfTJvlsxGyhXUPNf2HhY
 ftzY/eGPAzPbkVMjQ5p3GMGJb8QxjqImr8RoT44qhpTcbPm2Z/Ngt4RZfeLp6VH/iv3r
 D2Pz5ZVluJvRVqmjl2SiiOv5lPdyQk8dubaIaKEDzk/9Rz6IfmwqEPs2G2nFeCJ3Zc4N
 Bjl6X/8aCGsk9XDoweWzDMEEo8CUceMXPFxzvM6I+ZJEV7PZlZ158FYZikjRWfylAB2z
 386jJHZqU6awBLtTkwGxRnNfVGla8UKM9pQ9N1wurjqecxdG08w4vZrv+v7dqbFTz0UU
 WC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZsiQN9J6oa0kU+XOcLhtqmzOw5qPUAZ0H870q5gDHs=;
 b=OI+1qOcsQbFHzTvFnVvAql5KvyVy5/FUXDqHu5y0uENZhbgiHDSDwmtasP9Ly97k5h
 rsYqyLcgGaCRC66lxsRSyqs+Jm8Q7/rJ9k49n8TGcmEH2AhbcCRDeNgit5g0nD8A2KS8
 wjvz8QMzoe6e7WLbVoUmTxqUiif6D+RwwduxvdUiXZCuUy3ghHFgPmuBtA+6M4AowFPa
 nFAAy2FNlgwdwt5Jukvn41VI7cO9kMKNRNpiwJRHZVbeaYMlVPXGuJ3LnxediCyGkNcb
 f1ZZZDksB+QLdYY9qES5i8sbffi0ZzM44hRPZ06b8ycfXcHVNEhMy2JIZZxAtJG4NNQG
 XkGw==
X-Gm-Message-State: AOAM531PhJFjV9YNC1bIvIKyIGPJSZMdiDZ00ygBGAgEAGelMrXNNJBm
 pTBMjqFg6mn47LouMR6MGUU=
X-Google-Smtp-Source: ABdhPJxZiINE41XCeFsG3jcgc0NnxGeUyLgSthjARikfH6htHg4KAKhBj5QVacEqpKZ6xZ1d8bNJKQ==
X-Received: by 2002:a17:90b:4392:: with SMTP id
 in18mr3313783pjb.54.1624359519819; 
 Tue, 22 Jun 2021 03:58:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 18/43] KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling
 by delaying MSR[EE] disable
Date: Tue, 22 Jun 2021 20:57:11 +1000
Message-Id: <20210622105736.633352-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

-12 cycles (7791) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3ac5dbdb59f8..b8b0695a9312 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4015,6 +4015,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
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
@@ -4512,6 +4524,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	unsigned long flags;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4555,11 +4568,11 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4614,7 +4627,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
-	local_irq_enable();
+	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
@@ -4672,7 +4685,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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

