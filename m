Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDED64EB24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:03:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYSRF50bSz3fCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:03:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZE0/7go;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aZE0/7go;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSMR2Z24z3bct
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 22:59:47 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso8302228pjb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B1I8l1tea8GLuvshZ0T9XI8KL6wiYwGl97FyXz35Gw=;
        b=aZE0/7goOYTyGcNSsBWvu4mtlU4+e4LMeD9TzrwEd92AuOpj/GUMdh14DmDGipxHdH
         vPN+BYRgSvH/1wNi9Ni8VMyigALcyzAxZCBOQgyVTwK1uAM+yZ/mxvFDxskIz7HbpW3U
         OQPLC/4wGOlfzrAliUct4FuCEiOMLbYpbrTcwWgzTibTWdVCXNYMyg6AsC1k/zduLVSW
         glyIapzBqsHyqiZYW4bk2ZokvkJu2/6cyYK9HlOp2Dt1OyoI9OKSpoBcQuUg5EIsl3CP
         OGXWQ7RZ1vXQP+W3FSCtvQoTRDl8NqUd7FS8OTQO0bdZ6D1RdHfjT9O3WtKTtILajeNo
         071Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7B1I8l1tea8GLuvshZ0T9XI8KL6wiYwGl97FyXz35Gw=;
        b=TocBC7w1MlkjBltEIGH5SBg0Uo5jU7jXgBoM9dY+qwu1RB1pz7/rmH8Tbx54SqBMvZ
         dAG937f82kgDzhXRkOd/2+1mBT8HdBw2lwl3mtmTbIv7lLm8xA43R9wHIt8b/62sbhyS
         S3hSrV9GR75SzokSQC7VNTgMhrVlQDrfHaQcYoc3Y/mKL9teFVldADSRn3FbCDref1KN
         7lP5KCNhRgQkx7FiuMo8TzyJZ1AB5wscPUJmxK4reogaVrRF7iPObOgQVIZugFpptd4y
         aThz1j08HKFVrDqiXnBdSfRwnFyW1f0M8IBx3a3uz+PJOZF/spDDz8K87+f1ZaVfyj1z
         x05g==
X-Gm-Message-State: ANoB5plBPJqm9ZfrqlaFORxgFDWgQ+emhBZtixGX4W/aRHALCkUs55sY
	XhVZPVouWYLv8q5HNE8tAM48umLXHia68w==
X-Google-Smtp-Source: AA0mqf6zko5zeLqGOMxIiT+6qXjM+RzLRTsM2TarxUvb90SSMpYfOrOeo78ruuDw4ZFWeDuRd7Pu6Q==
X-Received: by 2002:a05:6a21:9103:b0:a5:35f1:95d1 with SMTP id tn3-20020a056a21910300b000a535f195d1mr36691354pzb.35.1671191984008;
        Fri, 16 Dec 2022 03:59:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-236-36.tpgi.com.au. [115.64.236.36])
        by smtp.gmail.com with ESMTPSA id g22-20020a625216000000b0057ef155103asm1289438pfb.155.2022.12.16.03.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 03:59:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/64: Move paca allocation to early_setup()
Date: Fri, 16 Dec 2022 21:59:29 +1000
Message-Id: <20221216115930.2667772-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216115930.2667772-1-npiggin@gmail.com>
References: <20221216115930.2667772-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
---
 arch/powerpc/include/asm/paca.h    |  1 -
 arch/powerpc/include/asm/smp.h     |  1 +
 arch/powerpc/kernel/prom.c         | 12 ++----------
 arch/powerpc/kernel/setup-common.c |  4 ++++
 arch/powerpc/kernel/setup_64.c     | 11 +++++------
 5 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 09f1790d0ae1..0ab3511a47d7 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -295,7 +295,6 @@ extern void free_unused_pacas(void);
 
 #else /* CONFIG_PPC64 */
 
-static inline void allocate_paca_ptrs(void) { }
 static inline void allocate_paca(int cpu) { }
 static inline void free_unused_pacas(void) { }
 
diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
index f63505d74932..6c6cb53d7045 100644
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
index 4f1c920aa13e..b3aa6df872a5 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -369,9 +369,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	DBG("boot cpu: logical %d physical %d\n", found,
 	    be32_to_cpu(intserv[found_thread]));
 	boot_cpuid = found;
-
-	// Pass the boot CPU's hard CPU id back to our caller
-	*((u32 *)data) = be32_to_cpu(intserv[found_thread]);
+	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
 
 	/*
 	 * PAPR defines "logical" PVR values for cpus that
@@ -755,7 +753,6 @@ static inline void save_fscr_to_task(void) {}
 
 void __init early_init_devtree(void *params)
 {
-	u32 boot_cpu_hwid;
 	phys_addr_t limit;
 
 	DBG(" -> early_init_devtree(%px)\n", params);
@@ -851,7 +848,7 @@ void __init early_init_devtree(void *params)
 	/* Retrieve CPU related informations from the flat tree
 	 * (altivec support, boot CPU ID, ...)
 	 */
-	of_scan_flat_dt(early_init_dt_scan_cpus, &boot_cpu_hwid);
+	of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
 	if (boot_cpuid < 0) {
 		printk("Failed to identify boot CPU !\n");
 		BUG();
@@ -868,11 +865,6 @@ void __init early_init_devtree(void *params)
 
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
index 6d041993a45d..efb301a4987c 100644
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
index e6c8d1e326f7..78d8a105764b 100644
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
2.37.2

