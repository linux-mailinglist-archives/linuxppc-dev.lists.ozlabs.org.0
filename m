Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F2C393FBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frzds6gwRz3ffG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:19:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lCh7SfPK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lCh7SfPK; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQ657ylz308J
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:09:02 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id r1so2044445pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ba/FtiNPYvtgC5nI3C96lO92YgQ2+6vbolXipBjp/WE=;
 b=lCh7SfPKWOYuhHkJQ/NrZmN7C3w2LD4+zsfEUKvMKH7rSPyFIsOlAmTrwO5CHtN6XE
 GbVqs/NvlX+BksJoYdxMoTEAHccvCZskSIyXcuOzWPPDxnfV7iqmi9gdyBH75K3MHhJb
 VCyU45sxZf1PiUCGDQZwyfUFIZqlq+s/czb8BCU07I/vKHv8HPvIZUHBLQFw/ronm/bO
 XAbw08K7llvVId4xfPFaYySQm1u6e6dBjgbCW2oIKwP45wGaVd+mtyQUOiA0B8cEg7aB
 /SjLPQjysuJAHn2atD83R6wh0iKo6DV1Eb1b63J8ijjnSj6MxrGzIoW5Fhd4jKxblw5G
 Cq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ba/FtiNPYvtgC5nI3C96lO92YgQ2+6vbolXipBjp/WE=;
 b=guIWrIZf0HFgl3beVHDBF4lGce7oOJvHy4nXQRUPUjVIQZVNtwtgpsla8B+lDhRcRt
 DyqXpxwiH0dGI1kybW1HuNHAdHggxp3GrDFzDsH2YjR214QroWGLQYqD1jYY74qaq+A8
 aHc//2lHKx5aEIMPz9LykRhcU6MaTDq8JMdh6MjEhZyCu3PgQ5s/c+g6NVnFfw0uQz84
 aFgTlES7Vm0g91CdYHhpjbgQpt7yAWPaE3ohHsuo+EuspZL/GoOSey0reZfD0bofGVu0
 5MpuaYwehzu5V0OaliuguE/nKOWaVr0/jRCAz4eyZUU+56lsqrlHbend+1ubXOomHQEA
 ie5Q==
X-Gm-Message-State: AOAM530hPfbGg3EvxWXYXzZMJ8KGAAWknHMUXK6YNtnmJrbZCBCMKJsx
 SaT6D9ZC6xsUk/fmXWSP/yQ=
X-Google-Smtp-Source: ABdhPJxcTA19fUJwQmVjQ/dGLipmqt/3Ax9/JJGRRyMKu36Ts4KMo4b67DcpHIACDYoxaZm55dCOgg==
X-Received: by 2002:a62:8897:0:b029:2dd:49ad:ffee with SMTP id
 l145-20020a6288970000b02902dd49adffeemr2932335pfd.48.1622192940285; 
 Fri, 28 May 2021 02:09:00 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:09:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 24/32] KVM: PPC: Book3S HV: Remove virt mode checks from
 real mode handlers
Date: Fri, 28 May 2021 19:07:44 +1000
Message-Id: <20210528090752.3542186-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that the P7/8 path no longer supports radix, real-mode handlers
do not need to deal with being called in virt mode.

This change effectively reverts commit acde25726bc6 ("KVM: PPC: Book3S
HV: Add radix checks in real-mode hypercall handlers").

It removes a few more real-mode tests in rm hcall handlers, which
allows the indirect ops for the xive module to be removed from the
built-in xics rm handlers.

kvmppc_h_random is renamed to kvmppc_rm_h_random to be a bit more
descriptive and consistent with other rm handlers.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_ppc.h      | 10 +--
 arch/powerpc/kvm/book3s.c               | 11 +--
 arch/powerpc/kvm/book3s_64_vio_hv.c     | 12 ----
 arch/powerpc/kvm/book3s_hv_builtin.c    | 91 ++++++-------------------
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  2 +-
 arch/powerpc/kvm/book3s_xive.c          | 18 -----
 arch/powerpc/kvm/book3s_xive.h          |  7 --
 arch/powerpc/kvm/book3s_xive_native.c   | 10 ---
 8 files changed, 23 insertions(+), 138 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index cb9e3c85c605..2d88944f9f34 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -659,8 +659,6 @@ extern int kvmppc_xive_get_xive(struct kvm *kvm, u32 irq, u32 *server,
 				u32 *priority);
 extern int kvmppc_xive_int_on(struct kvm *kvm, u32 irq);
 extern int kvmppc_xive_int_off(struct kvm *kvm, u32 irq);
-extern void kvmppc_xive_init_module(void);
-extern void kvmppc_xive_exit_module(void);
 
 extern int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 				    struct kvm_vcpu *vcpu, u32 cpu);
