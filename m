Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9BB45A002
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0X52jX5z3dcb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:20:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbGtDyxj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TbGtDyxj; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxd5Ysvz2ygB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:13 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id o14so16599086plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krc6ce0EHjFKMyfFFkr7S3E7pZxSbrG12mhc4qWMW6Y=;
 b=TbGtDyxjuPXDNzKenvMavggjMy5q1FUKTs6vBqPYlp1Ws804smlpZjvdkzUtEs/ehu
 XtDgoXfqfyGoKTuL4ikn/yPX5EYJeEGFPHgehKz4VZFa2NqysR3trHj1m+FWDBq8pUxb
 YN7FT0rRuJ2o6g9O6vVf+gPJ7q9ibTq46j7Gf322uO/bvG45f8Bb5bL8I1StFO6mVL85
 2sIlDHXRWsZ1ocWlSYsjII6l/o+Sju5O/+czEba1bC7S0tfH6/k6ZOkThJ0tSXd3jxmz
 Nk9eTq6btnWdV6qokvfF8DN0Hry7vNKiuP/HnYvgLjOlcQ+dYnsOZTgPPEFTEut/7Ou9
 EzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krc6ce0EHjFKMyfFFkr7S3E7pZxSbrG12mhc4qWMW6Y=;
 b=HNcc3Bf4D7Fqsr55M7vhDNvXZmq7d59Sr1zmjjFTKhD0lV3REvywgdv9QfPbLdIJtC
 VUqK6RRXHUUxT+cWA7YR1wec9K3YGoZjnzCrpaWwuP2hmfTpyv2IytLLJiuOrUgjPRqj
 0ZjWdaEZapguO6xtIzyQ+a5Cf5qCiXQCBs116nGc4FYIMKNIqc2rxPOzcqG8nX2yYLxQ
 L1G3fFLtyycEUsy7Tjx0TShb6BbMf8lYgBvZMKtG8ttPSozXW6alJCcdUvg/ux0weCpW
 Lvg9F1KgSEcxHicgfA+2AghpJT2vcV7QP0ZbgS64j1LD5oXv2KY/lbiLudi6Etjqah4Z
 kLjg==
X-Gm-Message-State: AOAM532QDt7Wor88PZWMIKya3MccJSogBgVTusnrFFbl+vCtn0KN+F5z
 vBV/NOFGvuAYpYKP5SzUEYy7JxmU8q08aw==
X-Google-Smtp-Source: ABdhPJwaoEe4liEzGPevxmAoginQUQa3hJfyy70QIi5Zze2VAGEoUBe2xU7sLRwc8VsO3/4vQno//g==
X-Received: by 2002:a17:902:ab8d:b0:143:8d6f:2b52 with SMTP id
 f13-20020a170902ab8d00b001438d6f2b52mr5412814plr.78.1637661251996; 
 Tue, 23 Nov 2021 01:54:11 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:11 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 42/53] KVM: PPC: Book3S HV: Split P8 from P9 path guest
 vCPU TLB flushing
Date: Tue, 23 Nov 2021 19:52:20 +1000
Message-Id: <20211123095231.1036501-43-npiggin@gmail.com>
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

This creates separate functions for old and new paths for vCPU TLB
flushing, which will reduce complexity of the next change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h    |  3 +-
 arch/powerpc/kvm/book3s_hv_builtin.c  | 53 ++++-------------------
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 62 ++++++++++++++++++++++++++-
 3 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 671fbd1a765e..2b76d51e4b13 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -552,8 +552,7 @@ extern void kvm_hv_vm_activated(void);
 extern void kvm_hv_vm_deactivated(void);
 extern bool kvm_hv_mode_active(void);
 
-extern void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
-					struct kvm_nested_guest *nested);
+extern void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu);
 
 #else
 static inline void __init kvm_cma_reserve(void)
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 70b7a8f97153..ad70756a777c 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -682,60 +682,23 @@ static void flush_guest_tlb(struct kvm *kvm)
 	unsigned long rb, set;
 
 	rb = PPC_BIT(52);	/* IS = 2 */
-	if (kvm_is_radix(kvm)) {
-		/* R=1 PRS=1 RIC=2 */
+	for (set = 0; set < kvm->arch.tlb_sets; ++set) {
+		/* R=0 PRS=0 RIC=0 */
 		asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
-			     : : "r" (rb), "i" (1), "i" (1), "i" (2),
+			     : : "r" (rb), "i" (0), "i" (0), "i" (0),
 			       "r" (0) : "memory");
-		for (set = 1; set < kvm->arch.tlb_sets; ++set) {
-			rb += PPC_BIT(51);	/* increment set number */
-			/* R=1 PRS=1 RIC=0 */
-			asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
-				     : : "r" (rb), "i" (1), "i" (1), "i" (0),
-				       "r" (0) : "memory");
-		}
-		asm volatile("ptesync": : :"memory");
-		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
-		asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
-	} else {
-		for (set = 0; set < kvm->arch.tlb_sets; ++set) {
-			/* R=0 PRS=0 RIC=0 */
-			asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
-				     : : "r" (rb), "i" (0), "i" (0), "i" (0),
-				       "r" (0) : "memory");
-			rb += PPC_BIT(51);	/* increment set number */
-		}
-		asm volatile("ptesync": : :"memory");
-		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
-		if (cpu_has_feature(CPU_FTR_ARCH_300))
-			asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
+		rb += PPC_BIT(51);	/* increment set number */
 	}
