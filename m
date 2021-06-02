Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94C397FFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 06:05:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvwRY0HQkz308w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 14:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CTmDuvnk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CTmDuvnk; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvwR13LP4z2yWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 14:04:59 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id z4so415861plg.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jun 2021 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=opIrV19eAsCnqykv2+ngjE4tZUavc+i3PGUBqFkvTtA=;
 b=CTmDuvnkcAwnPHdIlMpyGNmsVaMg2rz9ExsKm1coJEG1799NW6AkRLnCaCTch5Of2J
 DkrzwPXILicVSHpz6/NxycYTEDuFuq0lR4mAWtqTHwNdKZgK7QXlJBr1+pLWFqslzn96
 z/G7UKwpLaEUqqkcXjyGcZVJUvIGyiYVG23cy4tO96a+rSaMdtkIH4qol/6ASwNYAdik
 z74CzUgWURXk5e/EAfsXiHANUqPF64mcrgSr+izHkR5rc0dPvgZPDFQz534TLdU8+AQR
 blkcaLU7KjuPadyMTjKd7db/yUReBS1oHWLW0Dwu9CrRkR78ZKHlgHhBKof7tr0yXDmv
 /Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=opIrV19eAsCnqykv2+ngjE4tZUavc+i3PGUBqFkvTtA=;
 b=Uw4tTcxXYDkQmq5N61G8/IpJb2Z0dYLQ5eZ0tmtsCVRDjQfqrdZKGyKJHTcGEUEUYz
 wGcRQjYT5K6KVD02jkc1vaoPK1ou/hW+b1QIVWtpZbGrCvB3a7ETzG/byW3ilRcCZkBI
 Dw+A9WfXIyPMbiHPhK33axab7AeW4NgXyBAiFGfpbpH4lo5tbiSAhULyxt80ybH1unii
 l6qGd4m1aIZKptoeSaO417UtjeHz+G12q5TAZMGpAlCXybq///pshXZzbc5alYCdxSRM
 gO+4DY9ONlFefO9vM2SaAhnljX6dSfJOjVr5Rc63T7q5TcXlNmQZDfoi1nRG54mk38d/
 HaCw==
X-Gm-Message-State: AOAM533b8N8kUmrzzLL5LMijsHF7s0wrgOtrZPra94py0XPUSehm0+fI
 vnCHeoaaFe8ZQhaSwRlDHjo=
X-Google-Smtp-Source: ABdhPJwIJv3iLBKNzPpyH4QSAmQrzA6dT/WfPZnuGGRkn5FiSdiq1prfCrkiUNDLBGna0YBvQwxf1w==
X-Received: by 2002:a17:90b:ed5:: with SMTP id
 gz21mr29280786pjb.102.1622606695193; 
 Tue, 01 Jun 2021 21:04:55 -0700 (PDT)
Received: from bobo.ibm.com (60-241-69-122.static.tpgi.com.au. [60.241.69.122])
 by smtp.gmail.com with ESMTPSA id v14sm15195292pgl.86.2021.06.01.21.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 21:04:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH] KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and
 POWER10 processors
Date: Wed,  2 Jun 2021 14:04:41 +1000
Message-Id: <20210602040441.3984352-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

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
index 28a80d240b76..0a8398a63f80 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -2657,7 +2657,7 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 	cpumask_t *cpu_in_guest;
 	int i;
 
-	cpu = cpu_first_thread_sibling(cpu);
+	cpu = cpu_first_tlb_thread_sibling(cpu);
 	if (nested) {
 		cpumask_set_cpu(cpu, &nested->need_tlb_flush);
 		cpu_in_guest = &nested->cpu_in_guest;
@@ -2671,9 +2671,10 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
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
@@ -2704,8 +2705,8 @@ static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
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
index 7a0e33a9c980..3edc25c89092 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -800,7 +800,7 @@ void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
 	 * Thus we make all 4 threads use the same bit.
 	 */
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
-		pcpu = cpu_first_thread_sibling(pcpu);
+		pcpu = cpu_first_tlb_thread_sibling(pcpu);
 
 	if (nested)
 		need_tlb_flush = &nested->need_tlb_flush;
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7af7c70f1468..407dbf21bcbc 100644
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
2.23.0