@@ -686,8 +684,6 @@ static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 extern int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 					   struct kvm_vcpu *vcpu, u32 cpu);
 extern void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu);
-extern void kvmppc_xive_native_init_module(void);
-extern void kvmppc_xive_native_exit_module(void);
 extern int kvmppc_xive_native_get_vp(struct kvm_vcpu *vcpu,
 				     union kvmppc_one_reg *val);
 extern int kvmppc_xive_native_set_vp(struct kvm_vcpu *vcpu,
@@ -701,8 +697,6 @@ static inline int kvmppc_xive_get_xive(struct kvm *kvm, u32 irq, u32 *server,
 				       u32 *priority) { return -1; }
 static inline int kvmppc_xive_int_on(struct kvm *kvm, u32 irq) { return -1; }
 static inline int kvmppc_xive_int_off(struct kvm *kvm, u32 irq) { return -1; }
-static inline void kvmppc_xive_init_module(void) { }
-static inline void kvmppc_xive_exit_module(void) { }
 
 static inline int kvmppc_xive_connect_vcpu(struct kvm_device *dev,
 					   struct kvm_vcpu *vcpu, u32 cpu) { return -EBUSY; }
@@ -725,8 +719,6 @@ static inline int kvmppc_xive_enabled(struct kvm_vcpu *vcpu)
 static inline int kvmppc_xive_native_connect_vcpu(struct kvm_device *dev,
 			  struct kvm_vcpu *vcpu, u32 cpu) { return -EBUSY; }
 static inline void kvmppc_xive_native_cleanup_vcpu(struct kvm_vcpu *vcpu) { }
-static inline void kvmppc_xive_native_init_module(void) { }
-static inline void kvmppc_xive_native_exit_module(void) { }
 static inline int kvmppc_xive_native_get_vp(struct kvm_vcpu *vcpu,
 					    union kvmppc_one_reg *val)
 { return 0; }
@@ -762,7 +754,7 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
 			   unsigned long tce_value, unsigned long npages);
 long int kvmppc_rm_h_confer(struct kvm_vcpu *vcpu, int target,
                             unsigned int yield_count);
-long kvmppc_h_random(struct kvm_vcpu *vcpu);
+long kvmppc_rm_h_random(struct kvm_vcpu *vcpu);
 void kvmhv_commence_exit(int trap);
 void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu);
 void kvmppc_subcore_enter_guest(void);
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index d69560d5bf16..5e1e1cff0ee3 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -1050,13 +1050,10 @@ static int kvmppc_book3s_init(void)
 #ifdef CONFIG_KVM_XICS
 #ifdef CONFIG_KVM_XIVE
 	if (xics_on_xive()) {
-		kvmppc_xive_init_module();
 		kvm_register_device_ops(&kvm_xive_ops, KVM_DEV_TYPE_XICS);
-		if (kvmppc_xive_native_supported()) {
-			kvmppc_xive_native_init_module();
+		if (kvmppc_xive_native_supported())
 			kvm_register_device_ops(&kvm_xive_native_ops,
 						KVM_DEV_TYPE_XIVE);
-		}
 	} else
 #endif
 		kvm_register_device_ops(&kvm_xics_ops, KVM_DEV_TYPE_XICS);
