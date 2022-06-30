Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84365561CAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 16:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYg5X3Q4yz3dqb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 00:02:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=g5Mgw2a3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=bce9=xf=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=g5Mgw2a3;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYg3k1vFBz3bc9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 00:01:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CFA8EB82AF3;
	Thu, 30 Jun 2022 14:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE85C34115;
	Thu, 30 Jun 2022 14:01:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="g5Mgw2a3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1656597678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uZdyHA6eQ+MUdW3aXxGbaOtskaVoXz1M9yYVxlwzRSM=;
	b=g5Mgw2a3L81HgacYfDmcbS71T7X+CPG5nbR75F6YrA8fwIiERRclLdjKV/kAEHxwn3QC5V
	t91IsvQtOUs+khu+PPx+BmM1I7yHlzcxR02m9SywwzJ6EP44hlDriYV6VEVMFE9hdA4sAN
	DKHP45dIbcArW2ynhlttajJhuyw1xX8=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17439ad5 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Thu, 30 Jun 2022 14:01:18 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	sachinp@linux.ibm.com
Subject: [PATCH v3 2/2] powerpc/kvm: don't crash on missing rng, and use darn
Date: Thu, 30 Jun 2022 16:01:08 +0200
Message-Id: <20220630140108.129434-3-Jason@zx2c4.com>
In-Reply-To: <20220630140108.129434-1-Jason@zx2c4.com>
References: <20220630140108.129434-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER8 systems that don't have ibm,power-rng available, a guest that
ignores the KVM_CAP_PPC_HWRNG flag and calls H_RANDOM anyway will
dereference a NULL pointer. And on machines with darn instead of
ibm,power-rng, H_RANDOM won't work at all.

This patch kills two birds with one stone, by routing H_RANDOM calls to
ppc_md.get_random_seed, and doing the real mode check inside of it.

Cc: stable@vger.kernel.org # v4.1+
Cc: Michael Ellerman <mpe@ellerman.id.au>
Fixes: e928e9cb3601 ("KVM: PPC: Book3S HV: Add fast real-mode H_RANDOM implementation.")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/include/asm/archrandom.h |  5 ----
 arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +++---
 arch/powerpc/platforms/powernv/rng.c  | 33 +++++++--------------------
 3 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 11d4815841ab..3af27bb84a3d 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -38,12 +38,7 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 #endif /* CONFIG_ARCH_RANDOM */
 
 #ifdef CONFIG_PPC_POWERNV
-int pnv_hwrng_present(void);
 int pnv_get_random_long(unsigned long *v);
-int pnv_get_random_real_mode(unsigned long *v);
-#else
-static inline int pnv_hwrng_present(void) { return 0; }
-static inline int pnv_get_random_real_mode(unsigned long *v) { return 0; }
 #endif
 
 #endif /* _ASM_POWERPC_ARCHRANDOM_H */
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 799d40c2ab4f..3abaef5f9ac2 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -19,7 +19,7 @@
 #include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
-#include <asm/archrandom.h>
+#include <asm/machdep.h>
 #include <asm/xics.h>
 #include <asm/xive.h>
 #include <asm/dbell.h>
@@ -176,13 +176,14 @@ EXPORT_SYMBOL_GPL(kvmppc_hcall_impl_hv_realmode);
 
 int kvmppc_hwrng_present(void)
 {
-	return pnv_hwrng_present();
+	return ppc_md.get_random_seed != NULL;
 }
 EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
 
 long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
 {
-	if (pnv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
+	if (ppc_md.get_random_seed &&
+	    ppc_md.get_random_seed(&vcpu->arch.regs.gpr[4]))
 		return H_SUCCESS;
 
 	return H_HARDWARE;
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 386b44660e76..4a48566528c0 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -29,15 +29,6 @@ struct pnv_rng {
 
 static DEFINE_PER_CPU(struct pnv_rng *, pnv_rng);
 
-int pnv_hwrng_present(void)
-{
-	struct pnv_rng *rng;
-
-	rng = get_cpu_var(pnv_rng);
-	put_cpu_var(rng);
-	return rng != NULL;
-}
-
 static unsigned long rng_whiten(struct pnv_rng *rng, unsigned long val)
 {
 	unsigned long parity;
@@ -58,17 +49,6 @@ static unsigned long rng_whiten(struct pnv_rng *rng, unsigned long val)
 	return val;
 }
 
-int pnv_get_random_real_mode(unsigned long *v)
-{
-	struct pnv_rng *rng;
-
-	rng = raw_cpu_read(pnv_rng);
-
-	*v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));
-
-	return 1;
-}
-
 static int pnv_get_random_darn(unsigned long *v)
 {
 	unsigned long val;
@@ -105,11 +85,14 @@ int pnv_get_random_long(unsigned long *v)
 {
 	struct pnv_rng *rng;
 
-	rng = get_cpu_var(pnv_rng);
-
-	*v = rng_whiten(rng, in_be64(rng->regs));
-
-	put_cpu_var(rng);
+	if (mfmsr() & MSR_DR) {
+		rng = raw_cpu_read(pnv_rng);
+		*v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));
+	} else {
+		rng = get_cpu_var(pnv_rng);
+		*v = rng_whiten(rng, in_be64(rng->regs));
+		put_cpu_var(rng);
+	}
 
 	return 1;
 }
-- 
2.35.1

