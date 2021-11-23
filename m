Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E515845A005
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:21:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Xq5vdSz3gml
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:21:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qFerZsUL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qFerZsUL; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxg61slz3cY0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:15 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p18so16577107plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bjUq2PyNr1kCbmg0n9VqWlcv4Aec2+LvN0ajEab18Ik=;
 b=qFerZsULq8HyDlciMuw3OdyyD7j7CmK2e2wr/eFoHmxZpKUapTXNjm/kHg2DkDypPN
 LOtd1H3+77G3FTe6CTOlTxfKhAIyKASZKeTeW7/HDaVgSi8K29nkAmriEW+fgycyR0wk
 3GIItuPGC7XaJ3vpCw8i7h24sDz+OLCk9FPkiz5Uaoh71Jy81+3nhKmu7R1zEhb8ifLf
 rq/etblJfY5Eqoh+PGr6wr838vcrluDZ/lt+Ip89SEwaxOVIkuSUa13uRtvzqGuWyDTk
 nFqky9Bv/62FXryDZ5P8Cfet9sNiahBtvhmec7sCsn9nwngq8mt6kQVwv6ye3jer5HGR
 oaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bjUq2PyNr1kCbmg0n9VqWlcv4Aec2+LvN0ajEab18Ik=;
 b=Qil8aWKnVoYlBEM4T8OQCHcJU9lDH+1EgBvM775aKqGrYMECSK9SPrsGWwuOJMLJ0d
 fCQvIvUDonvXwMkanBygUgw2FSrALdCfgDKt2fNK+KYxzpUxXSeZn0FRXNiReUIp9DaL
 83dSBKNVaaVubwi1as+Z4Qsd8v3iAHXWWfoe+TPbxxh2eblQ6wuF/9PE9hgp5kLLpYDt
 sQm8Jquiyj3Scum+zvHlLzle4vsBtDTxh/1vTAMMy4mqeJsGHV8M6lnnMPTrDQxhE9b5
 RZtxaRQBgrdrjbwsJdHxTkj6d4jfCjH6vXkgSQGtUYMgfHQsKa3cYM6wZlTftpidDXcF
 2HiA==
X-Gm-Message-State: AOAM530tHe1MLz6wq47FtQ9je/MRjn1ideIYhUENXLXaUGD2YZ7lFabQ
 Pgfisg6EBvIGF50hVqWJWHmflwynJaH/1Q==
X-Google-Smtp-Source: ABdhPJwVUvxQaKFRFRKki0P8c4GOSY3FGSPEsYrSBhGsX1ge5rQLwoTf6WEr8/cEYWh+VSMUIeuohQ==
X-Received: by 2002:a17:903:300d:b0:142:744f:c74d with SMTP id
 o13-20020a170903300d00b00142744fc74dmr5442758pla.26.1637661254044; 
 Tue, 23 Nov 2021 01:54:14 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 43/53] KVM: PPC: Book3S HV P9: Avoid tlbsync sequence on
 radix guest exit
Date: Tue, 23 Nov 2021 19:52:21 +1000
Message-Id: <20211123095231.1036501-44-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the existing TLB flushing logic to IPI the previous CPU and run the
necessary barriers before running a guest vCPU on a new physical CPU,
to do the necessary radix GTSE barriers for handling the case of an
interrupted guest tlbie sequence.

This requires the vCPU TLB flush sequence that is currently just done
on one thread, to be expanded to ensure the other threads execute a
ptesync, because causing them to exit the guest will no longer cause a
ptesync by itself.

This results in more IPIs than the TLB flush logic requires, but it's
a significant win for common case scheduling when the vCPU remains on
the same physical CPU.

This saves about 520 cycles (nearly 10%) on a guest entry+exit micro
benchmark on a POWER9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 48 +++++++++++++++++++++------
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 48 +++++++++++++++------------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c   |  6 ----
 3 files changed, 65 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9da27f19a697..df4e3f88398d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3002,29 +3002,54 @@ static void kvmppc_release_hwthread(int cpu)
 static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 {
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
-	cpumask_t *cpu_in_guest;
+	cpumask_t *cpu_in_guest, *need_tlb_flush;
 	int i;
 
-	cpu = cpu_first_tlb_thread_sibling(cpu);
 	if (nested) {
-		cpumask_set_cpu(cpu, &nested->need_tlb_flush);
+		need_tlb_flush = &nested->need_tlb_flush;
 		cpu_in_guest = &nested->cpu_in_guest;
 	} else {
-		cpumask_set_cpu(cpu, &kvm->arch.need_tlb_flush);
+		need_tlb_flush = &kvm->arch.need_tlb_flush;
 		cpu_in_guest = &kvm->arch.cpu_in_guest;
 	}
+
+	cpu = cpu_first_tlb_thread_sibling(cpu);
+	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
+					i += cpu_tlb_thread_sibling_step())
+		cpumask_set_cpu(i, need_tlb_flush);
+
 	/*
 	 * Make sure setting of bit in need_tlb_flush precedes
 	 * testing of cpu_in_guest bits.  The matching barrier on
 	 * the other side is the first smp_mb() in kvmppc_run_core().
 	 */
 	smp_mb();
+
 	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
 					i += cpu_tlb_thread_sibling_step())
 		if (cpumask_test_cpu(i, cpu_in_guest))
 			smp_call_function_single(i, do_nothing, NULL, 1);
 }
 
