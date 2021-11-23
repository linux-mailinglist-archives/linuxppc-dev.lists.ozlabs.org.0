Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071DE45A02C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:26:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0g36C3gz3dgp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:26:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FhZ+7SEf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FhZ+7SEf; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzy01V8nz3cbs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:31 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so1675553pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e2fCJIQ2zxWac0DVNkRL3N/xrBDHEQ4rPNKRhJkNnPw=;
 b=FhZ+7SEfAzDMQzfjhKx0PbkwytZJrNnYNmVeNbWXqPqD66VM9vLmantYqNCiLXrlY4
 mt4gU3vD2+aFkslEoHNMvB8EhBgwId/idOYcmdDn3Q31+vYUE8M3YUilFeZKhnRSTadD
 TCatmqgaj7SnNIqHDLj1icGJumXMB9qwjOfhHndF1LbGaOaHVNM/G4kPWdp2Ytn3Pnq+
 FILdpiatW8hRk3x4baXoLj9mZHBk/czlWxFYwXcWlCy6eMa4sc9aUOarGBxYXYY2lYJi
 A29xs7otAqMVDbd+FoP8J52mzy511cgjXNVmU3YvuJ1zyyEeehCK2kKEJ3W6ukZ6ldON
 cfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e2fCJIQ2zxWac0DVNkRL3N/xrBDHEQ4rPNKRhJkNnPw=;
 b=0RtrAn5ShLyTLC8WTCaDo+iw016lCiQAyk70nXGS/ksw/9JCkkzUlOaUPQZZ7hiF7I
 jURi3Wl1kRFEE6if2UILRcKFKoA7a1I63SA8iUFcI43d9rY6EdX6wPFy0j7kf443U3X8
 lA1VXyJCDz8tHNJvo11fUL8LEHJAl/ShdYKUR5TC5bWQncwms1B5eKpZLgN2tYTUdHwL
 vL1w6ZAvuCHhCMK0zFYnswrINwR7okDvJvup/fM+2KE5kJ8Z4yjrSmSjN2qr830fRnA5
 8fJivk5HucuXlAujDjM80zXc4IFiGH1N8cSxT5POqjbIXhaBhG8Xpx7bmtuQUJAORm7y
 Gz0g==
X-Gm-Message-State: AOAM532qopbLwqCD08rklsqC5t+mOtck5yeZIuIaCM2djGYm2Q0vuwJ9
 Q5o8OFPVWud+BvEkxkdWZbhmGPee/IiQ+Q==
X-Google-Smtp-Source: ABdhPJw7MHDvLXxlGdnA3Q7X7S0oj8ax0VKzhu2QK217o+6Aw+mMNvtpBb4y7kaPxNEW5j7UqruM0w==
X-Received: by 2002:a17:902:7b82:b0:143:a6d6:34ab with SMTP id
 w2-20020a1709027b8200b00143a6d634abmr5192615pll.30.1637661270325; 
 Tue, 23 Nov 2021 01:54:30 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 51/53] KVM: PPC: Book3S HV P9: Tidy kvmppc_create_dtl_entry
Date: Tue, 23 Nov 2021 19:52:29 +1000
Message-Id: <20211123095231.1036501-52-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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

This goes further to removing vcores from the P9 path. Also avoid the
memset in favour of explicitly initialising all fields.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 60 +++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e56804b84804..2d598291d8cf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -698,41 +698,30 @@ static u64 vcore_stolen_time(struct kvmppc_vcore *vc, u64 now)
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
@@ -743,6 +732,27 @@ static void kvmppc_create_dtl_entry(struct kvm_vcpu *vcpu,
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
@@ -3756,7 +3766,7 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
 			kvmppc_start_thread(vcpu, pvc);
-			kvmppc_create_dtl_entry(vcpu, pvc, mftb());
+			kvmppc_create_dtl_entry(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
 			if (!vcpu->arch.ptid)
 				thr0_done = true;
@@ -4332,7 +4342,7 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
 		if ((vc->vcore_state == VCORE_PIGGYBACK ||
 		     vc->vcore_state == VCORE_RUNNING) &&
 			   !VCORE_IS_EXITING(vc)) {
-			kvmppc_create_dtl_entry(vcpu, vc, mftb());
+			kvmppc_create_dtl_entry(vcpu, vc);
 			kvmppc_start_thread(vcpu, vc);
 			trace_kvm_guest_enter(vcpu);
 		} else if (vc->vcore_state == VCORE_SLEEPING) {
@@ -4510,7 +4520,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	local_paca->kvm_hstate.ptid = 0;
 	local_paca->kvm_hstate.fake_suspend = 0;
 
-	kvmppc_create_dtl_entry(vcpu, vc, tb);
+	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
 
 	trace_kvm_guest_enter(vcpu);
 
-- 
2.23.0