@@ -1066,12 +1063,6 @@ static int kvmppc_book3s_init(void)
 
 static void kvmppc_book3s_exit(void)
 {
-#ifdef CONFIG_KVM_XICS
-	if (xics_on_xive()) {
-		kvmppc_xive_exit_module();
-		kvmppc_xive_native_exit_module();
-	}
-#endif
 #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
 	kvmppc_book3s_exit_pr();
 #endif
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index 083a4e037718..dc6591548f0c 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -391,10 +391,6 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 	/* udbg_printf("H_PUT_TCE(): liobn=0x%lx ioba=0x%lx, tce=0x%lx\n", */
 	/* 	    liobn, ioba, tce); */
 
-	/* For radix, we might be in virtual mode, so punt */
-	if (kvm_is_radix(vcpu->kvm))
-		return H_TOO_HARD;
-
 	stt = kvmppc_find_table(vcpu->kvm, liobn);
 	if (!stt)
 		return H_TOO_HARD;
@@ -489,10 +485,6 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
 	bool prereg = false;
 	struct kvmppc_spapr_tce_iommu_table *stit;
 
-	/* For radix, we might be in virtual mode, so punt */
-	if (kvm_is_radix(vcpu->kvm))
-		return H_TOO_HARD;
-
 	/*
 	 * used to check for invalidations in progress
 	 */
@@ -602,10 +594,6 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
 	long i, ret;
 	struct kvmppc_spapr_tce_iommu_table *stit;
 
-	/* For radix, we might be in virtual mode, so punt */
-	if (kvm_is_radix(vcpu->kvm))
-		return H_TOO_HARD;
-
 	stt = kvmppc_find_table(vcpu->kvm, liobn);
 	if (!stt)
 		return H_TOO_HARD;
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 7a0e33a9c980..8d669a0e15f8 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -34,21 +34,6 @@
 #include "book3s_xics.h"
 #include "book3s_xive.h"
 
-/*
- * The XIVE module will populate these when it loads
- */
-unsigned long (*__xive_vm_h_xirr)(struct kvm_vcpu *vcpu);
-unsigned long (*__xive_vm_h_ipoll)(struct kvm_vcpu *vcpu, unsigned long server);
-int (*__xive_vm_h_ipi)(struct kvm_vcpu *vcpu, unsigned long server,
-		       unsigned long mfrr);
-int (*__xive_vm_h_cppr)(struct kvm_vcpu *vcpu, unsigned long cppr);
-int (*__xive_vm_h_eoi)(struct kvm_vcpu *vcpu, unsigned long xirr);
-EXPORT_SYMBOL_GPL(__xive_vm_h_xirr);
-EXPORT_SYMBOL_GPL(__xive_vm_h_ipoll);
-EXPORT_SYMBOL_GPL(__xive_vm_h_ipi);
-EXPORT_SYMBOL_GPL(__xive_vm_h_cppr);
-EXPORT_SYMBOL_GPL(__xive_vm_h_eoi);
-
 /*
  * Hash page table alignment on newer cpus(CPU_FTR_ARCH_206)
  * should be power of 2.
@@ -196,16 +181,9 @@ int kvmppc_hwrng_present(void)
 }
 EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
 
-long kvmppc_h_random(struct kvm_vcpu *vcpu)
+long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
 {
-	int r;
-
-	/* Only need to do the expensive mfmsr() on radix */
-	if (kvm_is_radix(vcpu->kvm) && (mfmsr() & MSR_IR))
-		r = powernv_get_random_long(&vcpu->arch.regs.gpr[4]);
-	else
-		r = powernv_get_random_real_mode(&vcpu->arch.regs.gpr[4]);
-	if (r)
+	if (powernv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
 		return H_SUCCESS;
 
 	return H_HARDWARE;
@@ -541,22 +519,13 @@ static long kvmppc_read_one_intr(bool *again)
 }
 
 #ifdef CONFIG_KVM_XICS
-static inline bool is_rm(void)
-{
-	return !(mfmsr() & MSR_DR);
-}
-
 unsigned long kvmppc_rm_h_xirr(struct kvm_vcpu *vcpu)
 {
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_xirr(vcpu);
-		if (unlikely(!__xive_vm_h_xirr))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_xirr(vcpu);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_xirr(vcpu);
+	else
 		return xics_rm_h_xirr(vcpu);
 }
 
@@ -565,13 +534,9 @@ unsigned long kvmppc_rm_h_xirr_x(struct kvm_vcpu *vcpu)
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
 	vcpu->arch.regs.gpr[5] = get_tb();
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_xirr(vcpu);
-		if (unlikely(!__xive_vm_h_xirr))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_xirr(vcpu);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_xirr(vcpu);
+	else
 		return xics_rm_h_xirr(vcpu);
 }
 
@@ -579,13 +544,9 @@ unsigned long kvmppc_rm_h_ipoll(struct kvm_vcpu *vcpu, unsigned long server)
 {
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_ipoll(vcpu, server);
-		if (unlikely(!__xive_vm_h_ipoll))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_ipoll(vcpu, server);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_ipoll(vcpu, server);
+	else
 		return H_TOO_HARD;
 }
 
