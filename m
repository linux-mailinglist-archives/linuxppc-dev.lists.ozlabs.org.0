Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14322425571
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 16:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQDHC6XVSz3096
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 01:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXZtgcFD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KohwsKwk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RXZtgcFD; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KohwsKwk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQDGZ2WRxz2yg4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 01:29:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UF3re4UnbtUqtYZZTivLh2H8ZzAeAte+9PT67KP/GWA=;
 b=RXZtgcFDlN5yisMhgQBES7fcfhESPPU1sCIsHf43Wc1JPrMAuHtMm5rHVIXz6++kneL0Qa
 N5zxrUXf/z+ZF+9eXRsW7RVv+hGCB9MTSrdn4DUBshQD6k/VUpsP7eaPXyQSSsJr1R0Oxb
 Ym/hS3kcTJI1W7xLgqPvdUBjYzVjgmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633616946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=UF3re4UnbtUqtYZZTivLh2H8ZzAeAte+9PT67KP/GWA=;
 b=KohwsKwk/GD8vDuUgVZgy0kgDQnLrzbt812jYvBSuy7xOaOjavR4+fnm3+kJIRa7mgvMa4
 mOF+y9CqJ6rOA8j1TZVPajrOXlFPPWcAVX51Y+bYfXNNREjDkDXUSxACp/HsqNPDQFCe2C
 92oozTMLb4VfOkQF0wfeBOIFphhiWJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-ufrnTYxeO4KxQJKz_zDHRg-1; Thu, 07 Oct 2021 10:29:04 -0400
X-MC-Unique: ufrnTYxeO4KxQJKz_zDHRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB281007301;
 Thu,  7 Oct 2021 14:29:01 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B300626572;
 Thu,  7 Oct 2021 14:28:57 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2] KVM: PPC: Defer vtime accounting 'til after IRQ handling
Date: Thu,  7 Oct 2021 16:28:56 +0200
Message-Id: <20211007142856.41205-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Laurent Vivier <lvivier@redhat.com>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 112665286d08 moved guest_exit() in the interrupt protected
area to avoid wrong context warning (or worse), but the tick counter
cannot be updated and the guest time is accounted to the system time.

To fix the problem port to POWER the x86 fix
160457140187 ("Defer vtime accounting 'til after IRQ handling"):

"Defer the call to account guest time until after servicing any IRQ(s)
 that happened in the guest or immediately after VM-Exit.  Tick-based
 accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
 handler runs, and IRQs are blocked throughout the main sequence of
 vcpu_enter_guest(), including the call into vendor code to actually
 enter and exit the guest."

Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
Cc: npiggin@gmail.com
Cc: <stable@vger.kernel.org> # 5.12
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: remove reference to commit 61bd0f66ff92
        cc stable 5.12
        add the same comment in the code as for x86

 arch/powerpc/kvm/book3s_hv.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2acb1c96cfaf..a694d1a8f6ce 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3695,6 +3695,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	srcu_read_unlock(&vc->kvm->srcu, srcu_idx);
 
+	context_tracking_guest_exit();
+
 	set_irq_happened(trap);
 
 	spin_lock(&vc->lock);
@@ -3726,9 +3728,15 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
-
 	local_irq_enable();
+	/*
+	 * Wait until after servicing IRQs to account guest time so that any
+	 * ticks that occurred while running the guest are properly accounted
+	 * to the guest.  Waiting until IRQs are enabled degrades the accuracy
+	 * of accounting via context tracking, but the loss of accuracy is
+	 * acceptable for all known use cases.
+	 */
+	vtime_account_guest_exit();
 
 	/* Let secondaries go back to the offline loop */
 	for (i = 0; i < controlled_threads; ++i) {
@@ -4506,13 +4514,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
+	context_tracking_guest_exit();
+
 	set_irq_happened(trap);
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
-
 	local_irq_enable();
+	/*
+	 * Wait until after servicing IRQs to account guest time so that any
+	 * ticks that occurred while running the guest are properly accounted
+	 * to the guest.  Waiting until IRQs are enabled degrades the accuracy
+	 * of accounting via context tracking, but the loss of accuracy is
+	 * acceptable for all known use cases.
+	 */
+	vtime_account_guest_exit();
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
-- 
2.31.1

