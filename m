Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27945A015
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:25:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0dQ6T8tz3fjf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:25:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lqFF3FZI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lqFF3FZI; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxv5W2Fz3bqS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:27 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 200so17845211pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYk6tHfdKlc7vWg3vqQU2nDE31PU78AzKE7zsglgIn4=;
 b=lqFF3FZIegkJq/femlyAMtZ6TlOxVx5+yRXMVEsUdz/6dqw/3Iau0xLlf5GOkLlVju
 nJa5Xl2ROFgwqfLgmJcVU1benuaXXu7xe65infUKp6Wzx65OiQy9hBdhjsGRmWcWIzxd
 kQSNWCnU9h/3VsbhrsYkfwHBM/cyFVnW1YrVIc34pfPVYW12HKf4zL5MarSdYrm8ibIm
 1fldmJP141sGVAlj7hOv173LGiBt6Jg6Fd/R7+zUrNxENovKMU/HVTR8/k3uduFzVCv+
 6nYG6eePG23q59nT12NjyBAmtMjgUTTJDlqzHa6V8Jqua/y8eQJq1WfvRh/vFlPJGWID
 YyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYk6tHfdKlc7vWg3vqQU2nDE31PU78AzKE7zsglgIn4=;
 b=E0kpDQ0PCKk28rVEa/a1LjxMIogml7uWuKO0hzSRPYKsAa7qkbKJHiFZ4EGqOgu+HJ
 D8P1B3FSAJ5AUPmJSfJ7Wvi1dk0q42Hobfo6BYLYeDGA8T6mw+RO2McUyg7NqMfpMxzp
 +LKQr5rjWnd/HNJ7ddPInjbYviLXLKWVNw5/L6wG8z94LE7wuSgzORE61OU0T9ypZGUA
 gYdF361iA9uXs554kS1dNrktFosocxrKLP28fimgVAA6YvOv8BpRW0raVPD8W+vEumUx
 YYzTJbkqApGl0lMX7zcE5CU5D+3SyqTTu/lisNHfbhTJdi3Fhw4aYBXE2bZ9FfmCvd5F
 tC8w==
X-Gm-Message-State: AOAM532tTD9dlSx1FOxHgW3Smu0+ME2ErOPsulv96NTd6kF0yA/uSNGA
 IzNd64RbLRIZ7Z1HvULTJW4i7MOEZUvM5w==
X-Google-Smtp-Source: ABdhPJyspGXyCWShF/d6wWsbJa8A59Ycb2D+pmjEAyDgsNcUijdIehyOxHeb2UNvytcxKWubH0aDUQ==
X-Received: by 2002:a63:dc13:: with SMTP id s19mr2812502pgg.233.1637661266091; 
 Tue, 23 Nov 2021 01:54:26 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 49/53] KVM: PPC: Book3S HV P9: Avoid cpu_in_guest atomics
 on entry and exit
Date: Tue, 23 Nov 2021 19:52:27 +1000
Message-Id: <20211123095231.1036501-50-npiggin@gmail.com>
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

cpu_in_guest is set to determine if a CPU needs to be IPI'ed to exit
the guest and notice the need_tlb_flush bit.

This can be implemented as a global per-CPU pointer to the currently
running guest instead of per-guest cpumasks, saving 2 atomics per
entry/exit. P7/8 doesn't require cpu_in_guest, nor does a nested HV
(only the L0 does), so move it to the P9 HV path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  1 -
 arch/powerpc/include/asm/kvm_host.h      |  1 -
 arch/powerpc/kvm/book3s_hv.c             | 39 +++++++++++++-----------
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index 96f0fda50a07..fe07558173ef 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -44,7 +44,6 @@ struct kvm_nested_guest {
 	struct mutex tlb_lock;		/* serialize page faults and tlbies */
 	struct kvm_nested_guest *next;
 	cpumask_t need_tlb_flush;
-	cpumask_t cpu_in_guest;
 	short prev_cpu[NR_CPUS];
 	u8 radix;			/* is this nested guest radix */
 };
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index d7004412b859..17263276189e 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -287,7 +287,6 @@ struct kvm_arch {
 	u32 online_vcores;
 	atomic_t hpte_mod_interest;
 	cpumask_t need_tlb_flush;
-	cpumask_t cpu_in_guest;
 	u8 radix;
 	u8 fwnmi_enabled;
 	u8 secure_guest;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4056605d3367..00c1e102c103 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3009,19 +3009,18 @@ static void kvmppc_release_hwthread(int cpu)
 	tpaca->kvm_hstate.kvm_split_mode = NULL;
 }
 