@@ -594,13 +555,9 @@ int kvmppc_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
 {
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_ipi(vcpu, server, mfrr);
-		if (unlikely(!__xive_vm_h_ipi))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_ipi(vcpu, server, mfrr);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_ipi(vcpu, server, mfrr);
+	else
 		return xics_rm_h_ipi(vcpu, server, mfrr);
 }
 
@@ -608,13 +565,9 @@ int kvmppc_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr)
 {
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_cppr(vcpu, cppr);
-		if (unlikely(!__xive_vm_h_cppr))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_cppr(vcpu, cppr);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_cppr(vcpu, cppr);
+	else
 		return xics_rm_h_cppr(vcpu, cppr);
 }
 
@@ -622,13 +575,9 @@ int kvmppc_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr)
 {
 	if (!kvmppc_xics_enabled(vcpu))
 		return H_TOO_HARD;
-	if (xics_on_xive()) {
-		if (is_rm())
-			return xive_rm_h_eoi(vcpu, xirr);
-		if (unlikely(!__xive_vm_h_eoi))
-			return H_NOT_AVAILABLE;
-		return __xive_vm_h_eoi(vcpu, xirr);
-	} else
+	if (xics_on_xive())
+		return xive_rm_h_eoi(vcpu, xirr);
+	else
 		return xics_rm_h_eoi(vcpu, xirr);
 }
 #endif /* CONFIG_KVM_XICS */
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index bf441b9b03cb..33aa0ef496e5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2306,7 +2306,7 @@ hcall_real_table:
 #else
 	.long	0		/* 0x2fc - H_XIRR_X*/
 #endif
-	.long	DOTSYM(kvmppc_h_random) - hcall_real_table
+	.long	DOTSYM(kvmppc_rm_h_random) - hcall_real_table
 	.globl	hcall_real_table_end
 hcall_real_table_end:
 
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 24c07094651a..9268d386b128 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2352,21 +2352,3 @@ struct kvm_device_ops kvm_xive_ops = {
 	.get_attr = xive_get_attr,
 	.has_attr = xive_has_attr,
 };
-
-void kvmppc_xive_init_module(void)
-{
-	__xive_vm_h_xirr = xive_vm_h_xirr;
-	__xive_vm_h_ipoll = xive_vm_h_ipoll;
-	__xive_vm_h_ipi = xive_vm_h_ipi;
-	__xive_vm_h_cppr = xive_vm_h_cppr;
-	__xive_vm_h_eoi = xive_vm_h_eoi;
-}
-
-void kvmppc_xive_exit_module(void)
-{
-	__xive_vm_h_xirr = NULL;
-	__xive_vm_h_ipoll = NULL;
-	__xive_vm_h_ipi = NULL;
-	__xive_vm_h_cppr = NULL;
-	__xive_vm_h_eoi = NULL;
-}
diff --git a/arch/powerpc/kvm/book3s_xive.h b/arch/powerpc/kvm/book3s_xive.h
index 86c24a4ad809..afe9eeac6d56 100644
--- a/arch/powerpc/kvm/book3s_xive.h
+++ b/arch/powerpc/kvm/book3s_xive.h
@@ -289,13 +289,6 @@ extern int xive_rm_h_ipi(struct kvm_vcpu *vcpu, unsigned long server,
 extern int xive_rm_h_cppr(struct kvm_vcpu *vcpu, unsigned long cppr);
 extern int xive_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned long xirr);
 
-extern unsigned long (*__xive_vm_h_xirr)(struct kvm_vcpu *vcpu);
-extern unsigned long (*__xive_vm_h_ipoll)(struct kvm_vcpu *vcpu, unsigned long server);
-extern int (*__xive_vm_h_ipi)(struct kvm_vcpu *vcpu, unsigned long server,
-			      unsigned long mfrr);
-extern int (*__xive_vm_h_cppr)(struct kvm_vcpu *vcpu, unsigned long cppr);
-extern int (*__xive_vm_h_eoi)(struct kvm_vcpu *vcpu, unsigned long xirr);
-
 /*
  * Common Xive routines for XICS-over-XIVE and XIVE native
  */
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 76800c84f2a3..1253666dd4d8 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1281,13 +1281,3 @@ struct kvm_device_ops kvm_xive_native_ops = {
 	.has_attr = kvmppc_xive_native_has_attr,
 	.mmap = kvmppc_xive_native_mmap,
 };
-
-void kvmppc_xive_native_init_module(void)
-{
-	;
-}
-
-void kvmppc_xive_native_exit_module(void)
-{
-	;
-}
-- 
2.23.0

