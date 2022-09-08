Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FF85B1EEC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 15:28:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNg1z4MZ3z3bpn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 23:28:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LIxLxmnZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LIxLxmnZ;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNfym3GJ8z3bwr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 23:26:08 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id t65so5813092pgt.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XG+9udUlOy7seLjhzDlhW7K+fh9Lq8hdqIdeUcTOgS4=;
        b=LIxLxmnZUyHitj4ZjiMk/Dsm2nU7orfV6csXhu6W1zT77YxpExgiRcQIGMy/GC7SaP
         BpfmMHtPSRWYbO8XLdyg8VyR/lBmCl0KIpcQy+yOM+k3l1EAM/FbSIpkjIw7vhDKS98r
         8PJ5D+auFOVHd8FJOcVBoYG+nZiOshi3THM4S8rLM++pb9UkBfuUPkaiHDqCU0dHjivC
         LUQFPprWhjYAJ/JH2n4jx2lpP3IjyA3kNHL1exuB7460XE1uIFf8GPjTTBs46nHlG+Yy
         FwSus0PeMfVyUmt7ZBAY6ztJUuYkWt6vCENUEl8L7ksISKUSJ72NKUIeiAb5gt4Tc6V4
         j+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XG+9udUlOy7seLjhzDlhW7K+fh9Lq8hdqIdeUcTOgS4=;
        b=kALdpw4PheiXAFgpVX4pUlqLDmmsrdD1kzWQBdd8Hec5+R9U6suJK0ioI1rmmy1d4D
         pMuHuiqH1BFRJQOW8hY+aiacbe/hq+gFfkRbR6qRNZQUgW0EFi072Geo9rneIraFHKst
         UmoqOW47jQ6N6TLB6HVHk3iJo38jZPMJ0HZ5cXBItkW9BwTKnQ5iCwnZQIMJNTukAhxL
         uDJ0dWRu12gg88yr7RtxhhkOE8WFXG0cBvn6xTLj+AHXgLMbYZVnGC2IwUGqd338uCEG
         j4pgQW4SCrRdm3aBEKizbgCiLLPK12BHiodhSHD7gUwCbK4+9oePSgn7Qb1RV5dOhamt
         3EXw==
X-Gm-Message-State: ACgBeo3qPMN2GoCAOw2nFuJf1optHHxOF4ETr7LEJozg/uT3SlIreQBc
	zVLHAHcxqfFqMRGAbglm8QI0OvCDL6wXDg==
X-Google-Smtp-Source: AA6agR7JaOB00QPpUU6VtTSiI4DsEFrhk9ZXCwHE9kfVddz+5D6ZG3oW71vCJ/u9nIx3ERHIGXlvTA==
X-Received: by 2002:a63:df14:0:b0:42b:484c:4273 with SMTP id u20-20020a63df14000000b0042b484c4273mr7730948pgg.186.1662643565963;
        Thu, 08 Sep 2022 06:26:05 -0700 (PDT)
Received: from bobo.ibm.com ([193.114.109.49])
        by smtp.gmail.com with ESMTPSA id z17-20020a170903019100b001768517f99esm12505504plg.244.2022.09.08.06.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:26:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] KVM: PPC: Book3S HV: Implement scheduling wait interval counters in the VPA
Date: Thu,  8 Sep 2022 23:25:45 +1000
Message-Id: <20220908132545.4085849-5-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR specifies accumulated virtual processor wait intervals that relate
to partition scheduling interval times. Implement these counters in the
same way as they are repoted by dtl.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This requires patch "powerpc/pseries: Add wait interval counter
definitions to struct lppaca"

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-September/247798.html

When running a host with this patch and a guest with the corresponding
pseries implementation, the guest shows 10% stolen time with vmstat in a
160 vCPU guest running busy work on all CPUs on a 144 CPU host.
144/160 = 90%.

 arch/powerpc/kvm/book3s_hv.c | 62 ++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c3a4785b10d5..2aca86290f76 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -733,16 +733,15 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
 }
 
 static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
