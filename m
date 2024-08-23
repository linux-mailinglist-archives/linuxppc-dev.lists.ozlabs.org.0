Return-Path: <linuxppc-dev+bounces-449-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309095CB42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 13:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqyMJ1dCfz2ytd;
	Fri, 23 Aug 2024 21:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724412108;
	cv=none; b=T2wPVJFdb7QsIUyuDTIXcGrOOJUBQTbMkB3GtW2Xpx+DLaVV7zt9xFWPOONyQ9fvPh86Xz7J5CXTGG94K9eD157U4hYwqmmCzD0KDQK9dHrkAZtwbN9Q+3oLHsJTvGzWKhzZpslOn//yVKGDDIK2JJE7glGPLVPGzM4W4CnYdPto4r1nc/iPrb5JfdCQM+kC/5WyD8QSzpbmO3KIe/Xi/zQZl1rMb+W9vZb8G2adZWPWZPz4HJw6TeYREt3sQkVxgPt2kLDf2vL1B5tEtlRXpOztsjulvmkxf9cwM6e+7onQ+TZdDeZSXw4oePRF0EHf0MfZvGHHzLTBBlVN/bZ6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724412108; c=relaxed/relaxed;
	bh=JYc4GCuZyPyf7PfPpcSclfWVTGCJs/ouUyesFKZf6R8=;
	h=DKIM-Signature:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=FKrFKp1A93Wn+cWyv9bMhQQUBN5xqya9ga4LVOG686CV7XPSiF83A9euf1QWAQM17bT1dsVVmoK3f+m5CAoAYQwdUPzmVsKRSN6ZBw3sbBkIgkBLqcbKyu+cQNDEpB99Bv/gOFKQ23tHt+/+tLzrRoxeVBg3BVgKyINA2xRYkYXXG6ZaBt1n3rUvhyeH84+Ckywdfg1yh3qNN0UHoThC3bxv8U7M2/9Kt38fpB2xJaV4IdMAS5GG6DyCGrZNIPJqBM7CQmNd91HSfVtFyeGBg3IC0hQZ/qyhJrDMVUCBc9Ug5wolljRTXKGn0FNTLt0FYOg+82I3gb25YKeslBg6vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DuatkbCf; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DuatkbCf;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqyMH2S3cz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 21:21:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724412104;
	bh=JYc4GCuZyPyf7PfPpcSclfWVTGCJs/ouUyesFKZf6R8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DuatkbCfYkyfx0qQMRJxyHb5/nSQjCshH2rstjBEw3bbSRthSzbCnMFgI26cm+f/u
	 nm46fhpZDI4yiuMPY/mrT0HOJc94bA+vZA+uVWY6od46MpnGA9AJH5/iBSIeKqyQIW
	 NqHdQ8BKjRqyXsrC7xf884oi/spfvyhW0IpkJbinlMjkATL4ZMnOfEeRVi784GWvLU
	 DFaeY1OzoCrD0nA0GasZmq5epb1cEhSrQxkUzBPusdesC7McbHDZAw6jqcI5yDaSvp
	 79qqJ2cCJY6yjIVbJXev/c0LnqzfrZJBFAi2Ult0faPn4sgcDbd30tLil10Stga4l4
	 jfJlRrJrOlwnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WqyMD0tB6z4x8j;
	Fri, 23 Aug 2024 21:21:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] cpufreq: maple: Remove maple driver
Date: Fri, 23 Aug 2024 21:21:33 +1000
Message-ID: <20240823112134.1314561-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823112134.1314561-1-mpe@ellerman.id.au>
References: <20240823112134.1314561-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver is no longer buildable since the PPC_MAPLE platform was
removed. Remove the driver.

Note that the comment in the driver says it supports "SMU & 970FX
based G5 Macs", but that's not true, that comment was copied from
pmac64-cpufreq.c, which still exists and continues to support those
machines.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/cpufreq/Kconfig.powerpc |   7 -
 drivers/cpufreq/Makefile        |   1 -
 drivers/cpufreq/maple-cpufreq.c | 241 --------------------------------
 3 files changed, 249 deletions(-)
 delete mode 100644 drivers/cpufreq/maple-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig.powerpc b/drivers/cpufreq/Kconfig.powerpc
index 58151ca56695..eb678fa5260a 100644
--- a/drivers/cpufreq/Kconfig.powerpc
+++ b/drivers/cpufreq/Kconfig.powerpc
@@ -17,13 +17,6 @@ config CPU_FREQ_CBE_PMI
 	  frequencies. Using PMI, the processor will not only be able to run at
 	  lower speed, but also at lower core voltage.
 
