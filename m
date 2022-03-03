Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D04CB67D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:37:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KWW3jTnz3dwp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:37:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LgP9pNI3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LgP9pNI3; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQs6VBNz3bqp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:41 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id i1so3574013plr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3hEwUX2M4z9sTTzqMuyxap51XtRcQqvx+Ji9wYa5XEw=;
 b=LgP9pNI3LevRjPMZrnRJX7QYZ5Wq3eKyJTvcK1nrqghRKj2Kxf6eQcO+PkP+BEI+be
 nr+nJjjHBOkir0e1zbDuG9Izhhm/W/HAJtIWvOY6RG/exYj5G1AZoRUwhc0JST/O2oS7
 5jf3c/SvVSlzCUzrElKgqFddnd/kqNTx05MkNdGSaSEZ6kT+EMe1jL9ASnW585AQghH4
 ob1tjYuY/vkQmmCTDVD1oA2Jg/fr8a7/Ndti/RatLVNngoGNcBUY2IeARNPXnhB060J8
 pdtUoleUJstwAqIlcm7XvoDqWl7AUoXlqSg02svCbqHand2cYSIJ9rylv0o9eOK/lt7U
 FXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hEwUX2M4z9sTTzqMuyxap51XtRcQqvx+Ji9wYa5XEw=;
 b=x3qBc5QtUoHrxSz93ea2ycfYN6bEazCrn5PsRhMiraQEZnz1SRA38WfOjuf+7ruwWe
 3ixkvpUQ2/14K3b3iLXxBAdhwuTYjyvcAx/m0GmkcK22+Mn+1g4/Wled/ZGoaxoeQsGW
 9bE95MS1fKdf0AWWpwEfX2ZQh74Sgt2ZHEtKjkWviMFCR/TvIpVjlVOspRr3Hml6OGqh
 woaSlF5OKHhyUu6rDJUds0nuEy8Kzv6EKGfw+2MY9a2MIvAa7oRIaG/LZERotAULNOGl
 XeU2D0CfXewGubNyltLObq8eggwjRIesERaL3wvHU1TqktaiYRfy5GXq/15aQcPMziK6
 MlXQ==
X-Gm-Message-State: AOAM5326bGk0+AqW8/du1z/2h7IvUdBCo8qqExlzpf6XIgu1V8MVybNj
 r5eyO/2OiJfefQYqHiC/n2mZ0boyIogh8A==
X-Google-Smtp-Source: ABdhPJx9FKLC3Eg3uDGbCW1KaBbRZxsxMiRhMXslt7Xu+QU6fcG3okJQDZgdiKlv2++UKq3Hg6gGLw==
X-Received: by 2002:a17:903:244e:b0:150:9b8c:3a6f with SMTP id
 l14-20020a170903244e00b001509b8c3a6fmr30906053pls.120.1646285609607; 
 Wed, 02 Mar 2022 21:33:29 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] KVM: PPC: Book3S HV P9: Move cede logic out of XIVE
 escalation rearming
Date: Thu,  3 Mar 2022 15:33:12 +1000
Message-Id: <20220303053315.1056880-4-npiggin@gmail.com>
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

Move the cede abort logic out of xive escalation rearming and into
the caller to prepare for handling a similar case with nested guest
entry.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h |  4 ++--
 arch/powerpc/kvm/book3s_hv.c       | 10 ++++++++--
 arch/powerpc/kvm/book3s_xive.c     |  9 ++++++---
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index a14dbcd1b8ce..94fa5f246657 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -671,7 +671,7 @@ extern int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 irq,
 			       int level, bool line_status);
 extern void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu);
 extern void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu);
-extern void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
+extern bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu);
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 {
@@ -709,7 +709,7 @@ static inline int kvmppc_xive_set_irq(struct kvm *kvm, int irq_source_id, u32 ir
 				      int level, bool line_status) { return -ENODEV; }
 static inline void kvmppc_xive_push_vcpu(struct kvm_vcpu *vcpu) { }
 static inline void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu) { }
-static inline void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { }
+static inline bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu) { return true; }
 
 static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 	{ return 0; }
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5df359053147..a0b674d3a2da 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4073,10 +4073,16 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
-			/* H_CEDE has to be handled now, not later */
+			/* H_CEDE has to be handled now */
 			if (req == H_CEDE) {
 				kvmppc_cede(vcpu);
-				kvmppc_xive_rearm_escalation(vcpu); /* may un-cede */
+				if (!kvmppc_xive_rearm_escalation(vcpu)) {
+					/*
+					 * Pending escalation so abort
+					 * the cede.
+					 */
+					vcpu->arch.ceded = 0;
+				}
 				kvmppc_set_gpr(vcpu, 3, 0);
 				trap = 0;
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index e216c068075d..7b513e14cada 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -179,12 +179,13 @@ void kvmppc_xive_pull_vcpu(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_pull_vcpu);
 
-void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
+bool kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 {
 	void __iomem *esc_vaddr = (void __iomem *)vcpu->arch.xive_esc_vaddr;
+	bool ret = true;
 
 	if (!esc_vaddr)
-		return;
+		return ret;
 
 	/* we are using XIVE with single escalation */
 
@@ -197,7 +198,7 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 		 * we also don't want to set xive_esc_on to 1 here in
 		 * case we race with xive_esc_irq().
 		 */
-		vcpu->arch.ceded = 0;
+		ret = false;
 		/*
 		 * The escalation interrupts are special as we don't EOI them.
 		 * There is no need to use the load-after-store ordering offset
@@ -210,6 +211,8 @@ void kvmppc_xive_rearm_escalation(struct kvm_vcpu *vcpu)
 		__raw_readq(esc_vaddr + XIVE_ESB_SET_PQ_00);
 	}
 	mb();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(kvmppc_xive_rearm_escalation);
 
-- 
2.23.0

