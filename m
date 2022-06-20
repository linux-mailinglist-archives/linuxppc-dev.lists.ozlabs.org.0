Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A9D55193A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 14:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRTsr4dQDz3cg0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 22:46:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Bd10BB7n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=ylcv=w3=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Bd10BB7n;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRTs852yQz3bkv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 22:45:48 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 84678B8119E;
	Mon, 20 Jun 2022 12:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A902FC3411B;
	Mon, 20 Jun 2022 12:45:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Bd10BB7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1655729140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2IX05eBKqb4vnKKc2MkH1ad0v14O9oH9GsjOTm7oDzk=;
	b=Bd10BB7nPPAr46mIN//9Vx0qcZnResZwi0ahy4t9BLnm/DiUy7ga6Ezgsc/3ObcfPcuN1r
	kbwMaJIoSnEpP7sw5f2xDEBMj1hBx9fTIQnwIoKjIKU7boA5tWYPRiZLn+1zi0kCI3Cox2
	YlV8J5L+NoHiD+1M3ZfIRE/AWb32s30=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 956417d4 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Mon, 20 Jun 2022 12:45:39 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	LKML <linux-kernel@vger.kernel.org>,
	stable <stable@vger.kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4] powerpc/powernv: wire up rng during setup_arch
Date: Mon, 20 Jun 2022 14:45:31 +0200
Message-Id: <20220620124531.78075-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9rWkvDDYHPi-TJR-ATts6pLPY6D8LUaYDJ-=7w7qsFCvg@mail.gmail.com>
References: <CAHmME9rWkvDDYHPi-TJR-ATts6pLPY6D8LUaYDJ-=7w7qsFCvg@mail.gmail.com>
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

The platform's RNG must be available before random_init() in order to be
useful for initial seeding, which in turn means that it needs to be
called from setup_arch(), rather than from an init call. Fortunately,
each platform already has a setup_arch function pointer, which means we
can wire it up that way. Complicating things, however, is that POWER8
systems need some per-cpu state and kmalloc, which isn't available at
this stage. So we split things into an early phase and a late phase,
with the early phase working well enough to seed the RNG with a
spinlock, before later getting fast per-cpu allocations. This commit
also removes some noisy log messages that don't add much.

Cc: stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: a4da0d50b2a0 ("powerpc: Implement arch_get_random_long/int() for powernv")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/platforms/powernv/powernv.h |  2 +
 arch/powerpc/platforms/powernv/rng.c     | 68 ++++++++++++++++++------
 arch/powerpc/platforms/powernv/setup.c   |  2 +
 3 files changed, 55 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/powernv.h b/arch/powerpc/platforms/powernv/powernv.h
index e297bf4abfcb..fd3f5e1eb10b 100644
--- a/arch/powerpc/platforms/powernv/powernv.h
+++ b/arch/powerpc/platforms/powernv/powernv.h
@@ -42,4 +42,6 @@ ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos, size_t count);
 u32 __init memcons_get_size(struct memcons *mc);
 struct memcons *__init memcons_init(struct device_node *node, const char *mc_prop_name);
 
+void powernv_rng_init(void);
+
 #endif /* _POWERNV_H */
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index e3d44b36ae98..c1beced9c32c 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -17,6 +17,7 @@
 #include <asm/prom.h>
 #include <asm/machdep.h>
 #include <asm/smp.h>
+#include "powernv.h"
 
 #define DARN_ERR 0xFFFFFFFFFFFFFFFFul
 
@@ -28,6 +29,12 @@ struct powernv_rng {
 
 static DEFINE_PER_CPU(struct powernv_rng *, powernv_rng);
 
+static struct {
+	struct powernv_rng rng;
+	spinlock_t lock;
+} early_state __initdata = {
+	.lock = __SPIN_LOCK_UNLOCKED(powernv_early_rng)
+};
 
 int powernv_hwrng_present(void)
 {
@@ -84,7 +91,7 @@ static int powernv_get_random_darn(unsigned long *v)
 	return 1;
 }
 
-static int __init initialise_darn(void)
+static int __init initialize_darn(void)
 {
 	unsigned long val;
 	int i;
@@ -98,10 +105,18 @@ static int __init initialise_darn(void)
 			return 0;
 		}
 	}
+	return -EIO;
+}
 
-	pr_warn("Unable to use DARN for get_random_seed()\n");
+static int __init powernv_get_random_long_early(unsigned long *v)
+{
+	unsigned long flags;
 
-	return -EIO;
+	spin_lock_irqsave(&early_state.lock, flags);
+	*v = rng_whiten(&early_state.rng, in_be64(early_state.rng.regs));
+	spin_unlock_irqrestore(&early_state.lock, flags);
+
+	return 1;
 }
 
 int powernv_get_random_long(unsigned long *v)
@@ -163,32 +178,51 @@ static __init int rng_create(struct device_node *dn)
 
 	rng_init_per_cpu(rng, dn);
 
-	pr_info_once("Registering arch random hook.\n");
-
 	ppc_md.get_random_seed = powernv_get_random_long;
 
 	return 0;
 }
 
-static __init int rng_init(void)
+void __init powernv_rng_init(void)
+{
+	struct device_node *dn;
+	struct resource res;
+
+	/* Prefer darn over the rest. */
+	if (!initialize_darn())
+		return;
+
+	dn = of_find_compatible_node(NULL, NULL, "ibm,power-rng");
+	if (!dn)
+		return;
+	if (of_address_to_resource(dn, 0, &res))
+		return;
+	early_state.rng.regs_real = (void __iomem *)res.start;
+	early_state.rng.regs = of_iomap(dn, 0);
+	if (!early_state.rng.regs)
+		return;
+	early_state.rng.mask = in_be64(early_state.rng.regs);
+	ppc_md.get_random_seed = powernv_get_random_long_early;
+}
+
+static __init int powernv_rng_late_init(void)
 {
 	struct device_node *dn;
-	int rc;
+
+	/*
+	 * If this didn't get initialized early on, then we're using darn,
+	 * or this isn't available at all, so return early.
+	 */
+	if (ppc_md.get_random_seed != powernv_get_random_long_early)
+		return 0;
+	ppc_md.get_random_seed = NULL;
 
 	for_each_compatible_node(dn, NULL, "ibm,power-rng") {
-		rc = rng_create(dn);
-		if (rc) {
-			pr_err("Failed creating rng for %pOF (%d).\n",
-				dn, rc);
+		if (rng_create(dn))
 			continue;
-		}
-
 		/* Create devices for hwrng driver */
 		of_platform_device_create(dn, NULL, NULL);
 	}
-
-	initialise_darn();
-
 	return 0;
 }
-machine_subsys_initcall(powernv, rng_init);
+machine_subsys_initcall(powernv, powernv_rng_late_init);
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 824c3ad7a0fa..a5fcb6796b22 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -203,6 +203,8 @@ static void __init pnv_setup_arch(void)
 	pnv_check_guarded_cores();
 
 	/* XXX PMCS */
+
+	powernv_rng_init();
 }
 
 static void __init pnv_init(void)
-- 
2.35.1

