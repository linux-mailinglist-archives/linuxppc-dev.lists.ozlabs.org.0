Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE77837F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 19:36:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4631yd53GgzDr4D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 03:36:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.56.233; helo=8.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 529 seconds by postgrey-1.36 at bilbo;
 Wed, 07 Aug 2019 03:34:59 AEST
Received: from 8.mo69.mail-out.ovh.net (8.mo69.mail-out.ovh.net
 [46.105.56.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4631wz6GLHzDqlP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 03:34:56 +1000 (AEST)
Received: from player730.ha.ovh.net (unknown [10.108.35.124])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id F3D2D653EF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 19:26:00 +0200 (CEST)
Received: from kaod.org (bad36-1-78-202-132-1.fbx.proxad.net [78.202.132.1])
 (Authenticated sender: clg@kaod.org)
 by player730.ha.ovh.net (Postfix) with ESMTPSA id 4A00688A6119;
 Tue,  6 Aug 2019 17:25:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Paul Mackerras <paulus@samba.org>
Subject: [PATCH] KVM: PPC: Book3S HV: XIVE: Free escalation interrupts before
 disabling the VP
Date: Tue,  6 Aug 2019 19:25:38 +0200
Message-Id: <20190806172538.5087-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13269856306298588020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a vCPU is brought done, the XIVE VP is first disabled and then
the event notification queues are freed. When freeing the queues, we
check for possible escalation interrupts and free them also.

But when a XIVE VP is disabled, the underlying XIVE ENDs also are
disabled in OPAL. When an END is disabled, its ESB pages (ESn and ESe)
are disabled and loads return all 1s. Which means that any access on
the ESB page of the escalation interrupt will return invalid values.

When an interrupt is freed, the shutdown handler computes a 'saved_p'
field from the value returned by a load in xive_do_source_set_mask().
This value is incorrect for escalation interrupts for the reason
described above.

This has no impact on Linux/KVM today because we don't make use of it
but we will introduce in future changes a xive_get_irqchip_state()
handler. This handler will use the 'saved_p' field to return the state
of an interrupt and 'saved_p' being incorrect, softlockup will occur.

Fix the vCPU cleanup sequence by first freeing the escalation
interrupts if any, then disable the XIVE VP and last free the queues.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_xive.c        | 18 ++++++++++--------
 arch/powerpc/kvm/book3s_xive_native.c | 12 +++++++-----
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index e3ba67095895..09f838aa3138 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1134,20 +1134,22 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
 	/* Mask the VP IPI */
 	xive_vm_esb_load(&xc->vp_ipi_data, XIVE_ESB_SET_PQ_01);
 
-	/* Disable the VP */
-	xive_native_disable_vp(xc->vp_id);
-
-	/* Free the queues & associated interrupts */
+	/* Free escalations */
 	for (i = 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
-		struct xive_q *q = &xc->queues[i];
-
-		/* Free the escalation irq */
 		if (xc->esc_virq[i]) {
 			free_irq(xc->esc_virq[i], vcpu);
 			irq_dispose_mapping(xc->esc_virq[i]);
 			kfree(xc->esc_virq_names[i]);
 		}
-		/* Free the queue */
+	}
+
+	/* Disable the VP */
+	xive_native_disable_vp(xc->vp_id);
+
+	/* Free the queues */
+	for (i = 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
+		struct xive_q *q = &xc->queues[i];
+
 		xive_native_disable_queue(xc->vp_id, q, i);
 		if (q->qpage) {
 			free_pages((unsigned long)q->qpage,
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index a998823f68a3..368427fcad20 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -67,10 +67,7 @@ void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)
 	xc->valid = false;
 	kvmppc_xive_disable_vcpu_interrupts(vcpu);
 
-	/* Disable the VP */
-	xive_native_disable_vp(xc->vp_id);
-
-	/* Free the queues & associated interrupts */
+	/* Free escalations */
 	for (i = 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
 		/* Free the escalation irq */
 		if (xc->esc_virq[i]) {
@@ -79,8 +76,13 @@ void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)
 			kfree(xc->esc_virq_names[i]);
 			xc->esc_virq[i] = 0;
 		}
+	}
 
-		/* Free the queue */
+	/* Disable the VP */
+	xive_native_disable_vp(xc->vp_id);
+
+	/* Free the queues */
+	for (i = 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
 		kvmppc_xive_native_cleanup_queue(vcpu, i);
 	}
 
-- 
2.21.0

