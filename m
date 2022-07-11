Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A987570E40
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 01:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhg4C3TQTz2x9J
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 09:26:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mnUcCLUJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=g9ii=xq=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=mnUcCLUJ;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lhg305f4Hz302d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 09:25:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B231CB81600;
	Mon, 11 Jul 2022 23:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C18C34115;
	Mon, 11 Jul 2022 23:24:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mnUcCLUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657581895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrOpforVXGqXdDuApOA09f9VsFOGsKzOVqJxaxBuQ0E=;
	b=mnUcCLUJd3FuXpZumSt+NpH7Kl5hTyKonZoQZRR2ROkXcQynaHkPSXDbo1k6PQUytc4rnp
	ZK5AstuaLIrnH+ti3HvpZdj2jihAmfaqR3IfiObfeeuNCGcEKknr6z4eNihw7O1FngCqsg
	B8YTafd/f785i6OTzsbcNPagFHtd3Pw=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52fbda0e (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Mon, 11 Jul 2022 23:24:55 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au,
	sachinp@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] powerpc/powernv: rename remaining rng powernv_ functions to pnv_
Date: Tue, 12 Jul 2022 01:24:47 +0200
Message-Id: <20220711232448.136765-2-Jason@zx2c4.com>
In-Reply-To: <20220711232448.136765-1-Jason@zx2c4.com>
References: <20220711232448.136765-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The preferred nomenclature is pnv_, not powernv_, but rng.c used
powernv_ for some reason, which isn't consistent with the rest. A recent
commit added a few pnv_ functions to rng.c, making the file a bit of a
mishmash. This commit just replaces the rest of them.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: f3eac426657 ("powerpc/powernv: wire up rng during setup_arch")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/include/asm/archrandom.h | 10 +++---
 arch/powerpc/kvm/book3s_hv_builtin.c  |  4 +--
 arch/powerpc/platforms/powernv/rng.c  | 44 +++++++++++++--------------
 drivers/char/hw_random/powernv-rng.c  |  2 +-
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 9a53e29680f4..11d4815841ab 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -38,12 +38,12 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 #endif /* CONFIG_ARCH_RANDOM */
 
 #ifdef CONFIG_PPC_POWERNV
-int powernv_hwrng_present(void);
-int powernv_get_random_long(unsigned long *v);
-int powernv_get_random_real_mode(unsigned long *v);
+int pnv_hwrng_present(void);
+int pnv_get_random_long(unsigned long *v);
+int pnv_get_random_real_mode(unsigned long *v);
 #else
