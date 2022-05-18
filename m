Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611D52BB86
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3DdP2r59z3cJ7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:40:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=khOZIxd4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=khOZIxd4; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Dcq2Db6z3c7Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:39:54 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id bh5so1795438plb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tXCSj/okgRLIGSezkODiYWgl1iqb4MJ+DipDnXxcnHY=;
 b=khOZIxd49K3WHr7tXUkxB2KlZ+ttJGxugU7OQsGA3MAE2tzXZBxL7BnoGUJFFiI1/N
 DnLgyCH0JBdVbWLDlwORWDkF0VlxwSsJnqbK3hI8Zc2hHjlJelWycsJPJHkIlePvu4Io
 g+leH3iqZsejpGqHOsQrw/BRNk0ddPkrOYixLZOEKDLyyGnqdnoD+C9C1twuz682mXFo
 784ZTsrOD4qUTZ7aD5xbDMWKbEkFQPq1hWQimsiirJ6JcnAL2HROTHvo4R7f7yUT8lvF
 y/ScL89Bhc4mcOlm5JUnHHga/Xo5NNVFL2rjykmT8dvnbml6SEToSzuGtClQq1kv8PeK
 +p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tXCSj/okgRLIGSezkODiYWgl1iqb4MJ+DipDnXxcnHY=;
 b=DYvM+fxMCo3+O44S4dBrtNIRj8EfI2726mogoG4ZmkAwl3dgie+tLy1c1T/8d3ExE3
 WW+Xgh+BVwVtvFMqHxNYFrvPPqfKbhx7gcgjOuELxWFPh3R3YfjBXiMQ0V8CDNvXvaBz
 o5X55agutV9/NFolksRIyXzUwiWKuJ0WxF2ET8AisuCTgFF+O9l+7HQaA75pNsBspOQj
 2PZ/MPIPyXmiXRKqHwI1+ABT9iyFFCP2tgXHs3pw16SWs1vboDiwmsEvjj/GaTKVU7Mj
 2w+2mcge0T3zpqj/UldYCYcCQ2116BIwnC85Fhog1dzgehco8bIpZwwZ0YLT08IDrTbl
 jvLQ==
X-Gm-Message-State: AOAM531H6TWPIQdeYOMBEYYyDYAHbNI95s+NPFjlKfptyiafyShkOe0/
 DSZGEyMgbY+w+KtLSto2JsVrXijhe5cucA==
X-Google-Smtp-Source: ABdhPJxB7NFjU1VK3kGow2TKlzYfhl+WpClj75JiKXHv/EH7fT7UzcR5t8EzZSOISfsAOL5/7jCYSQ==
X-Received: by 2002:a17:903:18f:b0:15e:93bd:730f with SMTP id
 z15-20020a170903018f00b0015e93bd730fmr26860256plg.172.1652881189059; 
 Wed, 18 May 2022 06:39:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([193.114.105.210])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170902e1d400b0015e8d4eb209sm1677511pla.83.2022.05.18.06.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:39:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] KVM: PPC: Book3S HV P9: Restore stolen time logging in dtl
Date: Wed, 18 May 2022 23:39:31 +1000
Message-Id: <20220518133935.3878954-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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

Stolen time logging in dtl was removed from the P9 path, so guests had
no stolen time accounting. Add it back in a simpler way that still
avoids locks and per-core accounting code.

Fixes: ecb6a7207f92 ("KVM: PPC: Book3S HV P9: Remove most of the vcore logic")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 49 +++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 6fa518f6501d..0a0835edb64a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -248,6 +248,7 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
 
 /*
  * We use the vcpu_load/put functions to measure stolen time.
+ *
  * Stolen time is counted as time when either the vcpu is able to
  * run as part of a virtual core, but the task running the vcore
  * is preempted or sleeping, or when the vcpu needs something done
@@ -277,6 +278,12 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
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
@@ -310,8 +317,14 @@ static void kvmppc_core_vcpu_load_hv(struct kvm_vcpu *vcpu, int cpu)
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
 
@@ -339,8 +352,21 @@ static void kvmppc_core_vcpu_put_hv(struct kvm_vcpu *vcpu)
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
 
@@ -739,6 +765,18 @@ static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
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
@@ -4470,7 +4508,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc = vcpu->arch.vcore;
 	vcpu->arch.ceded = 0;
 	vcpu->arch.run_task = current;
-	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
 	vcpu->arch.last_inst = KVM_INST_FETCH_FAILED;
 
 	/* See if the MMU is ready to go */
@@ -4497,6 +4534,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	/* flags save not required, but irq_pmu has no disable/enable API */
 	powerpc_local_irq_pmu_save(flags);
 
+	vcpu->arch.state = KVMPPC_VCPU_RUNNABLE;
+
 	if (signal_pending(current))
 		goto sigpend;
 	if (need_resched() || !kvm->arch.mmu_ready)
@@ -4536,7 +4575,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
+	kvmppc_create_dtl_entry_p9(vcpu, vc, tb + vc->tb_offset);
 
 	trace_kvm_guest_enter(vcpu);
 
@@ -4577,6 +4616,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
+	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	powerpc_local_irq_pmu_restore(flags);
 
@@ -4639,6 +4679,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
  out:
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
+	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 	powerpc_local_irq_pmu_restore(flags);
 	preempt_enable();
 	goto done;
-- 
2.35.1