+static DEFINE_PER_CPU(struct kvm *, cpu_in_guest);
+
 static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 {
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
-	cpumask_t *cpu_in_guest, *need_tlb_flush;
+	cpumask_t *need_tlb_flush;
 	int i;
 
-	if (nested) {
+	if (nested)
 		need_tlb_flush = &nested->need_tlb_flush;
-		cpu_in_guest = &nested->cpu_in_guest;
-	} else {
+	else
 		need_tlb_flush = &kvm->arch.need_tlb_flush;
-		cpu_in_guest = &kvm->arch.cpu_in_guest;
-	}
 
 	cpu = cpu_first_tlb_thread_sibling(cpu);
 	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
@@ -3029,16 +3028,21 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 		cpumask_set_cpu(i, need_tlb_flush);
 
 	/*
-	 * Make sure setting of bit in need_tlb_flush precedes
-	 * testing of cpu_in_guest bits.  The matching barrier on
-	 * the other side is the first smp_mb() in kvmppc_run_core().
+	 * Make sure setting of bit in need_tlb_flush precedes testing of
+	 * cpu_in_guest. The matching barrier on the other side is hwsync
+	 * when switching to guest MMU mode, which happens between
+	 * cpu_in_guest being set to the guest kvm, and need_tlb_flush bit
+	 * being tested.
 	 */
 	smp_mb();
 
 	for (i = cpu; i <= cpu_last_tlb_thread_sibling(cpu);
-					i += cpu_tlb_thread_sibling_step())
-		if (cpumask_test_cpu(i, cpu_in_guest))
+					i += cpu_tlb_thread_sibling_step()) {
+		struct kvm *running = *per_cpu_ptr(&cpu_in_guest, i);
+
+		if (running == kvm)
 			smp_call_function_single(i, do_nothing, NULL, 1);
+	}
 }
 
 static void do_migrate_away_vcpu(void *arg)
@@ -3105,7 +3109,6 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
 {
 	int cpu;
 	struct paca_struct *tpaca;
-	struct kvm *kvm = vc->kvm;
 
 	cpu = vc->pcpu;
 	if (vcpu) {
@@ -3116,7 +3119,6 @@ static void kvmppc_start_thread(struct kvm_vcpu *vcpu, struct kvmppc_vcore *vc)
 		cpu += vcpu->arch.ptid;
 		vcpu->cpu = vc->pcpu;
 		vcpu->arch.thread_cpu = cpu;
-		cpumask_set_cpu(cpu, &kvm->arch.cpu_in_guest);
 	}
 	tpaca = paca_ptrs[cpu];
 	tpaca->kvm_hstate.kvm_vcpu = vcpu;
@@ -3847,7 +3849,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 		kvmppc_release_hwthread(pcpu + i);
 		if (sip && sip->napped[i])
 			kvmppc_ipi_thread(pcpu + i);
-		cpumask_clear_cpu(pcpu + i, &vc->kvm->arch.cpu_in_guest);
 	}
 
 	spin_unlock(&vc->lock);
@@ -4015,8 +4016,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 
 	} else {
+		struct kvm *kvm = vcpu->kvm;
+
 		kvmppc_xive_push_vcpu(vcpu);
+
+		__this_cpu_write(cpu_in_guest, kvm);
 		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
+		__this_cpu_write(cpu_in_guest, NULL);
+
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
@@ -4041,7 +4048,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 		kvmppc_xive_pull_vcpu(vcpu);
 
-		if (kvm_is_radix(vcpu->kvm))
+		if (kvm_is_radix(kvm))
 			vcpu->arch.slb_max = 0;
 	}
 
@@ -4531,8 +4538,6 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	powerpc_local_irq_pmu_restore(flags);
 
-	cpumask_clear_cpu(pcpu, &kvm->arch.cpu_in_guest);
-
 	preempt_enable();
 
 	/*
-- 
2.23.0

