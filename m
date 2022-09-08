Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7085B1EE7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:28:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNg1960RDz3dpm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:28:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kk6Aykgg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Kk6Aykgg;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNfyk2L0Xz3br9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:26:05 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id r17so4312045pgr.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Og0o94+N0+6YORMvQ8vPWX9HpFF+KjQSP+rVXPGi/mc=;
        b=Kk6AykggaSeabC8+I+dLgi5ZwO2iiIe8pm0AmmUc71YaW27Euk4QAJKjj1bmnuQAqr
         3M3rSZNBPuCS+XdQ61MPlS4SsHFmF0iw10Cu7rC50ZkQFoGfiKJk3FtXkd7kVbmlzqM0
         gDzH5aucBvI7Xh/52GF2U2KOMijmrbecJJetcCqvUfT8NJnPye9DP9XA3I153RUw4eFb
         d4yb+knkPz9GkNALdkOuKFJbjusTiVgrb1zUW8gi3xvj4SLOzTKyBaxgubRkzKoh4mRi
         jDlr5kaALtLUQ4W78JGo1giX0PcqmP1vslsxYQH7qj4ZJMFa0WjbznXOFaSr1kWun0xL
         pR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Og0o94+N0+6YORMvQ8vPWX9HpFF+KjQSP+rVXPGi/mc=;
        b=TXWiQwu/m/z2DpTJGeIy9/eOanIEaj5NR9pa+aW2r1suHeZZ5b3pCFw3iZfRkdPiEI
         HpFQ5W9e9SplNs61FNCNmj/Km0yi2xMF9T9Rb607AfzFUDY8Jx3H1Pc/xcw0I+yYy5yQ
         msrz+bM/98/KoFxW4LWmkxcsejMVp650T9wR6HGfx09l4xGqdO+KwZ8kn9bWJ7u8wPv4
         PiPrJldDaOxiutQLRviDW8w2q5U7Rtefs8IfHOb0ZzFw8Dqe6SS50iUEPdNruGoDuQAg
         WOllHJ4MmTASTFsnWytHQ8mZ7A+twPF0cLMjHI41Xah7A/7W4NT4KjyCrMrD5C+wOgCF
         9Npg==
X-Gm-Message-State: ACgBeo1vq+/iQ/p6Xw3f8PrGfkzHPQrgN6YTHHnugy8EQTNfAp6e50ha
	0hgcCEb2opN9CMD2rAl9NrgRdjvCxuQ0Rw==
X-Google-Smtp-Source: AA6agR7azezNYIL+Cnxk2/QKVzFeFnruvpFay4EztsH1TryHO1w1vA5gljzsVVUn6RvMyYyzJQr0kw==
X-Received: by 2002:a63:1546:0:b0:42c:50dc:2115 with SMTP id 6-20020a631546000000b0042c50dc2115mr8003725pgv.613.1662643563322;
        Thu, 08 Sep 2022 06:26:03 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001768517f99esm12505504plg.244.2022.09.08.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:26:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] KVM: PPC: Book3S HV P9: Restore stolen time logging in dtl
Date: Thu,  8 Sep 2022 23:25:44 +1000
Message-Id: <20220908132545.4085849-4-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stolen time logging in dtl was removed from the P9 path, so guests had
no stolen time accounting. Add it back in a simpler way that still
avoids locks and per-core accounting code.

Fixes: ecb6a7207f92 ("KVM: PPC: Book3S HV P9: Remove most of the vcore logic")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 49 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 771b8b0e0329..c3a4785b10d5 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -249,6 +249,7 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
 
 /*
  * We use the vcpu_load/put functions to measure stolen time.
+ *
  * Stolen time is counted as time when either the vcpu is able to
  * run as part of a virtual core, but the task running the vcore
  * is preempted or sleeping, or when the vcpu needs something done
@@ -278,6 +279,12 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
  * lock.  The stolen times are measured in units of timebase ticks.
  * (Note that the != TB_NIL checks below are purely defensive;
  * they should never fail.)
+ *
+ * The POWER9 path is simpler, one vcpu per virtual core so the
+ * former case does not exist. If a vcpu is preempted when it is
+ * BUSY_IN_HOST and not ceded or otherwise blocked, then accumulate
+ * the stolen cycles in busy_stolen. RUNNING is not a preemptible
+ * state in the P9 path.
  */
 
 static void kvmppc_core_start_stolen(struct kvmppc_vcore *vc, u64 tb)
@@ -311,8 +318,14 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
 	unsigned long flags;
 	u64 now;
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
+	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+		if (vcpu->arch.busy_preempt != TB_NIL) {
+			WARN_ON_ONCE(vcpu->arch.state != KVMPPC_VCPU_BUSY_IN_HOST);
+			vc->stolen_tb += mftb() - vcpu->arch.busy_preempt;
+			vcpu->arch.busy_preempt = TB_NIL;
+		}
 		return;
+	}
 
 	now = mftb();
 
@@ -340,8 +353,21 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
 	unsigned long flags;
 	u64 now;
 
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
+	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+		/*
+		 * In the P9 path, RUNNABLE is not preemptible
+		 * (nor takes host interrupts)
+		 */
+		WARN_ON_ONCE(vcpu->arch.state == KVMPPC_VCPU_RUNNABLE);
+		/*
+		 * Account stolen time when preempted while the vcpu task is
+		 * running in the kernel (but not in qemu, which is INACTIVE).
+		 */
+		if (task_is_running(current) &&
+				vcpu->arch.state == KVMPPC_VCPU_BUSY_IN_HOST)
+			vcpu->arch.busy_preempt = mftb();
 		return;
+	}
 
 	now = mftb();
 
@@ -740,6 +766,18 @@ static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 	vcpu->arch.dtl.dirty = true;
 }
 
+static void kvmppc_create_dtl_entry_p9(struct kvm_vcpu *vcpu,
+				       struct kvmppc_vcore *vc,
+				       u64 now)
+{
+	unsigned long stolen;
+
+	stolen = vc->stolen_tb - vcpu->arch.stolen_logged;
+	vcpu->arch.stolen_logged = vc->stolen_tb;
+
+	__kvmppc_create_dtl_entry(vcpu, vc->pcpu, now, stolen);
+}
+
 static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 				    struct kvmppc_vcore *vc)
 {
@@ -4513,7 +4551,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc = vcpu->arch.vcore;
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
-	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
 
 	/* See if the MMU is ready to go */
@@ -4540,6 +4577,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	/* flags save not required, but irq_pmu has no disable/enable API */
 	powerpc_local_irq_pmu_save(flags);
 
+	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
+
 	if (signal_pending(current))
 		goto sigpend;
 	if (need_resched() || !kvm->arch.mmu_ready)
@@ -4584,7 +4623,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
+	kvmppc_create_dtl_entry_p9(vcpu, vc, tb + vc->tb_offset);
 
 	trace_kvm_guest_enter(vcpu);
 
@@ -4607,6 +4646,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
+	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	if (!vtime_accounting_enabled_this_cpu()) {
 		powerpc_local_irq_pmu_restore(flags);
@@ -4683,6 +4723,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
  out:
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
+	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 	powerpc_local_irq_pmu_restore(flags);
 	preempt_enable();
 	goto done;
-- 
2.37.2

