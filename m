Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5EB6B1677
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 00:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PX7hr1NPSz3chS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sai5S0sk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3obkjzaykdlunzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sai5S0sk;
	dkim-atps=neutral
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PX7gx2w1Hz2xY3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 10:24:43 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id p5-20020a056a0026c500b005cbeecd5c0dso204281pfw.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 15:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678317880;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31I/66ZbofU/Nk2qVtIf1lMcjjuaecDM5cG516tV2lE=;
        b=sai5S0skSzcUtZzyiz2IlpPTGo14T0H3FbpxEJEj1V6Q28YhcwpvJP+LeOcK+ikL1z
         lW8yEw0futR4uJ+/CUYbDg6tbB6EfDCzXd+NYqR12wu6ajrhCDaKGdHtlASy/v5bwB0V
         xW+9kVH+YyeRBQQp/IRTQ6PRZVQj257t/N2Y3elGixX81b/S1Casafg7iD5kUN51fO8S
         MqAJf9s9M11CHr2s4yycMB0Xyqof/KAB2ogLh3A376qy8jlgv+IJvacim2mKgQuYK86Y
         ENCULmkf7yfAWqXxGeNMBO7ktePaqEbiyPmZ9Bvq1nPoIPqNQXaCcz4esSyoB5usHRxB
         k1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678317880;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31I/66ZbofU/Nk2qVtIf1lMcjjuaecDM5cG516tV2lE=;
        b=ZHRhqiyn95jnnZkAkcGuisunljihQO7hPffSDCCT9YEDgNFFSIVkMWHQ9h9zX0JwAg
         PrWGJrpSYxMzWXsqC8lxF1dnpHSgSFtM9Mgu8Mrhuc4Ti5rzWb456KwcO7lx+qG5YbP4
         4GDpM2GnSzvCqygwaKKXpusS7msKcP4+TiwdSVDQCyKVLVli0dFlR5loOKMM8QjRXyCT
         PjmKY2orXWjRv8kRKe+vKK0lz/+kQmBDpAg6JLsC2H65+kOIqRuOfbvNxjeULQ9bWR5C
         C0z/q2osFtvrYn7iOn9+BtXpODaP50gAqTKEZsAusiRFrIwXdtO2vL1QNDD2tCczBqft
         kY9A==
X-Gm-Message-State: AO0yUKXgYhGzlaYIIc6mvTM0fVXDi54CNhPPf7yX4/y3Ss0z1fJ/wWfn
	8b3hxYNgEhqSZ1Yoz3SpPFP8u1+LrEs=
X-Google-Smtp-Source: AK7set91cIekvGyz37KGXJyidj3ek+gAcesMSlg1uywzEOVkU4MmvuhZ7paM+eJKHRVGbO6jHqoxuMUfMdU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:8f17:0:b0:507:4d05:15ef with SMTP id
 n23-20020a638f17000000b005074d0515efmr3985603pgd.11.1678317880007; Wed, 08
 Mar 2023 15:24:40 -0800 (PST)
Date: Wed,  8 Mar 2023 15:24:37 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230308232437.500031-1-seanjc@google.com>
Subject: [PATCH] KVM: PPC: Mark three local functions "static"
From: Sean Christopherson <seanjc@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tag a few functions that are local and don't have a previous prototype as
"static".

No functional change intended.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303031630.ntvIuYqo-lkp@intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

This was prompted by a new W=1 build warning for a commit that went in
through the KVM tree, but said commit has made its way to Linus, so it
shouldn't matter who grabs this.

 arch/powerpc/kvm/booke.c  | 5 +++--
 arch/powerpc/kvm/e500mc.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 01adffb24667..ce37d282be6d 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -623,7 +623,7 @@ static void arm_next_watchdog(struct kvm_vcpu *vcpu)
 	spin_unlock_irqrestore(&vcpu->arch.wdt_lock, flags);
 }
 
-void kvmppc_watchdog_func(struct timer_list *t)
+static void kvmppc_watchdog_func(struct timer_list *t)
 {
 	struct kvm_vcpu *vcpu = from_timer(vcpu, t, arch.wdt_timer);
 	u32 tsr, new_tsr;
@@ -1946,7 +1946,8 @@ static int kvmppc_booke_add_watchpoint(struct debug_reg *dbg_reg, uint64_t addr,
 	dbg_reg->dbcr0 |= DBCR0_IDM;
 	return 0;
 }
-void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap, bool set)
+static void kvm_guest_protect_msr(struct kvm_vcpu *vcpu, ulong prot_bitmap,
+				  bool set)
 {
 	/* XXX: Add similar MSR protection for BookE-PR */
 #ifdef CONFIG_KVM_BOOKE_HV
diff --git a/arch/powerpc/kvm/e500mc.c b/arch/powerpc/kvm/e500mc.c
index a309138927ff..d58df71ace58 100644
--- a/arch/powerpc/kvm/e500mc.c
+++ b/arch/powerpc/kvm/e500mc.c
@@ -168,7 +168,7 @@ static void kvmppc_core_vcpu_put_e500mc(struct kvm_vcpu *vcpu)
 	kvmppc_booke_vcpu_put(vcpu);
 }
 
-int kvmppc_e500mc_check_processor_compat(void)
+static int kvmppc_e500mc_check_processor_compat(void)
 {
 	int r;
 

base-commit: 63355b9884b3d1677de6bd1517cd2b8a9bf53978
-- 
2.40.0.rc1.284.g88254d51c5-goog

