Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E236AB0D5
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 15:05:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PV3QG10JHz3cjC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 01:05:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GpHSzUaY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GpHSzUaY;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PV38Y64plz3f4n
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 00:53:49 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B39BB80AE2;
	Sun,  5 Mar 2023 13:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53429C433AE;
	Sun,  5 Mar 2023 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678024425;
	bh=DdAZ/iExR7RNVjQ92CeMwcr/sDbWUiYJLpAruXSENDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GpHSzUaYK7kSsLOeuSs1eZPOq2jnXwiYy5KS9sOtKfrvke2uMKKAfQQG5T+5GglMv
	 i08cfUKaVaIsFw1pHhg/EOrtwmUJjKXQ4fmgb4ruUpCkizY2/3/5yHybhvE3BK1iXV
	 Vh/bPhPqY3fkgHqsBAimbu74VXO50ShmGkrA7DgxNuBOYDOz8fiUF7gjIPteIpRkdc
	 eGJY4G7epikQ5uFCSjHbwdthcurgR8fOOTROlueJ0rDS3NDhlZ1WQqNX5gCPfL9N4N
	 SeO/8BLoFipGXUw1v1tzfgAWTooCPqhTe7Q7/8C0TttuEP/r+RZe/Y4zae89BNSCx3
	 wlsZyyzTEmCfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 10/15] powerpc/64: Move paca allocation to early_setup()
Date: Sun,  5 Mar 2023 08:53:01 -0500
Message-Id: <20230305135306.1793564-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305135306.1793564-1-sashal@kernel.org>
References: <20230305135306.1793564-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Jason@zx2c4.com, zhouzhouyi@gmail.com, ruscur@russell.cc, Sasha Levin <sashal@kernel.org>, yuehaibing@huawei.com, laurent.dufour@fr.ibm.com, ganeshgr@linux.ibm.com, dmitry.osipenko@collabora.com, nathanl@linux.ibm.com, pmladek@suse.com, ajd@linux.ibm.com, yury.norov@gmail.com, Nicholas Piggin <npiggin@gmail.com>, mirq-linux@rere.qmqm.pl, haren@linux.ibm.com, dja@axtens.net, farosas@linux.ibm.com, Julia.Lawall@inria.fr, gpiccoli@igalia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit dc222fa7737212fe0da513e5b8937c156d02225d ]

The early paca and boot cpuid dance is complicated and currently does
not quite work as expected for boot cpuid != 0 cases.

early_init_devtree() currently allocates the paca_ptrs and boot cpuid
paca, but until that returns and early_setup() calls setup_paca(), this
thread is currently still executing with smp_processor_id() == 0.

One problem this causes is the paca_ptrs[smp_processor_id()] pointer is
poisoned, so valid_emergency_stack() (any backtrace) and any similar
users will crash.

Another is that the hardware id which is set here will not be returned
by get_hard_smp_processor_id(smp_processor_id()), but it would work
correctly for boot_cpuid == 0, which could lead to difficult to
reproduce or find bugs. The hard id does not seem to be used by the rest
of early_init_devtree(), it just looks like all this code might have
been put here to allocate somewhere to store boot CPU hardware id while
scanning the devtree.

Rearrange things so the hwid is put in a global variable like
boot_cpuid, and do all the paca allocation and boot paca setup in the
64-bit early_setup() after we have everything ready to go.

The paca_ptrs[0] re-poisoning code in early_setup does not seem to have
ever worked, because paca_ptrs[0] was never not-poisoned when boot_cpuid
is not 0.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Fix build error on 32-bit]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20221216115930.2667772-4-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/paca.h    |  1 -
 arch/powerpc/include/asm/smp.h     |  1 +
 arch/powerpc/kernel/prom.c         | 12 +++---------
 arch/powerpc/kernel/setup-common.c |  4 ++++
 arch/powerpc/kernel/setup_64.c     | 11 +++++------
 5 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 09f1790d0ae16..0ab3511a47d77 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -295,7 +295,6 @@ extern void free_unused_pacas(void);
 
 #else /* CONFIG_PPC64 */
 
-static inline void allocate_paca_ptrs(void) { }
 static inline void allocate_paca(int cpu) { }
 static inline void free_unused_pacas(void) { }
 
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index f63505d74932b..6c6cb53d70458 100644
--- a/arch/powerpc/include/asm/smp.h
+++ b/arch/powerpc/include/asm/smp.h
@@ -26,6 +26,7 @@
 #include <asm/percpu.h>
 
 extern int boot_cpuid;
+extern int boot_cpu_hwid; /* PPC64 only */
 extern int spinning_secondaries;
 extern u32 *cpu_to_phys_id;
 extern bool coregroup_enabled;
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1eed87d954ba8..8537c354c560b 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -366,8 +366,8 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
 
-	// Pass the boot CPU's hard CPU id back to our caller
-	*((u32 *)data) = be32_to_cpu(intserv[found_thread]);
+	if (IS_ENABLED(CONFIG_PPC64))
+		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
 
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
@@ -751,7 +751,6 @@ static inline void save_fscr_to_task(void) {}
 
 void __init early_init_devtree(void *params)
 {
-	u32 boot_cpu_hwid;
 	phys_addr_t limit;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
@@ -847,7 +846,7 @@ void __init early_init_devtree(void *params)
 	/* Retrieve CPU related informations from the flat tree
 	 * (altivec support, boot CPU ID, ...)
 	 */
-	of_scan_flat_dt(early_init_dt_scan_cpus, &boot_cpu_hwid);
+	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
 	if (boot_cpuid < 0) {
 		printk("Failed to identify boot CPU !\n");
 		BUG();
@@ -864,11 +863,6 @@ void __init early_init_devtree(void *params)
 
 	mmu_early_init_devtree();
 
-	// NB. paca is not installed until later in early_setup()
-	allocate_paca_ptrs();
-	allocate_paca(boot_cpuid);
-	set_hard_smp_processor_id(boot_cpuid, boot_cpu_hwid);
-
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
 	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 6d041993a45dc..efb301a4987ca 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -86,6 +86,10 @@ EXPORT_SYMBOL(machine_id);
 int boot_cpuid = -1;
 EXPORT_SYMBOL_GPL(boot_cpuid);
 
+#ifdef CONFIG_PPC64
+int boot_cpu_hwid = -1;
+#endif
+
 /*
  * These are used in binfmt_elf.c to put aux entries on the stack
  * for each elf executable being started.
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index a43865e0fb4bf..b2e0d3ce4261c 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -385,15 +385,14 @@ void __init early_setup(unsigned long dt_ptr)
 	/*
 	 * Do early initialization using the flattened device
 	 * tree, such as retrieving the physical memory map or
-	 * calculating/retrieving the hash table size.
+	 * calculating/retrieving the hash table size, discover
+	 * boot_cpuid and boot_cpu_hwid.
 	 */
 	early_init_devtree(__va(dt_ptr));
 
-	/* Now we know the logical id of our boot cpu, setup the paca. */
-	if (boot_cpuid != 0) {
-		/* Poison paca_ptrs[0] again if it's not the boot cpu */
-		memset(&paca_ptrs[0], 0x88, sizeof(paca_ptrs[0]));
-	}
+	allocate_paca_ptrs();
+	allocate_paca(boot_cpuid);
+	set_hard_smp_processor_id(boot_cpuid, boot_cpu_hwid);
 	fixup_boot_paca(paca_ptrs[boot_cpuid]);
 	setup_paca(paca_ptrs[boot_cpuid]); /* install the paca into registers */
 	// smp_processor_id() now reports boot_cpuid
-- 
2.39.2

