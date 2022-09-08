Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B15B1EE1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:27:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNg0V0t0kz3cff
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9DXLNAu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i9DXLNAu;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNfyg4zmkz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:26:03 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id y136so12971985pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hZuRvJiw5iye7TlBCTHMxBMXEhn2X/qZw/+1K30Lz6A=;
        b=i9DXLNAuXBXRuKC0m8kyzyHJWZEM7tbpI6RxTWvPgYqr5gz6q3GXkQjw0o9nhN9NUc
         LhAC+OnJkcW28oC/1oQk8deUZSSCzcOztnfonW71y//9CrvJV+iHpmAqZ57j9JP12kGH
         1/z0pH30bmd8GQf8YsQyKL3ugKPQCLMiI9ZpVM9A4c7aXPAvQam3twCSy4eP4OEXt8jC
         dxCvKIMJ1IMHWjCZezVpCF5UtFpGbiC35F3L7WRb5luGDwpSnNID6P+outMdNhuuXKsk
         LERIMd4rzo0k7qjrvW+0PBF4LEv+eVa6nALKcsZa2n4a1o/oVyUltNtHTFYOCNIv62e+
         c08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hZuRvJiw5iye7TlBCTHMxBMXEhn2X/qZw/+1K30Lz6A=;
        b=3gMt0YA1H3oVzzQfc6ZAEVAMyOs0KR8fo17HxJqYuzSqh7OtIiB6MzHaE5MRMKzGvz
         pOhA8kDnNCTow/mo2JigS1BXbbjTBU6USJ3hYYI9ZHFP+dIHZSAAG51WdGG/wxnytNEh
         RBZcpOJuxBn+Uy6mO7zk76r2xT6f2IqxEcf6Rtx1orYZvWsbGBHeq25EVCKdsOvdA7d+
         NDvfkZbdSPfSN7WRbBZ4IJ0a0i6MPbkNFZz304MoJiI26o4fFlZbB7O1V0JNut4g58IE
         tClDI0No65M8K4uK2JRPMv4JL2ybFhILaQF65mspqcqkHCPo440MNcHmeo+Ucbq5bHP/
         Gpxg==
X-Gm-Message-State: ACgBeo3X4ho8WaNdWtUhZ4Bf0+aJZmlsH5QikUKzC/jIfbRQG3x2F5D8
	Mu1w8M6rP+bVlYHDjUGNcntASMKqJG8bsQ==
X-Google-Smtp-Source: AA6agR66vkU8jJVE9RzfXYZVet1kF/+I4i/oOEqp2i6cWYBd1/NNbn6sizbhz+iKvHJmVoHAYu4apA==
X-Received: by 2002:a63:f313:0:b0:434:346b:d074 with SMTP id l19-20020a63f313000000b00434346bd074mr8112513pgh.298.1662643560838;
        Thu, 08 Sep 2022 06:26:00 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001768517f99esm12505504plg.244.2022.09.08.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:26:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] KVM: PPC: Book3S HV: Update guest state entry/exit accounting to new API
Date: Thu,  8 Sep 2022 23:25:43 +1000
Message-Id: <20220908132545.4085849-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908132545.4085849-1-npiggin@gmail.com>
References: <20220908132545.4085849-1-npiggin@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the guest state and timing entry/exit accounting to use the new
API, which was introduced following issues found[1]. KVM HV does
possibly call instrumented code inside the guest context, and it does
call srcu inside the guest context which is fragile at best.

Switch to the new API, moving the guest context inside the
srcu_read_lock/unlock region.

[1] https://lore.kernel.org/lkml/20220201132926.3301912-1-mark.rutland@arm.com/

Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since RFC:
- Drop unrelated changes.
- Cut the amount of code churn to a minimum.

 arch/powerpc/kvm/book3s_hv.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f62dfaaf6c39..771b8b0e0329 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3840,23 +3840,17 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	for (sub = 0; sub < core_info.n_subcores; ++sub)
 		spin_unlock(&core_info.vc[sub]->lock);
 
-	guest_enter_irqoff();
+	guest_timing_enter_irqoff();
 
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
 
@@ -3891,11 +3885,10 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
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
@@ -3904,7 +3897,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		 */
 		local_irq_disable();
 	}
-	vtime_account_guest_exit();
+	guest_timing_exit_irqoff();
 
 	local_irq_enable();
 
@@ -4595,21 +4588,18 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	trace_kvm_guest_enter(vcpu);
 
-	guest_enter_irqoff();
+	guest_timing_enter_irqoff();
 
 	srcu_idx = srcu_read_lock(&kvm->srcu);
 
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
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
@@ -4618,11 +4608,10 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
 
-	context_tracking_guest_exit();
 	if (!vtime_accounting_enabled_this_cpu()) {
 		powerpc_local_irq_pmu_restore(flags);
 		/*
-		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * Service IRQs here before guest_timing_exit_irqoff() so any
 		 * ticks that occurred while running the guest are accounted to
 		 * the guest. If vtime accounting is enabled, accounting uses
 		 * TB rather than ticks, so it can be done without enabling
@@ -4631,7 +4620,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 		 */
 		powerpc_local_irq_pmu_save(flags);
 	}
-	vtime_account_guest_exit();
+	guest_timing_exit_irqoff();
 
 	powerpc_local_irq_pmu_restore(flags);
 
-- 
2.37.2

