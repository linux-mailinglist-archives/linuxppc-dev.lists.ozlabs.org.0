Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 190BC3BB104
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 01:09:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJ4K70Jjnz3dhl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jul 2021 09:09:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a03NrzAc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a03NrzAc; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJ4Jg1YS5z3dcG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jul 2021 09:09:23 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C0C56194B;
 Sun,  4 Jul 2021 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440161;
 bh=5pg9nitSXYfVlwY7yY6tqRmP8hUV+Pt1DA2dCiR5IUQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a03NrzAc1gJq61jYmVOvS1jUEn0EwuK9q3+AbViVEdjlnTOhjaDFwm036Har62sKQ
 OpjtxeGcvcoJOxbY6KUMpE1rbrf2+LsVPfBCycEOiSEciROZabcqh7Lrj2a5OeoQW7
 K+63u3NrXya56uEBJ/eZNrn9y4mRAcTXjTF7kas6pFADyv748rB5h0dPRmMswnIwye
 wTB9IrrWGAep8dYenUdHkhPnb7ZsMXAJvoCClgpo+NSwceYqq5XhRGtZMdBptTti1j
 Yi1yfvrpV/GuOcYQa8zXUJujDQMUpEakaGariDnGtkmP9wjR1R0whii0yltNuEp3W+
 vUmkzoicySaVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 57/70] KVM: PPC: Book3S HV: Fix TLB management on
 SMT8 POWER9 and POWER10 processors
Date: Sun,  4 Jul 2021 19:07:50 -0400
Message-Id: <20210704230804.1490078-57-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230804.1490078-1-sashal@kernel.org>
References: <20210704230804.1490078-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

[ Upstream commit 77bbbc0cf84834ed130838f7ac1988567f4d0288 ]

The POWER9 vCPU TLB management code assumes all threads in a core share
a TLB, and that TLBIEL execued by one thread will invalidate TLBs for
all threads. This is not the case for SMT8 capable POWER9 and POWER10
(big core) processors, where the TLB is split between groups of threads.
This results in TLB multi-hits, random data corruption, etc.

Fix this by introducing cpu_first_tlb_thread_sibling etc., to determine
which siblings share TLBs, and use that in the guest TLB flushing code.

[npiggin@gmail.com: add changelog and comment]

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210602040441.3984352-1-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/cputhreads.h | 30 +++++++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c          | 13 ++++++------
 arch/powerpc/kvm/book3s_hv_builtin.c  |  2 +-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |  2 +-
 4 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/cputhreads.h b/arch/powerpc/include/asm/cputhreads.h
index 98c8bd155bf9..b167186aaee4 100644
--- a/arch/powerpc/include/asm/cputhreads.h
+++ b/arch/powerpc/include/asm/cputhreads.h
@@ -98,6 +98,36 @@ static inline int cpu_last_thread_sibling(int cpu)
 	return cpu | (threads_per_core - 1);
 }
 
+/*
+ * tlb_thread_siblings are siblings which share a TLB. This is not
+ * architected, is not something a hypervisor could emulate and a future
+ * CPU may change behaviour even in compat mode, so this should only be
+ * used on PowerNV, and only with care.
+ */
+static inline int cpu_first_tlb_thread_sibling(int cpu)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
+		return cpu & ~0x6;	/* Big Core */
+	else
+		return cpu_first_thread_sibling(cpu);
+}
+
+static inline int cpu_last_tlb_thread_sibling(int cpu)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
+		return cpu | 0x6;	/* Big Core */
+	else
+		return cpu_last_thread_sibling(cpu);
+}
+
+static inline int cpu_tlb_thread_sibling_step(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_300) && (threads_per_core == 8))
+		return 2;		/* Big Core */
+	else
+		return 1;
+}
+
 static inline u32 get_tensr(void)
 {
 #ifdef	CONFIG_BOOKE
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 280f7992ae99..18ecffbad9ae 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2578,7 +2578,7 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 	cpumask_t *cpu_in_guest;
 	int i;
 
-	cpu = cpu_first_thread_sibling(cpu);
+	cpu = cpu_first_tlb_thread_sibling(cpu);
 	if (nested) {
 		cpumask_set_cpu(cpu, &nested->need_tlb_flush);
 		cpu_in_guest = &nested->cpu_in_guest;
@@ -2592,9 +2592,10 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 	 * the other side is the first smp_mb() in kvmppc_run_core().
 	 */
 	smp_mb();
-	for (i = 0; i < threads_per_core; ++i)
-		if (cpumask_test_cpu(cpu + i, cpu_in_guest))
-			smp_call_function_single(cpu + i, do_nothing, NULL, 1);
+	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
+					i += cpu_tlb_thread_sibling_step())
+		if (cpumask_test_cpu(i, cpu_in_guest))
+			smp_call_function_single(i, do_nothing, NULL, 1);
 }
 
 static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
@@ -2625,8 +2626,8 @@ static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
 	 */
 	if (prev_cpu != pcpu) {
 		if (prev_cpu >= 0 &&
-		    cpu_first_thread_sibling(prev_cpu) !=
-		    cpu_first_thread_sibling(pcpu))
+		    cpu_first_tlb_thread_sibling(prev_cpu) !=
+		    cpu_first_tlb_thread_sibling(pcpu))
 			radix_flush_cpu(kvm, prev_cpu, vcpu);
 		if (nested)
 			nested->prev_cpu[vcpu->arch.nested_vcpu_id] = pcpu;
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 8f58dd20b362..4621905bdd9e 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -893,7 +893,7 @@ void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
 	 * Thus we make all 4 threads use the same bit.
 	 */
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
-		pcpu = cpu_first_thread_sibling(pcpu);
+		pcpu = cpu_first_tlb_thread_sibling(pcpu);
 
 	if (nested)
 		need_tlb_flush = &nested->need_tlb_flush;
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 88da2764c1bb..3ddc83d2e849 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -67,7 +67,7 @@ static int global_invalidates(struct kvm *kvm)
 		 * so use the bit for the first thread to represent the core.
 		 */
 		if (cpu_has_feature(CPU_FTR_ARCH_300))
-			cpu = cpu_first_thread_sibling(cpu);
+			cpu = cpu_first_tlb_thread_sibling(cpu);
 		cpumask_clear_cpu(cpu, &kvm->arch.need_tlb_flush);
 	}
 
-- 
2.30.2

