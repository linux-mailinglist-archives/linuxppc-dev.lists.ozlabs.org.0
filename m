Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F564CB671
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KRC3Yd1z3bvc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l3OKI5Ex;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l3OKI5Ex; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQb0zjJz3bfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:25 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so3740113pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omxvmnmUQDrS3/MVkFiDHiar06ZLh8rPdwBqRR9eRdo=;
 b=l3OKI5Exzs0NHx381iaX233AyqqB1IF+5/IZgrjisTfbZgsds9vYX2GAA/r/ciije0
 mCimCccF9eQ/aQmKJNyO4EVLfFTTmZr8GY94qjnShCp2dgIhuu/xl9adCREIO1OXznKx
 hxErqR3KRfqlWYHtD1y4GrzwdeK4blwFAT6yfwbTu6O35ul1bBsZuqGHMsMZQjxUTudR
 bA0p7yX3hG2pKLbLVBLlg3h1pDxncsNTtCWNrJhVukydcMlzUrvc8xT6V2eBmBauwAGl
 dglHOd0WKmGUh0s15fjHKmuHsLiGBf+fbyv/Vjmr+OokQtNuR9jr97ZZXlDfNaidKPan
 /Otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omxvmnmUQDrS3/MVkFiDHiar06ZLh8rPdwBqRR9eRdo=;
 b=Tin4Y0F35N8HL9vmDAaPly5MF/81HxZ0HdJLfOtzuGURGknDwPL0693X+sknOV0tDz
 gu/QvIJm8kZ+IWt/fxusiAXS9qH2vSfoOo7UPwjUJoQFEgoWEBVR5qL5uhMvJWPO2m6w
 TZNb/FEyF8vUyEzI0/W+cbjV6HIUEMqgFL9rj5AZaastnmkCYB7mdEMI8X699CQPAaAd
 uVZ1o0RF7JoZ/r0GKSpVCquaI/YCjyxT2WQdiz58BWO8pHI4GqJNMEnnPg04AnRhXz1S
 UzIdceDH+URsoiIwjTd1Ge777Z2woRqmQtqBSc85eGmD0EeJP4sPGvn/gZa6fN2zr+Mg
 vFBg==
X-Gm-Message-State: AOAM531uxhJxJBJfVTem15X2bkwLSeYslwx2m6FS4mLvReokCQSxIENC
 oBZeU0Zc46UM76IO4JsOq0mNAyA1ZbDVlQ==
X-Google-Smtp-Source: ABdhPJzqShbBNsdH8pC7ib9xf3UMBcgc7jEzBMaASw7RSLcVlRfplrsE+gHNCMJW4QAYgHpBJhD8KA==
X-Received: by 2002:a17:90b:4d88:b0:1bf:793:7134 with SMTP id
 oj8-20020a17090b4d8800b001bf07937134mr3545746pjb.112.1646285604086; 
 Wed, 02 Mar 2022 21:33:24 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:23 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] KVM: PPC: Book3S HV P9: Fix "lost kick" race
Date: Thu,  3 Mar 2022 15:33:10 +1000
Message-Id: <20220303053315.1056880-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220303053315.1056880-1-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When new work is created that requires attention from the hypervisor
(e.g., to inject an interrupt into the guest), fast_vcpu_kick is used to
pull the target vcpu out of the guest if it may have been running.

Therefore the work creation side looks like this:

  vcpu->arch.doorbell_request = 1;
  kvmppc_fast_vcpu_kick_hv(vcpu) {
    smp_mb();
    cpu = vcpu->cpu;
    if (cpu != -1)
        send_ipi(cpu);
  }

And the guest entry side *should* look like this:

  vcpu->cpu = smp_processor_id();
  smp_mb();
  if (vcpu->arch.doorbell_request) {
    // do something (abort entry or inject doorbell etc)
  }

But currently the store and load are flipped, so it is possible for the
entry to see no doorbell pending, and the doorbell creation misses the
store to set cpu, resulting lost work (or at least delayed until the
next guest exit).

Fix this by reordering the entry operations and adding a smp_mb
between them. The P8 path appears to have a similar race which is
commented but not addressed yet.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 41 +++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 84c89f08ae9a..f8c0f1f52a1e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -225,6 +225,13 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
 	int cpu;
 	struct rcuwait *waitp;
 
+	/*
+	 * rcuwait_wake_up contains smp_mb() which orders prior stores that
+	 * create pending work vs below loads of cpu fields. The other side
+	 * is the barrier in vcpu run that orders setting the cpu fields vs
+	 * testing for pending work.
+	 */
+
 	waitp = kvm_arch_vcpu_get_wait(vcpu);
 	if (rcuwait_wake_up(waitp))
 		++vcpu->stat.generic.halt_wakeup;
@@ -1089,7 +1096,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 			break;
 		}
 		tvcpu->arch.prodded = 1;
-		smp_mb();
+		smp_mb(); /* This orders prodded store vs ceded load */
 		if (tvcpu->arch.ceded)
 			kvmppc_fast_vcpu_kick_hv(tvcpu);
 		break;
@@ -3771,6 +3778,14 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc = core_info.vc[sub];
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
+			/*
+			 * XXX: is kvmppc_start_thread called too late here?
+			 * It updates vcpu->cpu and vcpu->arch.thread_cpu
+			 * which are used by kvmppc_fast_vcpu_kick_hv(), but
+			 * kick is called after new exceptions become available
+			 * and exceptions are checked earlier than here, by
+			 * kvmppc_core_prepare_to_enter.
+			 */
 			kvmppc_start_thread(vcpu, pvc);
 			kvmppc_create_dtl_entry(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
@@ -4492,6 +4507,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (need_resched() || !kvm->arch.mmu_ready)
 		goto out;
 
+	vcpu->cpu = pcpu;
+	vcpu->arch.thread_cpu = pcpu;
+	vc->pcpu = pcpu;
+	local_paca->kvm_hstate.kvm_vcpu = vcpu;
+	local_paca->kvm_hstate.ptid = 0;
+	local_paca->kvm_hstate.fake_suspend = 0;
+
+	/*
+	 * Orders set cpu/thread_cpu vs testing for pending interrupts and
+	 * doorbells below. The other side is when these fields are set vs
+	 * kvmppc_fast_vcpu_kick_hv reading the cpu/thread_cpu fields to
+	 * kick a vCPU to notice the pending interrupt.
+	 */
+	smp_mb();
+
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
 		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
@@ -4511,13 +4541,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	vcpu->cpu = pcpu;
-	vcpu->arch.thread_cpu = pcpu;
-	vc->pcpu = pcpu;
-	local_paca->kvm_hstate.kvm_vcpu = vcpu;
-	local_paca->kvm_hstate.ptid = 0;
-	local_paca->kvm_hstate.fake_suspend = 0;
-
 	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
 
 	trace_kvm_guest_enter(vcpu);
@@ -4619,6 +4642,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	run->exit_reason = KVM_EXIT_INTR;
 	vcpu->arch.ret = -EINTR;
  out:
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
 	powerpc_local_irq_pmu_restore(flags);
 	preempt_enable();
 	goto done;
-- 
2.23.0

