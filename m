Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D35472CC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 10:12:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKrCP57tgz3cdb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:12:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=h+8trSs6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=qlft=ws=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=h+8trSs6;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKrBm07dzz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 18:11:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17833B837EF;
	Sat, 11 Jun 2022 08:11:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295ADC34116;
	Sat, 11 Jun 2022 08:11:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h+8trSs6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1654935079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JhE9QV1bIqPw2urSYw+/iYLr0eUuZ5Re2c1gfvfbv5E=;
	b=h+8trSs6BSUBjfcUc3USmvwUUElptBvOObS+NJYTCuXivUasQP+rq7vks3W3Hn/QkQYQxj
	Dq+LADDqdzoRHFjAjJAteEdtOe2CTO3BQ0zBox050twqW6TqN+685aDbZ/EV0GWNBuWvJA
	GZkJalKoSsWBZSz4rXKvAQuT0ZrcSDQ=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88227a06 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Sat, 11 Jun 2022 08:11:19 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/rng: wire up during setup_arch
Date: Sat, 11 Jun 2022 10:11:14 +0200
Message-Id: <20220611081114.449165-1-Jason@zx2c4.com>
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

The platform's RNG must be available before random_init() in order to be
useful for initial seeding, which in turn means that it needs to be
called from setup_arch(), rather than from an init call. Fortunately,
each platform already has a setup_arch function pointer, which means
it's easy to wire this up for each of the three platforms that have an
RNG. This commit also removes some noisy log messages that don't add
much.

Cc: stable@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/platforms/microwatt/rng.c   |  9 ++-------
 arch/powerpc/platforms/microwatt/setup.c |  8 ++++++++
 arch/powerpc/platforms/powernv/rng.c     | 17 ++++-------------
 arch/powerpc/platforms/powernv/setup.c   |  4 ++++
 arch/powerpc/platforms/pseries/rng.c     | 11 ++---------
 arch/powerpc/platforms/pseries/setup.c   |  3 +++
 6 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/platforms/microwatt/rng.c b/arch/powerpc/platforms/microwatt/rng.c
index 7bc4d1cbfaf0..d13f656910ad 100644
--- a/arch/powerpc/platforms/microwatt/rng.c
+++ b/arch/powerpc/platforms/microwatt/rng.c
@@ -29,7 +29,7 @@ static int microwatt_get_random_darn(unsigned long *v)
 	return 1;
 }
 
-static __init int rng_init(void)
+__init void microwatt_rng_init(void)
 {
 	unsigned long val;
 	int i;
@@ -37,12 +37,7 @@ static __init int rng_init(void)
 	for (i = 0; i < 10; i++) {
 		if (microwatt_get_random_darn(&val)) {
 			ppc_md.get_random_seed = microwatt_get_random_darn;
-			return 0;
+			return;
 		}
 	}
-
-	pr_warn("Unable to use DARN for get_random_seed()\n");
-
-	return -EIO;
 }
-machine_subsys_initcall(, rng_init);
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 0b02603bdb74..23c996dcc870 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -32,10 +32,18 @@ static int __init microwatt_populate(void)
 }
 machine_arch_initcall(microwatt, microwatt_populate);
 
+__init void microwatt_rng_init(void);
+
+static void __init microwatt_setup_arch(void)
+{
+	microwatt_rng_init();
+}
+
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.probe			= microwatt_probe,
 	.init_IRQ		= microwatt_init_IRQ,
+	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
 	.calibrate_decr		= generic_calibrate_decr,
 };
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index e3d44b36ae98..ef24e72a1b69 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -84,24 +84,20 @@ static int powernv_get_random_darn(unsigned long *v)
 	return 1;
 }
 
-static int __init initialise_darn(void)
+static void __init initialise_darn(void)
 {
 	unsigned long val;
 	int i;
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
-		return -ENODEV;
+		return;
 
 	for (i = 0; i < 10; i++) {
 		if (powernv_get_random_darn(&val)) {
 			ppc_md.get_random_seed = powernv_get_random_darn;
-			return 0;
+			return;
 		}
 	}
-
-	pr_warn("Unable to use DARN for get_random_seed()\n");
-
-	return -EIO;
 }
 
 int powernv_get_random_long(unsigned long *v)
@@ -163,14 +159,12 @@ static __init int rng_create(struct device_node *dn)
 
 	rng_init_per_cpu(rng, dn);
 
-	pr_info_once("Registering arch random hook.\n");
-
 	ppc_md.get_random_seed = powernv_get_random_long;
 
 	return 0;
 }
 
-static __init int rng_init(void)
+__init void powernv_rng_init(void)
 {
 	struct device_node *dn;
 	int rc;
@@ -188,7 +182,4 @@ static __init int rng_init(void)
 	}
 
 	initialise_darn();
-
-	return 0;
 }
-machine_subsys_initcall(powernv, rng_init);
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 824c3ad7a0fa..a0c5217bc5c0 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -184,6 +184,8 @@ static void __init pnv_check_guarded_cores(void)
 	}
 }
 
+__init void powernv_rng_init(void);
+
 static void __init pnv_setup_arch(void)
 {
 	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
@@ -203,6 +205,8 @@ static void __init pnv_setup_arch(void)
 	pnv_check_guarded_cores();
 
 	/* XXX PMCS */
+
+	powernv_rng_init();
 }
 
 static void __init pnv_init(void)
diff --git a/arch/powerpc/platforms/pseries/rng.c b/arch/powerpc/platforms/pseries/rng.c
index 6268545947b8..d39bfce39aa1 100644
--- a/arch/powerpc/platforms/pseries/rng.c
+++ b/arch/powerpc/platforms/pseries/rng.c
@@ -24,19 +24,12 @@ static int pseries_get_random_long(unsigned long *v)
 	return 0;
 }
 
-static __init int rng_init(void)
+__init void pseries_rng_init(void)
 {
 	struct device_node *dn;
-
 	dn = of_find_compatible_node(NULL, NULL, "ibm,random");
 	if (!dn)
-		return -ENODEV;
-
-	pr_info("Registering arch random hook.\n");
-
+		return;
 	ppc_md.get_random_seed = pseries_get_random_long;
-
 	of_node_put(dn);
-	return 0;
 }
-machine_subsys_initcall(pseries, rng_init);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index afb074269b42..7f3ee2658163 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -779,6 +779,8 @@ static resource_size_t pseries_pci_iov_resource_alignment(struct pci_dev *pdev,
 }
 #endif
 
+__init void pseries_rng_init(void);
+
 static void __init pSeries_setup_arch(void)
 {
 	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
@@ -839,6 +841,7 @@ static void __init pSeries_setup_arch(void)
 	}
 
 	ppc_md.pcibios_root_bridge_prepare = pseries_root_bridge_prepare;
+	pseries_rng_init();
 }
 
 static void pseries_panic(char *str)
-- 
2.35.1

