Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 581553C9F4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 15:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQZfW2Spwz3dPn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 23:17:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PAgd5N/9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PAgd5N/9; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQZcT1TgSz3bNn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 23:15:37 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id o201so5224129pfd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 06:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lY2yV6h+HiwueBZqXg6zldEZGTIaMkB1Z2ZLqlofoo0=;
 b=PAgd5N/9dQI1X81Og9aoffrN5ZKpyOEfk1nDRE530JLtivM8+1QGZs7rsyOwPVz4CC
 Vuo2BkjrUwQ7uJ3niifEulmmJSa45wJ4Uy/qSWJ1o8WwpU0z1wxKysWzsRMwrY8INIF/
 tG8EbtyrD2M9V2jmP/UJVP92nXqlbhcxZW+6pKQGyTb37Mend2JYxE8/jTKx6XvOTQE1
 cOjXrJdF9qTHYjyEnsFRg3blx6yjdIbNW/1JewLV90vkSO6JM1M5etSL8uoigrjsdaSX
 bb6fXkDkx5/wuIxDxmX+jGGhU1l/g70OPEWYY+69WC4ffhKJb+VwtJyBZMfh/vemGska
 csFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY2yV6h+HiwueBZqXg6zldEZGTIaMkB1Z2ZLqlofoo0=;
 b=oQPx75DWtu7mOUD648jL/VSnoyPbmW3mSvEgJnuzqe+vWQQjIfI7xOlA3bdWlbhqzz
 DvaV771I2l5zdPpRcGT7FyWNidx0dgAJQBqX5O+lGmVHouwxiz2/7wNS7eJYFlwNvHYi
 t0if+epFB640mYk7Yg5Qc1cMnuiPEaq3aMO94Opxx1wVA4q8bm2+f751ZNTm3bthUpkn
 zE/J7VEdHrft6tEy+/sn777DbCqHlYdcZYwsy3XV/2pi5UNU9VxanuTzM8Ei0YbFGZDZ
 ETsnGVkljNtkYWqBs4QVjum1iLYE8SPjPVA4CrpQzhDhHFTTJdW9tSVzFR1j47BwpTPo
 gUCg==
X-Gm-Message-State: AOAM531FYzNHCnfpCupfzBgRGZtwPTwOlCQMLdiw/xcmz0/g81GXWv8B
 zKgkex9zrNPOszrORt/X7YU=
X-Google-Smtp-Source: ABdhPJweGLpwOhqDXva0BLe6sBSssb8SzCMoxm5+smIxE2O5VcQ4vM6lo95NW2vfXvIaNjlTpS25/A==
X-Received: by 2002:a63:ee45:: with SMTP id n5mr4510309pgk.405.1626354934670; 
 Thu, 15 Jul 2021 06:15:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-33-83-114.tpgi.com.au. [27.33.83.114])
 by smtp.gmail.com with ESMTPSA id
 k6sm4864216pju.8.2021.07.15.06.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 06:15:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 4/6] KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
Date: Thu, 15 Jul 2021 23:15:16 +1000
Message-Id: <20210715131518.146917-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210715131518.146917-1-npiggin@gmail.com>
References: <20210715131518.146917-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This goes further to removing vcores from the P9 path. Also avoid the
memset in favour of explicitly initialising all fields.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 61 +++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2b02cfe3e456..93ecbc040529 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -703,41 +703,30 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
 	return p;
 }
 
-static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
-				    struct kvmppc_vcore *vc, u64 tb)
+static void __kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
+					unsigned int pcpu, u64 now,
+					unsigned long stolen)
 {
 	struct dtl_entry *dt;
 	struct lppaca *vpa;
-	unsigned long stolen;
-	unsigned long core_stolen;
-	u64 now;
-	unsigned long flags;
 
 	dt = vcpu->arch.dtl_ptr;
 	vpa = vcpu->arch.vpa.pinned_addr;
-	now = tb;
-
-	if (cpu_has_feature(CPU_FTR_ARCH_300)) {
-		stolen = 0;
-	} else {
-		core_stolen = vcore_stolen_time(vc, now);
-		stolen = core_stolen - vcpu->arch.stolen_logged;
-		vcpu->arch.stolen_logged = core_stolen;
-		spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
-		stolen += vcpu->arch.busy_stolen;
-		vcpu->arch.busy_stolen = 0;
-		spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
-	}
 
 	if (!dt || !vpa)
 		return;
-	memset(dt, 0, sizeof(struct dtl_entry));
+
 	dt->dispatch_reason = 7;
-	dt->processor_id = cpu_to_be16(vc->pcpu + vcpu->arch.ptid);
-	dt->timebase = cpu_to_be64(now + vc->tb_offset);
+	dt->preempt_reason = 0;
+	dt->processor_id = cpu_to_be16(pcpu + vcpu->arch.ptid);
 	dt->enqueue_to_dispatch_time = cpu_to_be32(stolen);
+	dt->ready_to_enqueue_time = 0;
+	dt->waiting_to_ready_time = 0;
+	dt->timebase = cpu_to_be64(now);
+	dt->fault_addr = 0;
 	dt->srr0 = cpu_to_be64(kvmppc_get_pc(vcpu));
 	dt->srr1 = cpu_to_be64(vcpu->arch.shregs.msr);
+
 	++dt;
 	if (dt == vcpu->arch.dtl.pinned_end)
 		dt = vcpu->arch.dtl.pinned_addr;
@@ -748,6 +737,27 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
 	vcpu->arch.dtl.dirty = true;
 }
 
+static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
+				    struct kvmppc_vcore *vc)
+{
+	unsigned long stolen;
+	unsigned long core_stolen;
+	u64 now;
+	unsigned long flags;
+
+	now = mftb();
+
+	core_stolen = vcore_stolen_time(vc, now);
+	stolen = core_stolen - vcpu->arch.stolen_logged;
+	vcpu->arch.stolen_logged = core_stolen;
+	spin_lock_irqsave(&vcpu->arch.tbacct_lock, flags);
+	stolen += vcpu->arch.busy_stolen;
+	vcpu->arch.busy_stolen = 0;
+	spin_unlock_irqrestore(&vcpu->arch.tbacct_lock, flags);
+
+	__kvmppc_create_dtl_entry(vcpu, vc->pcpu, now + vc->tb_offset, stolen);
+}
+
 /* See if there is a doorbell interrupt pending for a vcpu */
 static bool kvmppc_doorbell_pending(struct kvm_vcpu *vcpu)
 {
@@ -3722,7 +3732,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc, mftb());
+			kvmppc_create_dtl_entry(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4272,7 +4282,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc, mftb());
+			kvmppc_create_dtl_entry(vcpu, vc);
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4449,8 +4459,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	local_paca->kvm_hstate.ptid = 0;
 	local_paca->kvm_hstate.fake_suspend = 0;
 
-	vc->pcpu = pcpu; // for kvmppc_create_dtl_entry
-	kvmppc_create_dtl_entry(vcpu, vc, tb);
+	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
 
 	trace_kvm_guest_enter(vcpu);
 
-- 
2.23.0

