Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267BB4C16E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 16:34:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3g832b6kz3cNW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 02:34:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M+U0kyMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M+U0kyMP; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3g7P48hDz30Q9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:34:08 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id h125so20311179pgc.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 07:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMel7Fz8t8HlxJOCBu85KHEQ5yzL0wyZ+rcFmUgdy0E=;
 b=M+U0kyMPm3TH6C4hYPCfETqlvkW8OeZMDr3MxrOQKcgjjscL6+NhewFa3tmrV4kQS0
 oj6eVETfJCzUCfynDvnhaXpiYZVSoGOKyZITyS7u/4634W26YJutH6JmzKw2gvcnfgTt
 ukY1Ni2TWuisX7b8AAlkumyBIftwI/defLPa2zdsLed1VXMiYbTQkycANJf3f2i8RYlE
 8OAQABbUCX5Ed2MHQ/Jfu9lUEBicYuxysVoCopPyOzAQBiX6gcaLEYz81824sGa+6hnN
 DTgNrTUQY+Vg908seSlMrU+mxmOP0eiN9cys8KzmRSeK5hviuHI/Qdsh6+qtAo2v/uEr
 YrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMel7Fz8t8HlxJOCBu85KHEQ5yzL0wyZ+rcFmUgdy0E=;
 b=PtbLmnlS5D1GbtUqW8ocro26zfdMaPwDA9iJ9fAnjOrzTPJw/fPBg1CcQICgKVrNKl
 9a6hH7h0wCZ3h2Q6/QHoasugm9iKl2ixfrYfT5wRvYFztNDtqzG7HOwAvFryr4T2twYx
 RurMZYWh9w4u2/fw6s+mfBN8DRiNv2bRbBP3A8jHVh2s5+8pOfK8urrV5XiwZqq/WD5D
 1yBXtS/XIVgpmBp2TYteFJ9qrOtQZBbjVzzVmR+ci/KVyzlmQv4Ltx7Oxocglxsq0vGi
 bwX9TSMJw7WGioMoVyyBhK7O8YUkF8AS3MWbfqsAiTQwWHcWdMRuNW05qIhou5Fo9V1w
 oDog==
X-Gm-Message-State: AOAM5337U4Fgh43glqHkyQvYddk9OikEEnESOJ6XwKyjKbCWSWZAc5MM
 QkX0PEK3WHkVwiuf1qEoX0rXyQy6X5c=
X-Google-Smtp-Source: ABdhPJwoyjwr4QcmMC4pRtKeQOfjk0yapbRuUrL4W2UNSTw0Si5DrRoixfr0Vy9erLQ104mC2Yay5w==
X-Received: by 2002:a05:6a00:1251:b0:4f1:2a1:3073 with SMTP id
 u17-20020a056a00125100b004f102a13073mr317957pfi.72.1645630444036; 
 Wed, 23 Feb 2022 07:34:04 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-212-59.static.tpgi.com.au.
 [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id l14sm3271165pjz.32.2022.02.23.07.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 07:34:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] KVM: PPC: Book3S HV: Update guest state entry/exit
 accounting to new API
Date: Thu, 24 Feb 2022 01:33:52 +1000
Message-Id: <20220223153352.2590602-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the guest state and timing entry/exit accounting to use the new
API, which was introduced following issues found[1]. KVM HV does not
seem to suffer from those issues listed, but it does call srcu inside
the guest context which is fragile at best. The new API allows guest
entry timing to be de-coupled from state entry.

Change to the new API, move the srcu_read_lock/unlock outside the guest
context, move tracing related entry/exit together with the guest state
switches, and extend timing coverage out to include the secondary thread
gathering in the P7/8 path.

[1] https://lore.kernel.org/lkml/20220201132926.3301912-1-mark.rutland@arm.com/

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
KVM PR and BookE possibly have more issues (like taking host interrupts
in guest context) but look harder to fix.

Thanks,
Nick

 arch/powerpc/kvm/book3s_hv.c | 39 ++++++++++++------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 84c89f08ae9a..4f0915509dbb 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3683,6 +3683,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		return;
 	}
 
+	guest_timing_enter_irqoff();
+
 	kvmppc_clear_host_core(pcpu);
 
 	/* Decide on micro-threading (split-core) mode */
@@ -3812,23 +3814,15 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	for (sub = 0; sub < core_info.n_subcores; ++sub)
 		spin_unlock(&core_info.vc[sub]->lock);
 
-	guest_enter_irqoff();
-
 	srcu_idx = srcu_read_lock(&vc->kvm->srcu);
 
+	guest_state_enter_irqoff();
 	this_cpu_disable_ftrace();
 
-	/*
-	 * Interrupts will be enabled once we get into the guest,
-	 * so tell lockdep that we're about to enable interrupts.
-	 */
-	trace_hardirqs_on();
-
 	trap = __kvmppc_vcore_entry();
 
-	trace_hardirqs_off();
-
 	this_cpu_enable_ftrace();
+	guest_state_exit_irqoff();
 
 	srcu_read_unlock(&vc->kvm->srcu, srcu_idx);
 
@@ -3863,11 +3857,10 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	kvmppc_set_host_core(pcpu);
 
-	context_tracking_guest_exit();
 	if (!vtime_accounting_enabled_this_cpu()) {
 		local_irq_enable();
 		/*
-		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * Service IRQs here before guest_timing_exit_irqoff() so any
 		 * ticks that occurred while running the guest are accounted to
 		 * the guest. If vtime accounting is enabled, accounting uses
 		 * TB rather than ticks, so it can be done without enabling
@@ -3876,7 +3869,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		 */
 		local_irq_disable();
 	}
-	vtime_account_guest_exit();
+	guest_timing_exit_irqoff();
 
 	local_irq_enable();
 
@@ -4520,33 +4513,28 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
 
-	trace_kvm_guest_enter(vcpu);
-
-	guest_enter_irqoff();
-
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
+	trace_kvm_guest_enter(vcpu);
+	guest_timing_enter_irqoff();
+	guest_state_enter_irqoff();
 	this_cpu_disable_ftrace();
 
-	/* Tell lockdep that we're about to enable interrupts */
-	trace_hardirqs_on();
-
 	trap = kvmhv_p9_guest_entry(vcpu, time_limit, lpcr, &tb);
 	vcpu->arch.trap = trap;
 
-	trace_hardirqs_off();
-
 	this_cpu_enable_ftrace();
+	guest_state_exit_irqoff();
+	trace_kvm_guest_exit(vcpu);
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
 	set_irq_happened(trap);
 
-	context_tracking_guest_exit();
 	if (!vtime_accounting_enabled_this_cpu()) {
 		local_irq_enable();
 		/*
-		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * Service IRQs here before guest_timing_exit_irqoff() so any
 		 * ticks that occurred while running the guest are accounted to
 		 * the guest. If vtime accounting is enabled, accounting uses
 		 * TB rather than ticks, so it can be done without enabling
@@ -4555,7 +4543,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		 */
 		local_irq_disable();
 	}
-	vtime_account_guest_exit();
+	guest_timing_exit_irqoff();
 
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
@@ -4575,7 +4563,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			  kvmppc_get_gpr(vcpu, 3) == H_ENTER_NESTED)))
 		kvmppc_core_dequeue_dec(vcpu);
 
-	trace_kvm_guest_exit(vcpu);
 	r = RESUME_GUEST;
 	if (trap) {
 		if (!nested)
-- 
2.23.0

