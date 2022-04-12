Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6444FC979
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 02:44:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kcn764BXxz3bYq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 10:44:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r7JvaNGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=r7JvaNGE; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kcn6W4z25z2xsb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 10:44:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D3C161787;
 Tue, 12 Apr 2022 00:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A305C385A4;
 Tue, 12 Apr 2022 00:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724254;
 bh=uS/GY6ExnjhPYx2j4Wl+qD9StA6nkkAyHB9DsmGkl2U=;
 h=From:To:Cc:Subject:Date:From;
 b=r7JvaNGEkdYNV8Amldnb8L2FcnORFAubxMbeZCdRomftjgkhFVYgQ7ShaO2ILF0Nc
 JhKg5EIQz3VDtxHcp5lPObzcAynZYE3EvOaSCe6aHAUs4iANfPHog2Fs2SvhuPG7zF
 YGMDaCvsrHM05JrXNtrRLXhI/0uphQVeXTM3LWPIXl4ev0lUcJVxcrRBqp1u3E3mgK
 yupC0gSmpdjgaf6X7cE1G27S9vZfL3Im9cN4XDI10Bnh0OygQHg5a4lVWF6NDQXH9n
 rlf2mKNIdrzIi+j7TsEHOGl6pw2/49mR6SGsLzlclFQ0Osb71ShOfTCsbjLS3tOEn+
 9G/9q6ODqqKpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 01/49] KVM: PPC: Book3S HV P9: Fix "lost kick"
 race
Date: Mon, 11 Apr 2022 20:43:19 -0400
Message-Id: <20220412004411.349427-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, farosas@linux.ibm.com, aik@ozlabs.ru,
 Nicholas Piggin <npiggin@gmail.com>, pbonzini@redhat.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit c7fa848ff01dad9ed3146a6b1a7d3622131bcedd ]

When new work is created that requires attention from the hypervisor
(e.g., to inject an interrupt into the guest), fast_vcpu_kick is used to
pull the target vcpu out of the guest if it may have been running.

Therefore the work creation side looks like this:

  vcpu->arch.doorbell_request = 1;
  kvmppc_fast_vcpu_kick_hv(vcpu) {
    smp_mb();
    cpu = vcpu->cpu;
    if (cpu != -1)
        send_ipi(cpu);
  }

And the guest entry side *should* look like this:

  vcpu->cpu = smp_processor_id();
  smp_mb();
  if (vcpu->arch.doorbell_request) {
    // do something (abort entry or inject doorbell etc)
  }

But currently the store and load are flipped, so it is possible for the
entry to see no doorbell pending, and the doorbell creation misses the
store to set cpu, resulting lost work (or at least delayed until the
next guest exit).

Fix this by reordering the entry operations and adding a smp_mb
between them. The P8 path appears to have a similar race which is
commented but not addressed yet.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220303053315.1056880-2-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 41 +++++++++++++++++++++++++++++-------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 791db769080d..316f61a4cb59 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -225,6 +225,13 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
 	int cpu;
 	struct rcuwait *waitp;
 
+	/*
+	 * rcuwait_wake_up contains smp_mb() which orders prior stores that
+	 * create pending work vs below loads of cpu fields. The other side
+	 * is the barrier in vcpu run that orders setting the cpu fields vs
+	 * testing for pending work.
+	 */
+
 	waitp = kvm_arch_vcpu_get_wait(vcpu);
 	if (rcuwait_wake_up(waitp))
 		++vcpu->stat.generic.halt_wakeup;
@@ -1089,7 +1096,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
 			break;
 		}
 		tvcpu->arch.prodded = 1;
-		smp_mb();
+		smp_mb(); /* This orders prodded store vs ceded load */
 		if (tvcpu->arch.ceded)
 			kvmppc_fast_vcpu_kick_hv(tvcpu);
 		break;
@@ -3771,6 +3778,14 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		pvc = core_info.vc[sub];
 		pvc->pcpu = pcpu + thr;
 		for_each_runnable_thread(i, vcpu, pvc) {
+			/*
+			 * XXX: is kvmppc_start_thread called too late here?
+			 * It updates vcpu->cpu and vcpu->arch.thread_cpu
+			 * which are used by kvmppc_fast_vcpu_kick_hv(), but
+			 * kick is called after new exceptions become available
+			 * and exceptions are checked earlier than here, by
+			 * kvmppc_core_prepare_to_enter.
+			 */
 			kvmppc_start_thread(vcpu, pvc);
 			kvmppc_create_dtl_entry(vcpu, pvc);
 			trace_kvm_guest_enter(vcpu);
@@ -4492,6 +4507,21 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (need_resched() || !kvm->arch.mmu_ready)
 		goto out;
 
+	vcpu->cpu = pcpu;
+	vcpu->arch.thread_cpu = pcpu;
+	vc->pcpu = pcpu;
+	local_paca->kvm_hstate.kvm_vcpu = vcpu;
+	local_paca->kvm_hstate.ptid = 0;
+	local_paca->kvm_hstate.fake_suspend = 0;
+
+	/*
+	 * Orders set cpu/thread_cpu vs testing for pending interrupts and
+	 * doorbells below. The other side is when these fields are set vs
+	 * kvmppc_fast_vcpu_kick_hv reading the cpu/thread_cpu fields to
+	 * kick a vCPU to notice the pending interrupt.
+	 */
+	smp_mb();
+
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
 		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
@@ -4511,13 +4541,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	tb = mftb();
 
-	vcpu->cpu = pcpu;
-	vcpu->arch.thread_cpu = pcpu;
-	vc->pcpu = pcpu;
-	local_paca->kvm_hstate.kvm_vcpu = vcpu;
-	local_paca->kvm_hstate.ptid = 0;
-	local_paca->kvm_hstate.fake_suspend = 0;
-
 	__kvmppc_create_dtl_entry(vcpu, pcpu, tb + vc->tb_offset, 0);
 
 	trace_kvm_guest_enter(vcpu);
@@ -4619,6 +4642,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	run->exit_reason = KVM_EXIT_INTR;
 	vcpu->arch.ret = -EINTR;
  out:
+	vcpu->cpu = -1;
+	vcpu->arch.thread_cpu = -1;
 	powerpc_local_irq_pmu_restore(flags);
 	preempt_enable();
 	goto done;
-- 
2.35.1

