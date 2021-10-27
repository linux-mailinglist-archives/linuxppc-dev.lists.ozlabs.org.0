Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E758343CC04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 16:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfW9q5bJJz307g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 01:22:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZB0T1FF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aZB0T1FF; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfW9454Y6z2yHW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 01:21:59 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id y7so2871073pfg.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LcgMg779T/gdBXlrNU3YHrX7Gk6gacaR5KBJWJtm+pg=;
 b=aZB0T1FFZxSGyIpj59SsCIORPIGrEoeVOClNLIUCiUOsG5zahPLh7gqzsZH/29YSPU
 C7+5bsEj80wNpWA5naRezLjvxAifOnrOsScbYdvczPPmY0CIj7bTgPvZt17L8o8lqq/p
 fVT87s96rdixTjLDQ2F5MfYqhemxGZyJUnxj/OFZ1dmAqnGR51QhkCSG/x1Ncvzs8sp9
 MJTisyKwWzCzSjBmf1VpUTNKHeR/6d0DyiQ9hfOGH+j9iAk+Yh6hUzuRnOusxD+PmdXm
 Vta71sU1BItic0lHoRmoc97RnlWO0esPgWRA9CIskTN5a+J4cOvJWsIsKDfprIJIG3Dh
 Os7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LcgMg779T/gdBXlrNU3YHrX7Gk6gacaR5KBJWJtm+pg=;
 b=cTKhfDlUli97kcxDA8lCdQsm0N6enB1rxL7HyApH+p4ppqFGJtxSr47iYZEf+ZWnJv
 ujONeenFBQUfHA+BuaJT8Kfmq0FwhKUxDeq6J82bMdItbjibYvz48+Q/cpumiVcR7cwr
 nmRP32hNLekDuTe5x0+GAxoi5umokZKn9l7CDSlW96xqGmmDNaMzFEltF+zy1OCt32kH
 m7r2h85i4TAroOrNBN06FOX68uLmYMUY18NCcYU8x5ygdrGf1HijbxEigooPYaRjIewT
 4D4MRNRnIYoQ/zf9LKRMT6soMI2/pgG9l9SnRtudvvdskdg2lcP8lY8vuhVMix/+ZyJE
 VqNA==
X-Gm-Message-State: AOAM532U+/pN9fzgKZverbVCYp01f1LswPjj+RCEdUaH1lH2gOffWOlF
 VoqbVv0ug0lDH6FkAfcrnWPHJ76bli8=
X-Google-Smtp-Source: ABdhPJy+gtXfVi2Tyiqe+BeTvidQTvDcUYUelFUBl7Qe7/pxsIKAYTZ/yS6QFsJsrvKFw03g9IHYjA==
X-Received: by 2002:a63:9308:: with SMTP id b8mr24176255pge.104.1635344516390; 
 Wed, 27 Oct 2021 07:21:56 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id d14sm159979pfu.124.2021.10.27.07.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:21:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] KVM: PPC: Tick accounting should defer vtime accounting
 'til after IRQ handling
Date: Thu, 28 Oct 2021 00:21:50 +1000
Message-Id: <20211027142150.3711582-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Laurent Vivier <lvivier@redhat.com>

Commit 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest
context before enabling irqs") moved guest_exit() into the interrupt
protected area to avoid wrong context warning (or worse). The problem is
that tick-based time accounting has not yet been updated at this point
(because it depends on the timer interrupt firing), so the guest time
gets incorrectly accounted to system time.

To fix the problem, follow the x86 fix in commit 160457140187 ("Defer
vtime accounting 'til after IRQ handling"), and allow host IRQs to run
before accounting the guest exit time.

In the case vtime accounting is enabled, this is not required because TB
is used directly for accounting.

Before this patch, with CONFIG_TICK_CPU_ACCOUNTING=y in the host and a
guest running a kernel compile, the 'guest' fields of /proc/stat are
stuck at zero. With the patch they can be observed increasing roughly as
expected.

Fixes: e233d54d4d97 ("KVM: booke: use __kvm_guest_exit")
Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
Cc: <stable@vger.kernel.org> # 5.12
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
[np: only required for tick accounting, add Book3E fix, tweak changelog]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- I took over the patch with Laurent's blessing.
- Changed to avoid processing IRQs if we do have vtime accounting
  enabled.
- Changed so in either case the accounting is called with irqs disabled.
- Added similar Book3E fix.
- Rebased on upstream, tested, observed bug and confirmed fix.

 arch/powerpc/kvm/book3s_hv.c | 30 ++++++++++++++++++++++++++++--
 arch/powerpc/kvm/booke.c     | 16 +++++++++++++++-
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2acb1c96cfaf..7b74fc0a986b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3726,7 +3726,20 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
+	context_tracking_guest_exit();
+	if (!vtime_accounting_enabled_this_cpu()) {
+		local_irq_enable();
+		/*
+		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * ticks that occurred while running the guest are accounted to
+		 * the guest. If vtime accounting is enabled, accounting uses
+		 * TB rather than ticks, so it can be done without enabling
+		 * interrupts here, which has the problem that it accounts
+		 * interrupt processing overhead to the host.
+		 */
+		local_irq_disable();
+	}
+	vtime_account_guest_exit();
 
 	local_irq_enable();
 
@@ -4510,7 +4523,20 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
+	context_tracking_guest_exit();
+	if (!vtime_accounting_enabled_this_cpu()) {
+		local_irq_enable();
+		/*
+		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * ticks that occurred while running the guest are accounted to
+		 * the guest. If vtime accounting is enabled, accounting uses
+		 * TB rather than ticks, so it can be done without enabling
+		 * interrupts here, which has the problem that it accounts
+		 * interrupt processing overhead to the host.
+		 */
+		local_irq_disable();
+	}
+	vtime_account_guest_exit();
 
 	local_irq_enable();
 
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 977801c83aff..8c15c90dd3a9 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1042,7 +1042,21 @@ int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	}
 
 	trace_kvm_exit(exit_nr, vcpu);
-	guest_exit_irqoff();
+
+	context_tracking_guest_exit();
+	if (!vtime_accounting_enabled_this_cpu()) {
+		local_irq_enable();
+		/*
+		 * Service IRQs here before vtime_account_guest_exit() so any
+		 * ticks that occurred while running the guest are accounted to
+		 * the guest. If vtime accounting is enabled, accounting uses
+		 * TB rather than ticks, so it can be done without enabling
+		 * interrupts here, which has the problem that it accounts
+		 * interrupt processing overhead to the host.
+		 */
+		local_irq_disable();
+	}
+	vtime_account_guest_exit();
 
 	local_irq_enable();
 
-- 
2.23.0