+	asm volatile("ptesync": : :"memory");
 }
 
-void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu,
-				 struct kvm_nested_guest *nested)
+void kvmppc_check_need_tlb_flush(struct kvm *kvm, int pcpu)
 {
-	cpumask_t *need_tlb_flush;
-
-	/*
-	 * On POWER9, individual threads can come in here, but the
-	 * TLB is shared between the 4 threads in a core, hence
-	 * invalidating on one thread invalidates for all.
-	 * Thus we make all 4 threads use the same bit.
-	 */
-	if (cpu_has_feature(CPU_FTR_ARCH_300))
-		pcpu = cpu_first_tlb_thread_sibling(pcpu);
-
-	if (nested)
-		need_tlb_flush = &nested->need_tlb_flush;
-	else
-		need_tlb_flush = &kvm->arch.need_tlb_flush;
-
-	if (cpumask_test_cpu(pcpu, need_tlb_flush)) {
+	if (cpumask_test_cpu(pcpu, &kvm->arch.need_tlb_flush)) {
 		flush_guest_tlb(kvm);
 
 		/* Clear the bit after the TLB flush */
-		cpumask_clear_cpu(pcpu, need_tlb_flush);
+		cpumask_clear_cpu(pcpu, &kvm->arch.need_tlb_flush);
 	}
 }
 EXPORT_SYMBOL_GPL(kvmppc_check_need_tlb_flush);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index eae9d806d704..d0216d32ec91 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -632,6 +632,66 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	}
 }
 
+static void flush_guest_tlb(struct kvm *kvm)
+{
+	unsigned long rb, set;
+
+	rb = PPC_BIT(52);	/* IS = 2 */
+	if (kvm_is_radix(kvm)) {
+		/* R=1 PRS=1 RIC=2 */
+		asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
+			     : : "r" (rb), "i" (1), "i" (1), "i" (2),
+			       "r" (0) : "memory");
+		for (set = 1; set < kvm->arch.tlb_sets; ++set) {
+			rb += PPC_BIT(51);	/* increment set number */
+			/* R=1 PRS=1 RIC=0 */
+			asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
+				     : : "r" (rb), "i" (1), "i" (1), "i" (0),
+				       "r" (0) : "memory");
+		}
+		asm volatile("ptesync": : :"memory");
+		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
+		asm volatile(PPC_RADIX_INVALIDATE_ERAT_GUEST : : :"memory");
+	} else {
+		for (set = 0; set < kvm->arch.tlb_sets; ++set) {
+			/* R=0 PRS=0 RIC=0 */
+			asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
+				     : : "r" (rb), "i" (0), "i" (0), "i" (0),
+				       "r" (0) : "memory");
+			rb += PPC_BIT(51);	/* increment set number */
+		}
+		asm volatile("ptesync": : :"memory");
+		// POWER9 congruence-class TLBIEL leaves ERAT. Flush it now.
+		asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT : : :"memory");
+	}
+}
+
+static void check_need_tlb_flush(struct kvm *kvm, int pcpu,
+				 struct kvm_nested_guest *nested)
+{
+	cpumask_t *need_tlb_flush;
+
+	/*
+	 * On POWER9, individual threads can come in here, but the
+	 * TLB is shared between the 4 threads in a core, hence
+	 * invalidating on one thread invalidates for all.
+	 * Thus we make all 4 threads use the same bit.
+	 */
+	pcpu = cpu_first_tlb_thread_sibling(pcpu);
+
+	if (nested)
+		need_tlb_flush = &nested->need_tlb_flush;
+	else
+		need_tlb_flush = &kvm->arch.need_tlb_flush;
+
+	if (cpumask_test_cpu(pcpu, need_tlb_flush)) {
+		flush_guest_tlb(kvm);
+
+		/* Clear the bit after the TLB flush */
+		cpumask_clear_cpu(pcpu, need_tlb_flush);
+	}
+}
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct p9_host_os_sprs host_os_sprs;
@@ -819,7 +879,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	}
 
 	/* TLBIEL uses LPID=LPIDR, so run this after setting guest LPID */
-	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
+	check_need_tlb_flush(kvm, vc->pcpu, nested);
 
 	/*
 	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
-- 
2.23.0

