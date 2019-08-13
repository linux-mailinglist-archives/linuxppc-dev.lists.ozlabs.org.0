Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E18B53C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 12:17:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4677vJ5dx5zDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 20:17:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4677jc4dPrzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="crUdEllt"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4677jc2dyKz9sP3; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4677jc1lGMz9sN6; Tue, 13 Aug 2019 20:09:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1565690964; bh=BqwFEf1B6kCIBKtH5IBJUpVI6jeZDbf+DZLAvQciEns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=crUdElltByHccnwmoDmOW13jVQ9/O9qgxrm6gmZ4ZNbHEk1HnxtZgRZ7iPUOfIBaz
 P1i2b6h7dvQuQDmh7V7c3jx2YbfPhtB1gmHTED2h7244DKRCJUOJs7QZjiiE8UhLUi
 HNr4FU02+4k19MlkncAhf2cUEV7e5F6A69Pa1CzHs0Zro1cTbA4+UuygBh7vKgFbUA
 kwWbhcK01GDGBX1KnOsYJJVu/UhAmG9BuUAYBi4zeNJu+9XijoD6yvi7mSFTVK19dm
 F1vLQDdeBVcxqsA9l4t4QpYv+SaUs1PMbNpwDFnQAOeoO3iv9bhFGbPF9ksWshP1un
 TMgzq9Usfg+Gg==
Date: Tue, 13 Aug 2019 20:03:49 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH v2 1/3] KVM: PPC: Book3S HV: Fix race in re-enabling XIVE
 escalation interrupts
Message-ID: <20190813100349.GD9567@blackberry>
References: <20190813095845.GA9567@blackberry>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813095845.GA9567@blackberry>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Escalation interrupts are interrupts sent to the host by the XIVE
hardware when it has an interrupt to deliver to a guest VCPU but that
VCPU is not running anywhere in the system.  Hence we disable the
escalation interrupt for the VCPU being run when we enter the guest
and re-enable it when the guest does an H_CEDE hypercall indicating
it is idle.

It is possible that an escalation interrupt gets generated just as we
are entering the guest.  In that case the escalation interrupt may be
using a queue entry in one of the interrupt queues, and that queue
entry may not have been processed when the guest exits with an H_CEDE.
The existing entry code detects this situation and does not clear the
vcpu->arch.xive_esc_on flag as an indication that there is a pending
queue entry (if the queue entry gets processed, xive_esc_irq() will
clear the flag).  There is a comment in the code saying that if the
flag is still set on H_CEDE, we have to abort the cede rather than
re-enabling the escalation interrupt, lest we end up with two
occurrences of the escalation interrupt in the interrupt queue.

However, the exit code doesn't do that; it aborts the cede in the sense
that vcpu->arch.ceded gets cleared, but it still enables the escalation
interrupt by setting the source's PQ bits to 00.  Instead we need to
set the PQ bits to 10, indicating that an interrupt has been triggered.
We also need to avoid setting vcpu->arch.xive_esc_on in this case
(i.e. vcpu->arch.xive_esc_on seen to be set on H_CEDE) because
xive_esc_irq() will run at some point and clear it, and if we race with
that we may end up with an incorrect result (i.e. xive_esc_on set when
the escalation interrupt has just been handled).

It is extremely unlikely that having two queue entries would cause
observable problems; theoretically it could cause queue overflow, but
the CPU would have to have thousands of interrupts targetted to it for
that to be possible.  However, this fix will also make it possible to
determine accurately whether there is an unhandled escalation
interrupt in the queue, which will be needed by the following patch.

Cc: stable@vger.kernel.org # v4.16+
Fixes: 9b9b13a6d153 ("KVM: PPC: Book3S HV: Keep XIVE escalation interrupt masked unless ceded")
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
v2: don't set xive_esc_on if we're not using a XIVE escalation
interrupt.

 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 36 +++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 337e644..2e7e788 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2831,29 +2831,39 @@ kvm_cede_prodded:
 kvm_cede_exit:
 	ld	r9, HSTATE_KVM_VCPU(r13)
 #ifdef CONFIG_KVM_XICS
-	/* Abort if we still have a pending escalation */
+	/* are we using XIVE with single escalation? */
+	ld	r10, VCPU_XIVE_ESC_VADDR(r9)
+	cmpdi	r10, 0
+	beq	3f
+	li	r6, XIVE_ESB_SET_PQ_00
+	/*
+	 * If we still have a pending escalation, abort the cede,
+	 * and we must set PQ to 10 rather than 00 so that we don't
+	 * potentially end up with two entries for the escalation
+	 * interrupt in the XIVE interrupt queue.  In that case
+	 * we also don't want to set xive_esc_on to 1 here in
+	 * case we race with xive_esc_irq().
+	 */
 	lbz	r5, VCPU_XIVE_ESC_ON(r9)
 	cmpwi	r5, 0
-	beq	1f
+	beq	4f
 	li	r0, 0
 	stb	r0, VCPU_CEDED(r9)
-1:	/* Enable XIVE escalation */
-	li	r5, XIVE_ESB_SET_PQ_00
+	li	r6, XIVE_ESB_SET_PQ_10
+	b	5f
+4:	li	r0, 1
+	stb	r0, VCPU_XIVE_ESC_ON(r9)
+	/* make sure store to xive_esc_on is seen before xive_esc_irq runs */
+	sync
+5:	/* Enable XIVE escalation */
 	mfmsr	r0
 	andi.	r0, r0, MSR_DR		/* in real mode? */
 	beq	1f
-	ld	r10, VCPU_XIVE_ESC_VADDR(r9)
-	cmpdi	r10, 0
-	beq	3f
-	ldx	r0, r10, r5
+	ldx	r0, r10, r6
 	b	2f
 1:	ld	r10, VCPU_XIVE_ESC_RADDR(r9)
-	cmpdi	r10, 0
-	beq	3f
-	ldcix	r0, r10, r5
+	ldcix	r0, r10, r6
 2:	sync
-	li	r0, 1
-	stb	r0, VCPU_XIVE_ESC_ON(r9)
 #endif /* CONFIG_KVM_XICS */
 3:	b	guest_exit_cont
 
-- 
2.7.4

