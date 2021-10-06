Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2C423912
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 09:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPRDZ3QRCz306h
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:39:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIXCB89B;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIXCB89B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WIXCB89B; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WIXCB89B; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPRCx2CrXz2yPw
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 18:39:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633505944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gyw5R4SyvxKZs08K5h9MF/DzccP5WiPryhGpnJiBB6w=;
 b=WIXCB89B7bEpArN2kfd05PI2dKT3lV2YH2aHa2PdGRhzuMhK7OIBJ3qNZ/RaGY/ULEdA9o
 JqHqgjBvPJbwRbmZ0hVOv4C4ifZ8oSj/RZE7pklvBy493wwtebzh5dI6+YNrE7uIDAil+O
 RsMYW1VoxBM63BeFqOE0Ttrfrzm5J5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633505944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gyw5R4SyvxKZs08K5h9MF/DzccP5WiPryhGpnJiBB6w=;
 b=WIXCB89B7bEpArN2kfd05PI2dKT3lV2YH2aHa2PdGRhzuMhK7OIBJ3qNZ/RaGY/ULEdA9o
 JqHqgjBvPJbwRbmZ0hVOv4C4ifZ8oSj/RZE7pklvBy493wwtebzh5dI6+YNrE7uIDAil+O
 RsMYW1VoxBM63BeFqOE0Ttrfrzm5J5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-PRnThVInPqCZG6UN_wl6-g-1; Wed, 06 Oct 2021 03:37:51 -0400
X-MC-Unique: PRnThVInPqCZG6UN_wl6-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E8C1801E72;
 Wed,  6 Oct 2021 07:37:50 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2DF5D9CA;
 Wed,  6 Oct 2021 07:37:46 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Defer vtime accounting 'til after IRQ handling
Date: Wed,  6 Oct 2021 09:37:45 +0200
Message-Id: <20211006073745.82109-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 61bd0f66ff92 has moved guest_enter() out of the interrupt
protected area to be able to have updated tick counters, but
commit 112665286d08 moved back to this area to avoid wrong
context warning (or worse).

None of them are correct, to fix the problem port to POWER
the x86 fix 160457140187 ("KVM: x86: Defer vtime accounting 'til
after IRQ handling"):

"Defer the call to account guest time until after servicing any IRQ(s)
 that happened in the guest or immediately after VM-Exit.  Tick-based
 accounting of vCPU time relies on PF_VCPU being set when the tick IRQ
 handler runs, and IRQs are blocked throughout the main sequence of
 vcpu_enter_guest(), including the call into vendor code to actually
 enter and exit the guest."

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2009312
Fixes: 61bd0f66ff92 ("KVM: PPC: Book3S HV: Fix guest time accounting with VIRT_CPU_ACCOUNTING_GEN")
Fixes: 112665286d08 ("KVM: PPC: Book3S HV: Context tracking exit guest context before enabling irqs")
Cc: npiggin@gmail.com

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 arch/powerpc/kvm/book3s_hv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2acb1c96cfaf..43e1ce853785 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3695,6 +3695,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	srcu_read_unlock(&vc->kvm->srcu, srcu_idx);
 
+	context_tracking_guest_exit();
+
 	set_irq_happened(trap);
 
 	spin_lock(&vc->lock);
@@ -3726,9 +3728,8 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
-
 	local_irq_enable();
+	vtime_account_guest_exit();
 
 	/* Let secondaries go back to the offline loop */
 	for (i = 0; i < controlled_threads; ++i) {
@@ -4506,13 +4507,14 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 
+	context_tracking_guest_exit();
+
 	set_irq_happened(trap);
 
 	kvmppc_set_host_core(pcpu);
 
-	guest_exit_irqoff();
-
 	local_irq_enable();
+	vtime_account_guest_exit();
 
 	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
 
-- 
2.31.1

