Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55212558B75
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 00:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTbKJ1zPCz3dQt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 08:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=jiaming@nfschina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 308 seconds by postgrey-1.36 at boromir; Thu, 23 Jun 2022 20:25:52 AEST
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTGcJ2rslz3bqR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 20:25:52 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 5F23D1E80C7D;
	Thu, 23 Jun 2022 18:20:19 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It6xpm0snNTk; Thu, 23 Jun 2022 18:20:16 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.33])
	(Authenticated sender: jiaming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id C822F1E80CCC;
	Thu, 23 Jun 2022 18:20:15 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] KVM: Fix spelling mistake
Date: Thu, 23 Jun 2022 18:20:31 +0800
Message-Id: <20220623102031.15359-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Jun 2022 08:56:56 +1000
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
Cc: liqiong@nfschina.com, renyu@nfschina.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Zhang Jiaming <jiaming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change 'subsquent' to 'subsequent'.
Change 'accross' to 'across'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 arch/powerpc/kvm/book3s_xive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 4ca23644f752..b4b680f2d853 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -539,7 +539,7 @@ static int xive_vm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
 	if (irq == XICS_IPI || irq == 0) {
 		/*
 		 * This barrier orders the setting of xc->cppr vs.
-		 * subsquent test of xc->mfrr done inside
+		 * subsequent test of xc->mfrr done inside
 		 * scan_interrupts and push_pending_to_hw
 		 */
 		smp_mb();
@@ -563,7 +563,7 @@ static int xive_vm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
 	/*
 	 * This barrier orders both setting of in_eoi above vs,
 	 * subsequent test of guest_priority, and the setting
-	 * of xc->cppr vs. subsquent test of xc->mfrr done inside
+	 * of xc->cppr vs. subsequent test of xc->mfrr done inside
 	 * scan_interrupts and push_pending_to_hw
 	 */
 	smp_mb();
@@ -2392,7 +2392,7 @@ static int xive_set_source(struct kvmppc_xive *xive, long irq, u64 addr)
 	/*
 	 * Now, we select a target if we have one. If we don't we
 	 * leave the interrupt untargetted. It means that an interrupt
-	 * can become "untargetted" accross migration if it was masked
+	 * can become "untargetted" across migration if it was masked
 	 * by set_xive() but there is little we can do about it.
 	 */
 
-- 
2.25.1

