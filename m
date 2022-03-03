Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 472844CB679
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KV62g0Nz3cgQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:36:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TTBqr4FK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TTBqr4FK; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQm3FDhz3bvc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:36 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 27so3579828pgk.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QMReFBES11rskOh08REHkyH25AsYxKJ7LDPwGeCbqk=;
 b=TTBqr4FK/3IWv3MFqdG1QXV/mfu1M/MM28ds7Qnskyw4pexRnoFRDysuqU00Cvw6pp
 iojqjQlwKhJhdVUUmXgTaiEaZbdfVFMF24BscmRvWhnoSFKVFwusP/tFY76fRFyeInR9
 mxijx/f3l9BftqVJrpuel8wxUoCPWEuAeaCsL4QniaruT7eMdnkakW80+5zDFhCV0HEX
 xbimJbxqoe/SI9wqtCn5SNNEs3cVxAJ9Vp2g2YNV2tkCruPDavGqQ8xnaU/Q28ovdZY7
 wv1A3X3pFn4M0uXrFP+Qkmnjo0YmHTfb7J9qt3Bu9gBCnhV+TKCLGF0QY5L/AQebR8GK
 RU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+QMReFBES11rskOh08REHkyH25AsYxKJ7LDPwGeCbqk=;
 b=gxBq6DagWoct2cvodgewP7X41+pkERpQHb7mb/LT/IWBg5bnACZhssA5/1z+zSo/o9
 s0TboTf58xyALk6kEZwgxM+rI7OWcJy9+0609kuva8I1zworD27VZzg1E5MFMiekuNR/
 eIl+pGJq60m7NzrE0AQtCyeBZIGS6lBm73qVBszbrtDqwNApkD0/zQRVhshVi5lDcTuH
 qkCAP7mx5nq2AkfuqEfYhayrkOEGATyU+Yvh0yQNFkErl+0ZcFVZ6Zs4TvpTsOCjQAPj
 +tdm8Qk3gRWKQUve5ZmB4s+sk5RjxLDufBZa4h8qFEWeVfdcc7GO74rZCSIxVOdRr3yP
 z/pw==
X-Gm-Message-State: AOAM531DZiHTpqQjJIApMapCAPrftP8gYjnpp6O6lQyWW+rdCXK7u2x4
 QmA47x29q4IWDhL+JhpC8EDM1s0td6VVLQ==
X-Google-Smtp-Source: ABdhPJwd3cpha64JfdKm1Anxr7l0UT9APcj2YVCBrb2vvcsZtmVrc7E9CYKPqVLyaNzQpGNtzTqjow==
X-Received: by 2002:a05:6a00:22d3:b0:4f3:d439:7189 with SMTP id
 f19-20020a056a0022d300b004f3d4397189mr31062412pfj.79.1646285615066; 
 Wed, 02 Mar 2022 21:33:35 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:34 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] KVM: PPC: Book3S HV Nested: L2 must not run with L1 xive
 context
Date: Thu,  3 Mar 2022 15:33:14 +1000
Message-Id: <20220303053315.1056880-6-npiggin@gmail.com>
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

The PowerNV L0 currently pushes the OS xive context when running a vCPU,
regardless of whether it is running a nested guest. The problem is that
xive OS ring interrupts will be delivered while the L2 is running.

At the moment, by default, the L2 guest runs with LPCR[LPES]=0, which
actually makes external interrupts go to the L0. That causes the L2 to
exit and the interrupt taken or injected into the L1, so in some
respects this behaves like an escalation. It's not clear if this was
deliberate or not, there's no comment about it and the L1 is actually
allowed to clear LPES in the L2, so it's confusing at best.

When the L2 is running, the L1 is essentially in a ceded state with
respect to external interrupts (it can't respond to them directly and
won't get scheduled again absent some additional event). So the natural
way to solve this is when the L0 handles a H_ENTER_NESTED hypercall to
run the L2, have it arm the escalation interrupt and don't push the L1
context while running the L2.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c   | 26 ++++++++++++++++++++------
 arch/powerpc/kvm/book3s_xive.c |  2 +-
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0289d076c0a8..77315c2c3f43 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4063,14 +4063,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 
 	} else if (nested) {
-		kvmppc_xive_push_vcpu(vcpu);
-
 		__this_cpu_write(cpu_in_guest, kvm);
 		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
 		__this_cpu_write(cpu_in_guest, NULL);
 
-		kvmppc_xive_pull_vcpu(vcpu);
-
 	} else {
 		kvmppc_xive_push_vcpu(vcpu);
 
@@ -4082,8 +4078,13 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
-			/* H_CEDE has to be handled now */
+			/*
+			 * XIVE rearm and XICS hcalls must be handled
+			 * before xive context is pulled (is this
+			 * true?)
+			 */
 			if (req == H_CEDE) {
+				/* H_CEDE has to be handled now */
 				kvmppc_cede(vcpu);
 				if (!kvmppc_xive_rearm_escalation(vcpu)) {
 					/*
@@ -4095,7 +4096,20 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 				kvmppc_set_gpr(vcpu, 3, 0);
 				trap = 0;
 
-			/* XICS hcalls must be handled before xive is pulled */
+			} else if (req == H_ENTER_NESTED) {
+				/*
+				 * L2 should not run with the L1
+				 * context so rearm and pull it.
+				 */
+				if (!kvmppc_xive_rearm_escalation(vcpu)) {
+					/*
+					 * Pending escalation so abort
+					 * H_ENTER_NESTED.
+					 */
+					kvmppc_set_gpr(vcpu, 3, 0);
+					trap = 0;
+				}
+
 			} else if (hcall_is_xics(req)) {
 				int ret;
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 7b513e14cada..e44e251509fe 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -241,7 +241,7 @@ static irqreturn_t xive_esc_irq(int irq, void *data)
 
 	vcpu->arch.irq_pending = 1;
 	smp_mb();
-	if (vcpu->arch.ceded)
+	if (vcpu->arch.ceded || vcpu->arch.nested)
 		kvmppc_fast_vcpu_kick(vcpu);
 
 	/* Since we have the no-EOI flag, the interrupt is effectively
-- 
2.23.0

