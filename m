Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC35459FBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0By3YT4z3fTq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kPcH2Ccx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=kPcH2Ccx; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzwn5fxHz30GD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:29 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id h63so17791597pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RnWYYrfJACtUf+9Tzxs5YWBeEkgbQXB7834JxC8z2M=;
 b=kPcH2CcxT1HMtsRZM1dmsWLJwLPCh5EtA7hTTJb8q628yQ8+JlnOVSsqzStTq+ynuQ
 EzMYKj07stzMFv/1OzJubA8Qn9LsC0CG6uP9QYwt8ZdPqkBuisb+xCr8SK7awxhBBWE3
 JBmnUtnmQwZc0MmR41wTjsdljZzSzagiwfvqjxO4NuKC6K18FC7Usj7z3m+TfLwhvsoQ
 kytqMLCoU21K/S0szUyhMYa6zduAVGDjYwxzCe8Vi/nTNBe38Bpm6gUHTJWdYcTV54X9
 xmQN+y2feVN3GYRSyM1qSX8VEdAQp6rX1xbdxSzpBkDkTS00Mmsu0/XBS4+5/Wt0MdT2
 Xj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RnWYYrfJACtUf+9Tzxs5YWBeEkgbQXB7834JxC8z2M=;
 b=R2QQneSj+vn2DZsAp7UePoUd0AR9OMEmWKtARUbtRxzdgMPoIKLSD1gEZ4B5Z0neW1
 aRCw/ud0zlC9Z1Td98qYWvOrmPHtcOTP+YllHBecXzZkTXjbxEX1OTWFaAXdBcnQxW9R
 UgS0vqBNc4Azf8E4EzgXYldnjaRjSWSgpLO6DTU6bguC6iS2TF+I1HMmFyz6amd9udUS
 Q6iqf59tttmhYrldpL0Cvh38aFjkOjGDy8kD7Vw3+XFREDuvC8VS4wjzipdZ+4qKC45z
 j+AsSHrPhF/6FgH+7z1R8tuUdBp5kQpNuhd01pk41BkJA7KRjw5my4QEB2LXvc/ds0hQ
 JbTg==
X-Gm-Message-State: AOAM530zMsmnP7MAlNOlaQEf6dTGwgDhQiMWPx7c9LS5QQwqYSgAEHFC
 pZnwXUK2d0F7Uz10QLqHAWbZMtxohYSCVg==
X-Google-Smtp-Source: ABdhPJxWsRC7GjHUxiNK8c221T1nbBvPq/9PTSXQZOKBfvHEGP9gO+ZGtpMAncXPSbknrrMnH6Jdtg==
X-Received: by 2002:a05:6a00:1946:b0:492:64f1:61b5 with SMTP id
 s6-20020a056a00194600b0049264f161b5mr3944128pfk.52.1637661207414; 
 Tue, 23 Nov 2021 01:53:27 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 20/53] KVM: PPC: Book3S HV P9: Improve mtmsrd scheduling by
 delaying MSR[EE] disable
Date: Tue, 23 Nov 2021 19:51:58 +1000
Message-Id: <20211123095231.1036501-21-npiggin@gmail.com>
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
index 541a023e25dd..6b0689589e13 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4169,6 +4169,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
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
@@ -4680,6 +4692,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct kvmppc_vcore *vc;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	unsigned long flags;
 
 	trace_kvmppc_run_vcpu_enter(vcpu);
 
@@ -4723,11 +4736,11 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4795,7 +4808,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 	vtime_account_guest_exit();
 
-	local_irq_enable();
+	powerpc_local_irq_pmu_restore(flags);
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
@@ -4853,7 +4866,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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