-static inline int powernv_hwrng_present(void) { return 0; }
-static inline int powernv_get_random_real_mode(unsigned long *v) { return 0; }
+static inline int pnv_hwrng_present(void) { return 0; }
+static inline int pnv_get_random_real_mode(unsigned long *v) { return 0; }
 #endif
 
 #endif /* _ASM_POWERPC_ARCHRANDOM_H */
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 88a8f6473c4e..799d40c2ab4f 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -176,13 +176,13 @@ EXPORT_SYMBOL_GPL(kvmppc_hcall_impl_hv_realmode);
 
 int kvmppc_hwrng_present(void)
 {
-	return powernv_hwrng_present();
+	return pnv_hwrng_present();
 }
 EXPORT_SYMBOL_GPL(kvmppc_hwrng_present);
 
 long kvmppc_rm_h_random(struct kvm_vcpu *vcpu)
 {
-	if (powernv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
+	if (pnv_get_random_real_mode(&vcpu->arch.regs.gpr[4]))
 		return H_SUCCESS;
 
 	return H_HARDWARE;
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 3805ad13b8f3..b5cd82eab9b3 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -21,24 +21,24 @@
 
 #define DARN_ERR 0xFFFFFFFFFFFFFFFFul
 
-struct powernv_rng {
+struct pnv_rng {
 	void __iomem *regs;
 	void __iomem *regs_real;
 	unsigned long mask;
 };
 
-static DEFINE_PER_CPU(struct powernv_rng *, powernv_rng);
+static DEFINE_PER_CPU(struct pnv_rng *, pnv_rng);
 
-int powernv_hwrng_present(void)
+int pnv_hwrng_present(void)
 {
-	struct powernv_rng *rng;
+	struct pnv_rng *rng;
 
-	rng = get_cpu_var(powernv_rng);
+	rng = get_cpu_var(pnv_rng);
 	put_cpu_var(rng);
 	return rng != NULL;
 }
 
-static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
+static unsigned long rng_whiten(struct pnv_rng *rng, unsigned long val)
 {
 	unsigned long parity;
 
@@ -58,18 +58,18 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
 	return val;
 }
 
-int powernv_get_random_real_mode(unsigned long *v)
+int pnv_get_random_real_mode(unsigned long *v)
 {
-	struct powernv_rng *rng;
+	struct pnv_rng *rng;
 
-	rng = raw_cpu_read(powernv_rng);
+	rng = raw_cpu_read(pnv_rng);
 
 	*v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));
 
 	return 1;
 }
 
-static int powernv_get_random_darn(unsigned long *v)
+static int pnv_get_random_darn(unsigned long *v)
 {
 	unsigned long val;
 
@@ -93,19 +93,19 @@ static int __init initialise_darn(void)
 		return -ENODEV;
 
 	for (i = 0; i < 10; i++) {
-		if (powernv_get_random_darn(&val)) {
-			ppc_md.get_random_seed = powernv_get_random_darn;
+		if (pnv_get_random_darn(&val)) {
+			ppc_md.get_random_seed = pnv_get_random_darn;
 			return 0;
 		}
 	}
 	return -EIO;
 }
 
-int powernv_get_random_long(unsigned long *v)
+int pnv_get_random_long(unsigned long *v)
 {
-	struct powernv_rng *rng;
+	struct pnv_rng *rng;
 
-	rng = get_cpu_var(powernv_rng);
+	rng = get_cpu_var(pnv_rng);
 
 	*v = rng_whiten(rng, in_be64(rng->regs));
 
@@ -113,9 +113,9 @@ int powernv_get_random_long(unsigned long *v)
 
 	return 1;
 }
-EXPORT_SYMBOL_GPL(powernv_get_random_long);
+EXPORT_SYMBOL_GPL(pnv_get_random_long);
 
-static __init void rng_init_per_cpu(struct powernv_rng *rng,
+static __init void rng_init_per_cpu(struct pnv_rng *rng,
 				    struct device_node *dn)
 {
 	int chip_id, cpu;
@@ -125,16 +125,16 @@ static __init void rng_init_per_cpu(struct powernv_rng *rng,
 		pr_warn("No ibm,chip-id found for %pOF.\n", dn);
 
 	for_each_possible_cpu(cpu) {
-		if (per_cpu(powernv_rng, cpu) == NULL ||
+		if (per_cpu(pnv_rng, cpu) == NULL ||
 		    cpu_to_chip_id(cpu) == chip_id) {
-			per_cpu(powernv_rng, cpu) = rng;
+			per_cpu(pnv_rng, cpu) = rng;
 		}
 	}
 }
 
 static __init int rng_create(struct device_node *dn)
 {
-	struct powernv_rng *rng;
+	struct pnv_rng *rng;
 	struct resource res;
 	unsigned long val;
 
@@ -160,7 +160,7 @@ static __init int rng_create(struct device_node *dn)
 
 	rng_init_per_cpu(rng, dn);
 
-	ppc_md.get_random_seed = powernv_get_random_long;
+	ppc_md.get_random_seed = pnv_get_random_long;
 
 	return 0;
 }
@@ -208,7 +208,7 @@ static int __init pnv_rng_late_init(void)
 	if (ppc_md.get_random_seed == pnv_get_random_long_early)
 		pnv_get_random_long_early(&v);
 
-	if (ppc_md.get_random_seed == powernv_get_random_long) {
+	if (ppc_md.get_random_seed == pnv_get_random_long) {
 		for_each_compatible_node(dn, NULL, "ibm,power-rng")
 			of_platform_device_create(dn, NULL, NULL);
 	}
diff --git a/drivers/char/hw_random/powernv-rng.c b/drivers/char/hw_random/powernv-rng.c
index 8da1d7917bdc..429e956f34e1 100644
--- a/drivers/char/hw_random/powernv-rng.c
+++ b/drivers/char/hw_random/powernv-rng.c
@@ -23,7 +23,7 @@ static int powernv_rng_read(struct hwrng *rng, void *data, size_t max, bool wait
 	buf = (unsigned long *)data;
 
 	for (i = 0; i < len; i++)
-		powernv_get_random_long(buf++);
+		pnv_get_random_long(buf++);
 
 	return len * sizeof(unsigned long);
 }
-- 
2.35.1

