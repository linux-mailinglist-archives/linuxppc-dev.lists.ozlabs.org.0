Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33552BB88
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:41:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Dfm5h5pz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:41:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gqT6ZkZV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gqT6ZkZV; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Dcr3wdhz3bnZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:39:56 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id q4so1779124plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0vgS96GLBLXkSrXITwi/dfU9tWZr9GtH8pnmUDTwik=;
 b=gqT6ZkZVFt6RR69kX2q46eXETnURysexzo4utf9bGgRJ4j+ldci06+uuS8L4Sjy4ir
 +esOs/E3dNoJxma6BOOKP5qI6J48Wg7jUyObxwtjwVPCkGyVytft4zk1cBNAxZy6wWH8
 3U0qwmYg3ySDQKZDEDY2HuXSpmgyfRDEEWe+f14I5yjSINnQPuzL/rpkUCyKWWwIdJAN
 JZAhjcuKUXq/Wyrk3gpmWUWKqzQjWq6AeN/b7U98U+52UlXAheQtgcbvdNk3LsnmtHB1
 G9n4q5QJiLg4i8quktM0MjAyf+YgIegatxdV7O2kpLuQKVjKclDCHf72BOA6Jh89nLmJ
 MZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0vgS96GLBLXkSrXITwi/dfU9tWZr9GtH8pnmUDTwik=;
 b=b1jyG9lZTQHViECTTbotjaUoxPRRPRq6aev4m3gIIPwPG8lTj4CQnx+yZQ/5p02FtB
 mzNQSzSjJ92kB7oPDpXeCzySwqPgqc3D9WvNDa8iLQZEpfzkXHzcj1cWY9D35Ct1Sm4G
 mUQgmWYeIBlMITJTbUGgfd5DRjltW3HtepkfEneYd1BoZYepfG8QaYKOPindvsTfD4eD
 0VYw043Q9tecf6nEvKTc5erZ0JTmknwQgBGu2Ya72Em9ZD4aBMrkKzIII8tSopIRthqE
 IDdvjV4jBjq790sLvLK7iPlUEyCor/Vt86gVBngH6YfPGc17Nv5G2iDug30TT1bFpOV6
 mp0A==
X-Gm-Message-State: AOAM5303R6NjqR0y0CWyYLWMDQdD3cONJpP9FOjy68ug8zp/Kwo2BgHb
 f1hy0C8lriEeoJ4wm2y/f9V1xgEHuFBj8w==
X-Google-Smtp-Source: ABdhPJyi+5uJaVhgHw8EHz3kI16LUEi98pKX/1zA0TRwbHqvHiBIaaU+l0KZdv23/ujEB5NeKEU/UQ==
X-Received: by 2002:a17:90b:e89:b0:1dc:18dc:26a0 with SMTP id
 fv9-20020a17090b0e8900b001dc18dc26a0mr43205pjb.188.1652881194146; 
 Wed, 18 May 2022 06:39:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([193.114.105.210])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a170902e1d400b0015e8d4eb209sm1677511pla.83.2022.05.18.06.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:39:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] KVM: PPC: Book3S HV: Implement scheduling wait interval
 counters in the VPA
Date: Wed, 18 May 2022 23:39:33 +1000
Message-Id: <20220518133935.3878954-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518133935.3878954-1-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
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

PAPR specifies accumulated virtual processor wait intervals that relate
to partition scheduling interval times. Implement these counters in the
same way as they are repoted by dtl.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 62 ++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0a0835edb64a..9f8795d2b0c3 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -732,16 +732,15 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
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
@@ -762,29 +761,23 @@ static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
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
@@ -795,7 +788,34 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
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
@@ -3820,7 +3840,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			 * kvmppc_core_prepare_to_enter.
 			 */
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc);
+			kvmppc_update_vpa_dispatch(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4392,7 +4412,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc);
+			kvmppc_update_vpa_dispatch(vcpu, vc);
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4575,7 +4595,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	kvmppc_create_dtl_entry_p9(vcpu, vc, tb + vc->tb_offset);
+	kvmppc_update_vpa_dispatch_p9(vcpu, vc, tb + vc->tb_offset);
 
 	trace_kvm_guest_enter(vcpu);
 
-- 
2.35.1