+static void do_migrate_away_vcpu(void *arg)
+{
+	struct kvm_vcpu *vcpu = arg;
+	struct kvm *kvm = vcpu->kvm;
+
+	/*
+	 * If the guest has GTSE, it may execute tlbie, so do a eieio; tlbsync;
+	 * ptesync sequence on the old CPU before migrating to a new one, in
+	 * case we interrupted the guest between a tlbie ; eieio ;
+	 * tlbsync; ptesync sequence.
+	 *
+	 * Otherwise, ptesync is sufficient for ordering tlbiel sequences.
+	 */
+	if (kvm->arch.lpcr & LPCR_GTSE)
+		asm volatile("eieio; tlbsync; ptesync");
+	else
+		asm volatile("ptesync");
+}
+
 static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
 {
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
@@ -3048,14 +3073,17 @@ static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
 	 * can move around between pcpus.  To cope with this, when
 	 * a vcpu moves from one pcpu to another, we need to tell
 	 * any vcpus running on the same core as this vcpu previously
-	 * ran to flush the TLB.  The TLB is shared between threads,
-	 * so we use a single bit in .need_tlb_flush for all 4 threads.
+	 * ran to flush the TLB.
 	 */
 	if (prev_cpu != pcpu) {
-		if (prev_cpu >= 0 &&
-		    cpu_first_tlb_thread_sibling(prev_cpu) !=
-		    cpu_first_tlb_thread_sibling(pcpu))
-			radix_flush_cpu(kvm, prev_cpu, vcpu);
+		if (prev_cpu >= 0) {
+			if (cpu_first_tlb_thread_sibling(prev_cpu) !=
+			    cpu_first_tlb_thread_sibling(pcpu))
+				radix_flush_cpu(kvm, prev_cpu, vcpu);
+
+			smp_call_function_single(prev_cpu,
+					do_migrate_away_vcpu, vcpu, 1);
+		}
 		if (nested)
 			nested->prev_cpu[vcpu->arch.nested_vcpu_id] = pcpu;
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index d0216d32ec91..9e899c813803 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -670,26 +670,41 @@ static void check_need_tlb_flush(struct kvm *kvm, int pcpu,
 				 struct kvm_nested_guest *nested)
 {
 	cpumask_t *need_tlb_flush;
-
-	/*
-	 * On POWER9, individual threads can come in here, but the
-	 * TLB is shared between the 4 threads in a core, hence
-	 * invalidating on one thread invalidates for all.
-	 * Thus we make all 4 threads use the same bit.
-	 */
-	pcpu = cpu_first_tlb_thread_sibling(pcpu);
+	bool all_set = true;
+	int i;
 
 	if (nested)
 		need_tlb_flush = &nested->need_tlb_flush;
 	else
 		need_tlb_flush = &kvm->arch.need_tlb_flush;
 
-	if (cpumask_test_cpu(pcpu, need_tlb_flush)) {
-		flush_guest_tlb(kvm);
+	if (likely(!cpumask_test_cpu(pcpu, need_tlb_flush)))
+		return;
 
-		/* Clear the bit after the TLB flush */
-		cpumask_clear_cpu(pcpu, need_tlb_flush);
+	/*
+	 * Individual threads can come in here, but the TLB is shared between
+	 * the 4 threads in a core, hence invalidating on one thread
+	 * invalidates for all, so only invalidate the first time (if all bits
+	 * were set.  The others must still execute a ptesync.
+	 *
+	 * If a race occurs and two threads do the TLB flush, that is not a
+	 * problem, just sub-optimal.
+	 */
+	for (i = cpu_first_tlb_thread_sibling(pcpu);
+			i <= cpu_last_tlb_thread_sibling(pcpu);
+			i += cpu_tlb_thread_sibling_step()) {
+		if (!cpumask_test_cpu(i, need_tlb_flush)) {
+			all_set = false;
+			break;
+		}
 	}
+	if (all_set)
+		flush_guest_tlb(kvm);
+	else
+		asm volatile("ptesync" ::: "memory");
+
+	/* Clear the bit after the TLB flush */
+	cpumask_clear_cpu(pcpu, need_tlb_flush);
 }
 
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
@@ -1109,15 +1124,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
-	if (kvm_is_radix(kvm)) {
-		/*
-		 * Since this is radix, do a eieio; tlbsync; ptesync sequence
-		 * in case we interrupted the guest between a tlbie and a
-		 * ptesync.
-		 */
-		asm volatile("eieio; tlbsync; ptesync");
-	}
-
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
 	 * to clear the copy buffer that was under control of the guest.
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 2c1f3c6e72d1..2257fb18cb72 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -55,12 +55,6 @@ static int global_invalidates(struct kvm *kvm)
 		smp_wmb();
 		cpumask_setall(&kvm->arch.need_tlb_flush);
 		cpu = local_paca->kvm_hstate.kvm_vcore->pcpu;
-		/*
-		 * On POWER9, threads are independent but the TLB is shared,
-		 * so use the bit for the first thread to represent the core.
-		 */
-		if (cpu_has_feature(CPU_FTR_ARCH_300))
-			cpu = cpu_first_tlb_thread_sibling(cpu);
 		cpumask_clear_cpu(cpu, &kvm->arch.need_tlb_flush);
 	}
 
-- 
2.23.0