-config CPU_FREQ_MAPLE
-	bool "Support for Maple 970FX Evaluation Board"
-	depends on PPC_MAPLE
-	help
-	  This adds support for frequency switching on Maple 970FX
-	  Evaluation Board and compatible boards (IBM JS2x blades).
-
 config CPU_FREQ_PMAC
 	bool "Support for Apple PowerBooks"
 	depends on ADB_PMU && PPC32
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 0f184031dd12..1a8f787db7e2 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -92,7 +92,6 @@ obj-$(CONFIG_ARM_VEXPRESS_SPC_CPUFREQ)	+= vexpress-spc-cpufreq.o
 obj-$(CONFIG_CPU_FREQ_CBE)		+= ppc-cbe-cpufreq.o
 ppc-cbe-cpufreq-y			+= ppc_cbe_cpufreq_pervasive.o ppc_cbe_cpufreq.o
 obj-$(CONFIG_CPU_FREQ_CBE_PMI)		+= ppc_cbe_cpufreq_pmi.o
-obj-$(CONFIG_CPU_FREQ_MAPLE)		+= maple-cpufreq.o
 obj-$(CONFIG_QORIQ_CPUFREQ)   		+= qoriq-cpufreq.o
 obj-$(CONFIG_CPU_FREQ_PMAC)		+= pmac32-cpufreq.o
 obj-$(CONFIG_CPU_FREQ_PMAC64)		+= pmac64-cpufreq.o
diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
deleted file mode 100644
index f9306410a07f..000000000000
--- a/drivers/cpufreq/maple-cpufreq.c
+++ /dev/null
@@ -1,241 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2011 Dmitry Eremin-Solenikov
- *  Copyright (C) 2002 - 2005 Benjamin Herrenschmidt <benh@kernel.crashing.org>
- *  and                       Markus Demleitner <msdemlei@cl.uni-heidelberg.de>
- *
- * This driver adds basic cpufreq support for SMU & 970FX based G5 Macs,
- * that is iMac G5 and latest single CPU desktop.
- */
-
-#undef DEBUG
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/delay.h>
-#include <linux/sched.h>
-#include <linux/cpufreq.h>
-#include <linux/init.h>
-#include <linux/completion.h>
-#include <linux/mutex.h>
-#include <linux/time.h>
-#include <linux/of.h>
-
-#define DBG(fmt...) pr_debug(fmt)
-
-/* see 970FX user manual */
-
-#define SCOM_PCR 0x0aa001			/* PCR scom addr */
-
-#define PCR_HILO_SELECT		0x80000000U	/* 1 = PCR, 0 = PCRH */
-#define PCR_SPEED_FULL		0x00000000U	/* 1:1 speed value */
-#define PCR_SPEED_HALF		0x00020000U	/* 1:2 speed value */
-#define PCR_SPEED_QUARTER	0x00040000U	/* 1:4 speed value */
-#define PCR_SPEED_MASK		0x000e0000U	/* speed mask */
-#define PCR_SPEED_SHIFT		17
-#define PCR_FREQ_REQ_VALID	0x00010000U	/* freq request valid */
-#define PCR_VOLT_REQ_VALID	0x00008000U	/* volt request valid */
-#define PCR_TARGET_TIME_MASK	0x00006000U	/* target time */
-#define PCR_STATLAT_MASK	0x00001f00U	/* STATLAT value */
-#define PCR_SNOOPLAT_MASK	0x000000f0U	/* SNOOPLAT value */
-#define PCR_SNOOPACC_MASK	0x0000000fU	/* SNOOPACC value */
-
-#define SCOM_PSR 0x408001			/* PSR scom addr */
-/* warning: PSR is a 64 bits register */
-#define PSR_CMD_RECEIVED	0x2000000000000000U   /* command received */
-#define PSR_CMD_COMPLETED	0x1000000000000000U   /* command completed */
-#define PSR_CUR_SPEED_MASK	0x0300000000000000U   /* current speed */
-#define PSR_CUR_SPEED_SHIFT	(56)
-
-/*
- * The G5 only supports two frequencies (Quarter speed is not supported)
- */
-#define CPUFREQ_HIGH                  0
-#define CPUFREQ_LOW                   1
-
-static struct cpufreq_frequency_table maple_cpu_freqs[] = {
-	{0, CPUFREQ_HIGH,		0},
-	{0, CPUFREQ_LOW,		0},
-	{0, 0,				CPUFREQ_TABLE_END},
-};
-
-/* Power mode data is an array of the 32 bits PCR values to use for
- * the various frequencies, retrieved from the device-tree
- */
-static int maple_pmode_cur;
-
-static const u32 *maple_pmode_data;
-static int maple_pmode_max;
-
-/*
- * SCOM based frequency switching for 970FX rev3
- */
-static int maple_scom_switch_freq(int speed_mode)
-{
-	unsigned long flags;
-	int to;
-
-	local_irq_save(flags);
-
-	/* Clear PCR high */
-	scom970_write(SCOM_PCR, 0);
-	/* Clear PCR low */
-	scom970_write(SCOM_PCR, PCR_HILO_SELECT | 0);
-	/* Set PCR low */
-	scom970_write(SCOM_PCR, PCR_HILO_SELECT |
-		      maple_pmode_data[speed_mode]);
-
-	/* Wait for completion */
-	for (to = 0; to < 10; to++) {
-		unsigned long psr = scom970_read(SCOM_PSR);
-
-		if ((psr & PSR_CMD_RECEIVED) == 0 &&
-		    (((psr >> PSR_CUR_SPEED_SHIFT) ^
-		      (maple_pmode_data[speed_mode] >> PCR_SPEED_SHIFT)) & 0x3)
-		    == 0)
-			break;
-		if (psr & PSR_CMD_COMPLETED)
-			break;
-		udelay(100);
-	}
-
-	local_irq_restore(flags);
-
-	maple_pmode_cur = speed_mode;
-	ppc_proc_freq = maple_cpu_freqs[speed_mode].frequency * 1000ul;
-
-	return 0;
-}
-
-static int maple_scom_query_freq(void)
-{
-	unsigned long psr = scom970_read(SCOM_PSR);
-	int i;
-
-	for (i = 0; i <= maple_pmode_max; i++)
-		if ((((psr >> PSR_CUR_SPEED_SHIFT) ^
-		      (maple_pmode_data[i] >> PCR_SPEED_SHIFT)) & 0x3) == 0)
-			break;
-	return i;
-}
-
-/*
- * Common interface to the cpufreq core
- */
-
-static int maple_cpufreq_target(struct cpufreq_policy *policy,
-	unsigned int index)
-{
-	return maple_scom_switch_freq(index);
-}
-
-static unsigned int maple_cpufreq_get_speed(unsigned int cpu)
-{
-	return maple_cpu_freqs[maple_pmode_cur].frequency;
-}
-
-static int maple_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-	cpufreq_generic_init(policy, maple_cpu_freqs, 12000);
-	return 0;
-}
-
-static struct cpufreq_driver maple_cpufreq_driver = {
-	.name		= "maple",
-	.flags		= CPUFREQ_CONST_LOOPS,
-	.init		= maple_cpufreq_cpu_init,
-	.verify		= cpufreq_generic_frequency_table_verify,
-	.target_index	= maple_cpufreq_target,
-	.get		= maple_cpufreq_get_speed,
-	.attr		= cpufreq_generic_attr,
-};
-
-static int __init maple_cpufreq_init(void)
-{
-	struct device_node *cpunode;
-	unsigned int psize;
-	unsigned long max_freq;
-	const u32 *valp;
-	u32 pvr_hi;
-	int rc = -ENODEV;
-
-	/*
-	 * Behave here like powermac driver which checks machine compatibility
-	 * to ease merging of two drivers in future.
-	 */
-	if (!of_machine_is_compatible("Momentum,Maple") &&
-	    !of_machine_is_compatible("Momentum,Apache"))
-		return 0;
-
-	/* Get first CPU node */
-	cpunode = of_cpu_device_node_get(0);
-	if (cpunode == NULL) {
-		pr_err("Can't find any CPU 0 node\n");
-		goto bail_noprops;
-	}
-
-	/* Check 970FX for now */
-	/* we actually don't care on which CPU to access PVR */
-	pvr_hi = PVR_VER(mfspr(SPRN_PVR));
-	if (pvr_hi != 0x3c && pvr_hi != 0x44) {
-		pr_err("Unsupported CPU version (%x)\n", pvr_hi);
-		goto bail_noprops;
-	}
-
-	/* Look for the powertune data in the device-tree */
-	/*
-	 * On Maple this property is provided by PIBS in dual-processor config,
-	 * not provided by PIBS in CPU0 config and also not provided by SLOF,
-	 * so YMMV
-	 */
-	maple_pmode_data = of_get_property(cpunode, "power-mode-data", &psize);
-	if (!maple_pmode_data) {
-		DBG("No power-mode-data !\n");
-		goto bail_noprops;
-	}
-	maple_pmode_max = psize / sizeof(u32) - 1;
-
-	/*
-	 * From what I see, clock-frequency is always the maximal frequency.
-	 * The current driver can not slew sysclk yet, so we really only deal
-	 * with powertune steps for now. We also only implement full freq and
-	 * half freq in this version. So far, I haven't yet seen a machine
-	 * supporting anything else.
-	 */
-	valp = of_get_property(cpunode, "clock-frequency", NULL);
-	if (!valp)
-		goto bail_noprops;
-	max_freq = (*valp)/1000;
-	maple_cpu_freqs[0].frequency = max_freq;
-	maple_cpu_freqs[1].frequency = max_freq/2;
-
-	/* Force apply current frequency to make sure everything is in
-	 * sync (voltage is right for example). Firmware may leave us with
-	 * a strange setting ...
-	 */
-	msleep(10);
-	maple_pmode_cur = -1;
-	maple_scom_switch_freq(maple_scom_query_freq());
-
-	pr_info("Registering Maple CPU frequency driver\n");
-	pr_info("Low: %d Mhz, High: %d Mhz, Cur: %d MHz\n",
-		maple_cpu_freqs[1].frequency/1000,
-		maple_cpu_freqs[0].frequency/1000,
-		maple_cpu_freqs[maple_pmode_cur].frequency/1000);
-
-	rc = cpufreq_register_driver(&maple_cpufreq_driver);
-
-bail_noprops:
-	of_node_put(cpunode);
-
-	return rc;
-}
-
-module_init(maple_cpufreq_init);
-
-
-MODULE_LICENSE("GPL");
-- 
2.46.0


