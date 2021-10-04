Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E04213C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:14:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQlW00Qlz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EDKj8e2O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EDKj8e2O; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSv4cmvz3brd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:51 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id q201so4329004pgq.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kbNMN5/ycF90abyDvuus1UyFcgyOK6fk2IGspBrPPPc=;
 b=EDKj8e2OCD1oNd6XMKXNSyzhvjqRttg0JdlauhpsHZig3ufREVZQJZXGJ9Pjygq0F3
 5r7thMf9llIC+mx+PAznq0dMCNPUvg419LUXbxQ/1JE3WnaUb1SB+WM/J0Xih3tYcnis
 BStK+ZJF1FQ3ES5bOQtPtcWHwG2VXEOmSeuMxpXdv8Kt7iKc3T22YE1bzeY2n0VUZM2q
 GOmTYo7z6ldBS9JFkJ/M4kFRUljo2D+/XRIRyrMuuAtX2nqAFPNUMaFDTve1foR/FnhH
 IfuE+g4D0BCajyxF1s4Y2vjtdWzwaT4PNYkI6jONzYSs69nSeDxInXAMlpH1BU7Am55l
 pVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kbNMN5/ycF90abyDvuus1UyFcgyOK6fk2IGspBrPPPc=;
 b=pYyu8O/6fXC6/cH3VbimzSa7/jwxPvgvf3zfVi2RTwTEmlaxQOpRpZqsp4hqtQcNgk
 ZRV1Anv/xCot9vgbQ8V0fMke3zHrzRXkqYKN7Jo8ixhDHAtRt0TDAR1yGnqVAcK9hfMc
 JgGRTMMQksNbfC7vD9MSwNn2A4KAnrFpEuL2mtdxKkSN42mCQJSH9AZQsmTbJKUVAJRC
 bk4bKIif2ASmLfgX5gGewQj7XBcw8Ub32WR7VT/wY2/Tfc/1heyNeExZJm6Ct4KlSOgP
 gVOBjvEDjYJCdQgkqsJvNdo+WoARRwf/o8c8PBd556jDsKXvpcVAz03+ke/ABI9laUE1
 ai6Q==
X-Gm-Message-State: AOAM532tEV0SfuvfuwbiSbthkm2yJXfF8ntAqRNOeGjOX+TzJZrXZ3KI
 V+CKkAPazDrJonG6U4ECFUE=
X-Google-Smtp-Source: ABdhPJxYgoK0eSIGz6nCE8LCrmlN+ynSfHHlsBS/gxu1ZN3R1c4RJZLKXwXJjDWqduKRYw303ZEMVQ==
X-Received: by 2002:a63:710d:: with SMTP id m13mr11593324pgc.467.1633363309813; 
 Mon, 04 Oct 2021 09:01:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 20/52] KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by
 delaying MSR[EE] disable
Date: Tue,  5 Oct 2021 02:00:17 +1000
Message-Id: <20211004160049.1338837-21-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
index 16365c0e9872..7e8ddffd61c7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4156,6 +4156,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
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
@@ -4667,6 +4679,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	unsigned long flags;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4710,11 +4723,11 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4769,7 +4782,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	guest_exit_irqoff();
 
-	local_irq_enable();
+	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
@@ -4827,7 +4840,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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