+					struct lppaca *vpa,
 					unsigned int pcpu, u64 now,
 					unsigned long stolen)
 {
 	struct dtl_entry *dt;
-	struct lppaca *vpa;
 
 	dt = vcpu->arch.dtl_ptr;
-	vpa = vcpu->arch.vpa.pinned_addr;
 
-	if (!dt || !vpa)
+	if (!dt)
 		return;
 
 	dt->dispatch_reason = 7;
@@ -763,29 +762,23 @@ static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 	/* order writing *dt vs. writing vpa->dtl_idx */
 	smp_wmb();
 	vpa->dtl_idx = cpu_to_be64(++vcpu->arch.dtl_index);
-	vcpu->arch.dtl.dirty = true;
-}
-
-static void kvmppc_create_dtl_entry_p9(struct kvm_vcpu *vcpu,
-				       struct kvmppc_vcore *vc,
-				       u64 now)
-{
-	unsigned long stolen;
 
-	stolen = vc->stolen_tb - vcpu->arch.stolen_logged;
-	vcpu->arch.stolen_logged = vc->stolen_tb;
-
-	__kvmppc_create_dtl_entry(vcpu, vc->pcpu, now, stolen);
+	/* vcpu->arch.dtl.dirty is set by the caller */
 }
 
-static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
-				    struct kvmppc_vcore *vc)
+static void kvmppc_update_vpa_dispatch(struct kvm_vcpu *vcpu,
+				       struct kvmppc_vcore *vc)
 {
+	struct lppaca *vpa;
 	unsigned long stolen;
 	unsigned long core_stolen;
 	u64 now;
 	unsigned long flags;
 
+	vpa = vcpu->arch.vpa.pinned_addr;
+	if (!vpa)
+		return;
+
 	now = mftb();
 
 	core_stolen = vcore_stolen_time(vc, now);
@@ -796,7 +789,34 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 	vcpu->arch.busy_stolen = 0;
 	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
 
-	__kvmppc_create_dtl_entry(vcpu, vc->pcpu, now + vc->tb_offset, stolen);
+	vpa->enqueue_dispatch_tb = cpu_to_be64(be64_to_cpu(vpa->enqueue_dispatch_tb) + stolen);
+
+	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now + vc->tb_offset, stolen);
+
+	vcpu->arch.vpa.dirty = true;
+}
+
+static void kvmppc_update_vpa_dispatch_p9(struct kvm_vcpu *vcpu,
+				       struct kvmppc_vcore *vc,
+				       u64 now)
+{
+	struct lppaca *vpa;
+	unsigned long stolen;
+	unsigned long stolen_delta;
+
+	vpa = vcpu->arch.vpa.pinned_addr;
+	if (!vpa)
+		return;
+
+	stolen = vc->stolen_tb;
+	stolen_delta = stolen - vcpu->arch.stolen_logged;
+	vcpu->arch.stolen_logged = stolen;
+
+	vpa->enqueue_dispatch_tb = cpu_to_be64(stolen);
+
+	__kvmppc_create_dtl_entry(vcpu, vpa, vc->pcpu, now, stolen_delta);
+
+	vcpu->arch.vpa.dirty = true;
 }
 
 /* See if there is a doorbell interrupt pending for a vcpu */
@@ -3838,7 +3858,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			 * kvmppc_core_prepare_to_enter.
 			 */
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc);
+			kvmppc_update_vpa_dispatch(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4435,7 +4455,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc);
+			kvmppc_update_vpa_dispatch(vcpu, vc);
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4623,7 +4643,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	kvmppc_create_dtl_entry_p9(vcpu, vc, tb + vc->tb_offset);
+	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + vc->tb_offset);
 
 	trace_kvm_guest_enter(vcpu);
 
-- 
2.37.2

