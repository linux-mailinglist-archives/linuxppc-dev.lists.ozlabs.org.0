Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32A4FF743
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 14:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdjMP1VZVz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 22:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inspur.com (client-ip=210.51.61.248; helo=ssh248.corpemail.net;
 envelope-from=wangdeming@inspur.com; receiver=<UNKNOWN>)
X-Greylist: delayed 128 seconds by postgrey-1.36 at boromir;
 Wed, 13 Apr 2022 20:57:49 AEST
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdfgx4vF7z2xF8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 20:57:48 +1000 (AEST)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id IGR00011;
 Wed, 13 Apr 2022 18:55:11 +0800
Received: from localhost.localdomain (10.200.104.82) by
 jtjnmail201609.home.langchao.com (10.100.2.9) with Microsoft SMTP Server id
 15.1.2308.21; Wed, 13 Apr 2022 18:55:12 +0800
From: Deming <wangdeming@inspur.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH] powerpc/xive: remove unused parameter
Date: Wed, 13 Apr 2022 06:55:07 -0400
Message-ID: <20220413105507.1729-1-wangdeming@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.200.104.82]
tUid: 202241318551125e62aa8a26dedd8ece4937ffc9f6d7d
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 13 Apr 2022 22:57:01 +1000
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
Cc: Deming Wang <wangdeming@inspur.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Deming Wang <wangdeming@inspur.com>

the parameter xc balongng to xive_cleanup_single_escalation is unused,so we
need to remove it.

Signed-off-by: Deming Wang <wangdeming@inspur.com>
---
 arch/powerpc/kvm/book3s_xive.c        | 5 ++---
 arch/powerpc/kvm/book3s_xive.h        | 3 +--
 arch/powerpc/kvm/book3s_xive_native.c | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index c0ce553..12693db 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -1180,8 +1180,7 @@ void kvmppc_xive_disable_vcpu_interrupts(struct kvm_vcpu *vcpu)
  * stale_p (because it has no easy way to address it).  Hence we have
  * to adjust stale_p before shutting down the interrupt.
  */
-void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
-				    struct kvmppc_xive_vcpu *xc, int irq)
+void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu, int irq)
 {
 	struct irq_data *d = irq_get_irq_data(irq);
 	struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
@@ -1222,7 +1221,7 @@ void kvmppc_xive_cleanup_vcpu(struct kvm_vcpu *vcpu)
 	for (i = 0; i < KVMPPC_XIVE_Q_COUNT; i++) {
 		if (xc->esc_virq[i]) {
 			if (kvmppc_xive_has_single_escalation(xc->xive))
-				xive_cleanup_single_escalation(vcpu, xc,
+				xive_cleanup_single_escalation(vcpu,
 							xc->esc_virq[i]);
 			free_irq(xc->esc_virq[i], vcpu);
 			irq_dispose_mapping(xc->esc_virq[i]);
diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
index 09d0657..f779ebb 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -306,8 +306,7 @@ struct kvmppc_xive_src_block *kvmppc_xive_create_src_block(
 int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
 				  bool single_escalation);
 struct kvmppc_xive *kvmppc_xive_get_device(struct kvm *kvm, u32 type);
-void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu,
-				    struct kvmppc_xive_vcpu *xc, int irq);
+void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu, int irq);
 int kvmppc_xive_compute_vp_id(struct kvmppc_xive *xive, u32 cpu, u32 *vp);
 int kvmppc_xive_set_nr_servers(struct kvmppc_xive *xive, u64 addr);
 bool kvmppc_xive_check_save_restore(struct kvm_vcpu *vcpu);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index f81ba6f..99c23a4 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -93,7 +93,7 @@ void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu)
 		/* Free the escalation irq */
 		if (xc->esc_virq[i]) {
 			if (kvmppc_xive_has_single_escalation(xc->xive))
-				xive_cleanup_single_escalation(vcpu, xc,
+				xive_cleanup_single_escalation(vcpu,
 							xc->esc_virq[i]);
 			free_irq(xc->esc_virq[i], vcpu);
 			irq_dispose_mapping(xc->esc_virq[i]);
-- 
1.8.3.1

