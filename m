Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACCE5828BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 16:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtGTr2tFJz3dp0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 00:33:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=juVUzOv+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtGTD3YyNz3c1S
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 00:32:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=juVUzOv+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LtGTD2R7Bz4x1c;
	Thu, 28 Jul 2022 00:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658932352;
	bh=I2mKUA0vOGHWorVUydXGgk+U/Smu/9jI++++jKEemdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=juVUzOv+5nAU24pzuM5jAuYJNB9gr+Rh1ZbDQXIecpqrmzFvGhYo2yda160BlV0ji
	 R7TfIY/GPI2cox4fH/r3/O+DDd1HfPO1GjTfzPubvY8iJ3ET0NVWfYsGwfZaPr/yq3
	 txqmJ/gyXH+t7XzNUoKpW1M9KthQnVyql4tJwXlPE4o0ECFaJHI+CzZ196N0eStNlH
	 bK3ON4rqNh4sxqpYGEs+G246wUM4OaJJIxhumJTWckoK//G7fSCTaXGQoKtIgfDK+n
	 Oh0LRVqhEviAH5tovAzWMlIMjpesw6bVhcigLsopdQGufmJzpJSB3OmV6hj/Ksv72z
	 luBaSr4bt67iw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v6 3/3] powerpc/powernv: rename remaining rng powernv_ functions to pnv_
Date: Thu, 28 Jul 2022 00:32:19 +1000
Message-Id: <20220727143219.2684192-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220727143219.2684192-1-mpe@ellerman.id.au>
References: <20220727143219.2684192-1-mpe@ellerman.id.au>
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
Cc: Jason@zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

The preferred nomenclature is pnv_, not powernv_, but rng.c used
powernv_ for some reason, which isn't consistent with the rest. A recent
commit added a few pnv_ functions to rng.c, making the file a bit of a
mishmash. This commit just replaces the rest of them.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>
Fixes: f3eac426657d ("powerpc/powernv: wire up rng during setup_arch")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[mpe: Reorder after bug fix commits]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/archrandom.h |  2 +-
 arch/powerpc/platforms/powernv/rng.c  | 34 +++++++++++++--------------
 drivers/char/hw_random/powernv-rng.c  |  2 +-
 3 files changed, 19 insertions(+), 19 deletions(-)

v6: Reorderd after previous two fix commits.

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 258174304904..3af27bb84a3d 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -38,7 +38,7 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 #endif /* CONFIG_ARCH_RANDOM */
 
 #ifdef CONFIG_PPC_POWERNV
-int powernv_get_random_long(unsigned long *v);
+int pnv_get_random_long(unsigned long *v);
 #endif
 
 #endif /* _ASM_POWERPC_ARCHRANDOM_H */
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index d19305292e1e..196aa70fe043 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -21,15 +21,15 @@
 
 #define DARN_ERR 0xFFFFFFFFFFFFFFFFul
 
-struct powernv_rng {
+struct pnv_rng {
 	void __iomem *regs;
 	void __iomem *regs_real;
 	unsigned long mask;
 };
 
-static DEFINE_PER_CPU(struct powernv_rng *, powernv_rng);
+static DEFINE_PER_CPU(struct pnv_rng *, pnv_rng);
 
-static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
+static unsigned long rng_whiten(struct pnv_rng *rng, unsigned long val)
 {
 	unsigned long parity;
 
@@ -49,7 +49,7 @@ static unsigned long rng_whiten(struct powernv_rng *rng, unsigned long val)
 	return val;
 }
 
-static int powernv_get_random_darn(unsigned long *v)
+static int pnv_get_random_darn(unsigned long *v)
 {
 	unsigned long val;
 
@@ -73,31 +73,31 @@ static int __init initialise_darn(void)
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
 
 	if (mfmsr() & MSR_DR) {
-		rng = get_cpu_var(powernv_rng);
+		rng = get_cpu_var(pnv_rng);
 		*v = rng_whiten(rng, in_be64(rng->regs));
 		put_cpu_var(rng);
 	} else {
-		rng = raw_cpu_read(powernv_rng);
+		rng = raw_cpu_read(pnv_rng);
 		*v = rng_whiten(rng, __raw_rm_readq(rng->regs_real));
 	}
 	return 1;
 }
-EXPORT_SYMBOL_GPL(powernv_get_random_long);
+EXPORT_SYMBOL_GPL(pnv_get_random_long);
 
-static __init void rng_init_per_cpu(struct powernv_rng *rng,
+static __init void rng_init_per_cpu(struct pnv_rng *rng,
 				    struct device_node *dn)
 {
 	int chip_id, cpu;
@@ -107,16 +107,16 @@ static __init void rng_init_per_cpu(struct powernv_rng *rng,
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
 
@@ -142,7 +142,7 @@ static __init int rng_create(struct device_node *dn)
 
 	rng_init_per_cpu(rng, dn);
 
-	ppc_md.get_random_seed = powernv_get_random_long;
+	ppc_md.get_random_seed = pnv_get_random_long;
 
 	return 0;
 }
@@ -190,7 +190,7 @@ static int __init pnv_rng_late_init(void)
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
2.35.3

