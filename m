Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44672498071
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 14:06:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj9Gx1VwQz3bVK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 00:06:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=K+B0BTsG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj9GD3BDmz301M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 00:05:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=K+B0BTsG; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Jj9GC5G7Tz4xNp;
 Tue, 25 Jan 2022 00:05:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1643029555;
 bh=7t1rm9GlFa473mv84fh1ElmnLncO0BXgnKQiLIDafkE=;
 h=From:To:Cc:Subject:Date:From;
 b=K+B0BTsGAeyfVExzLN+2cePyZpuzQtlvfjabGR/pTi+Il4oHXTuirLjY9ReEpztPy
 c9AqZhfK/8wJkTnQ0kRsCwGMZCwVZOx6On9QzbRj58tE724xHsTW/Juj/EGzA4fU19
 y/WAOt0pLvSKTFZz6vg/hbD3IYdVI1PR5Z9WOYoiqmPy9Jubgj20vtZ+SlvVI4UMX6
 ZdNOHc0FecUCrvaGBAzMGXoqz1eG4UGdG/Vdu3xifcw4wxgjpvCQOnumKTy4de7mi9
 ZcrGxrtT0y50g5rts/HgODX6zNqBMGjzVGuApsV+iyySH7OzzXkgXxtmnYbqSmAGpZ
 xsJYgHQ04Q31Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Move paca allocation later in boot
Date: Tue, 25 Jan 2022 00:05:44 +1100
Message-Id: <20220124130544.408675-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
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
Cc: mahesh@linux.ibm.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh & Sourabh identified two problems[1][2] with ppc64_bolted_size()
and paca allocation.

The first is that on a Radix capable machine but with "disable_radix" on
the command line, there is a window during early boot where
early_radix_enabled() is true, even though it will later become false.

  early_init_devtree:                       <- early_radix_enabled() = false
    early_init_dt_scan_cpus:                <- early_radix_enabled() = false
        ...
        check_cpu_pa_features:              <- early_radix_enabled() = false
        ...                               ^ <- early_radix_enabled() = TRUE
        allocate_paca:                    | <- early_radix_enabled() = TRUE
            ...                           |
            ppc64_bolted_size:            | <- early_radix_enabled() = TRUE
                if (early_radix_enabled())| <- early_radix_enabled() = TRUE
                    return ULONG_MAX;     |
        ...                               |
    ...                                   | <- early_radix_enabled() = TRUE
    ...                                   | <- early_radix_enabled() = TRUE
    mmu_early_init_devtree()              V
    ...                                     <- early_radix_enabled() = false

This causes ppc64_bolted_size() to return ULONG_MAX for the boot CPU's
paca allocation, even though later it will return a different value.
This is not currently a bug because the paca allocation is also limited
by the RMA size, but that is very fragile.

The second issue is that when using the Hash MMU, when we call
ppc64_bolted_size() for the boot CPU's paca allocation, we have not yet
detected whether 1T segments are available. That causes
ppc64_bolted_size() to return 256MB, even if the machine can actually
support up to 1T. This is usually OK, we generally have space below
256MB for one paca, but for a kdump kernel placed above 256MB it causes
the boot to fail.

At boot we cannot discover all the features of the machine
instantaneously, so there will always be some periods where we have
incomplete knowledge of the system. However both the above problems stem
from the fact that we allocate the boot CPU's paca (and paca pointers
array) before we decide which MMU we are using, or discover its exact
features.

Moving the paca allocation slightly later still can solve both the
issues described above, and means for a normal boot we don't do any
permanent allocations until after we've discovered the MMU.

Note that although we move the boot CPU's paca allocation later, we
still have a temporary paca (boot_paca) accessible via r13, so code that
does read only access to paca fields is safe. The only risk is that some
code writes to the boot_paca, and that write will then be lost when we
switch away from the boot_paca later in early_setup().

The additional code that runs before the paca allocation is primarily
mmu_early_init_devtree(), which is scanning the device tree and
populating globals and cur_cpu_spec with MMU related flags. I do not see
any additional code that writes to paca fields.

[1]: https://lore.kernel.org/r/20211018084434.217772-2-sourabhjain@linux.ibm.com
[2]: https://lore.kernel.org/r/20211018084434.217772-3-sourabhjain@linux.ibm.com

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 3d30d40a0e9c..86c4f009563d 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -352,6 +352,9 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
 
+	// Pass the boot CPU's hard CPU id back to our caller
+	*((u32 *)data) = be32_to_cpu(intserv[found_thread]);
+
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
 	 * meet various levels of the architecture:
@@ -388,9 +391,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 		cur_cpu_spec->cpu_features &= ~CPU_FTR_SMT;
 	else if (!dt_cpu_ftrs_in_use())
 		cur_cpu_spec->cpu_features |= CPU_FTR_SMT;
-	allocate_paca(boot_cpuid);
 #endif
-	set_hard_smp_processor_id(found, be32_to_cpu(intserv[found_thread]));
 
 	return 0;
 }
@@ -714,6 +715,7 @@ static inline void save_fscr_to_task(void) {}
 
 void __init early_init_devtree(void *params)
 {
+	u32 boot_cpu_hwid;
 	phys_addr_t limit;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
@@ -790,8 +792,6 @@ void __init early_init_devtree(void *params)
 	 * FIXME .. and the initrd too? */
 	move_device_tree();
 
-	allocate_paca_ptrs();
-
 	DBG("Scanning CPUs ...\n");
 
 	dt_cpu_ftrs_scan();
@@ -799,7 +799,7 @@ void __init early_init_devtree(void *params)
 	/* Retrieve CPU related informations from the flat tree
 	 * (altivec support, boot CPU ID, ...)
 	 */
-	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
+	of_scan_flat_dt(early_init_dt_scan_cpus, &boot_cpu_hwid);
 	if (boot_cpuid < 0) {
 		printk("Failed to identify boot CPU !\n");
 		BUG();
@@ -816,6 +816,11 @@ void __init early_init_devtree(void *params)
 
 	mmu_early_init_devtree();
 
+	// NB. paca is not installed until later in early_setup()
+	allocate_paca_ptrs();
+	allocate_paca(boot_cpuid);
+	set_hard_smp_processor_id(boot_cpuid, boot_cpu_hwid);
+
 #ifdef CONFIG_PPC_POWERNV
 	/* Scan and build the list of machine check recoverable ranges */
 	of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
-- 
2.31.1

