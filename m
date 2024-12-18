Return-Path: <linuxppc-dev+bounces-4315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F39F6433
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFK3sSyz3bNh;
	Wed, 18 Dec 2024 21:55:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519349;
	cv=none; b=RwuurwwWLDU4Lglf53pNxMUwIJu+RvbxyE726vp1LCwfJJALXiyqgwvD566iV8Ce4HKPqDpuNW+PkQM4uRkzFyjEvpQXiXlUyd9QEkiVGR3ajlCWu1+lB9ybBix3ZN41naGKqvbt37lg/ccv4IxzCNgOZr0FUgXLJCvgDepW/mGcQ6yb9nQATA7yzyiINlsLl4HomdoxnqWK19DKLRpp8qZoBsIitTceEneNyFPu1g59AD6/NCEtn2kKIP/P6YNWgpUQYfYBFxwizBOk0hwsawBY05gZxdk7Jree8Cjbtm9fy8skIPwFmVynyaeSeLqt0UwTKBlw2C4uiQ8vjxzQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519349; c=relaxed/relaxed;
	bh=ef14g61efdpXqCaHXYgrJOc2BitN918py2qKHEyVwOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I+iuq1AxJW/u9FpfLlQ/YtdP9pYiaEE7bm+u4zE2dpYhxKJ45PNEUwUGSdYrPjqXEf7pV+kD5kCtPnKnfCseJFXBYAZHXnlPE+LphcHA9i7DaZgrn5C8cv6vkUi68vBwR2jBhuFCgpKzwiAJMPtSecLiWkM8P0LJb2+rYH9tC4/2VGnQRhfxJElC7CAlqRI0RtTmmT9m4hbXu2OmRHdQyCiaH+tsnDl0qjQJFA/jf/hb2sj8YSVIlYQMUXGLEZIAg4qE8u20sNpy7A0Rfu3Na83yVVQ2T9UT3YGIpXKD+Leo90W+ltwTNKLztx++18TMzbsrmpgjyvaK9nkyACe9vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rA2/B/FG; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rA2/B/FG;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFD13yJz30Tw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519336;
	bh=ef14g61efdpXqCaHXYgrJOc2BitN918py2qKHEyVwOQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rA2/B/FGdt4yCm707q89aGyrKINsvwfLGHS2lfbNOKN2qeN60cxtITq4xJB/jMXAA
	 jWG/JeoDacoldy6nGdi1xNT5LWEEgpqYFws/RcEhSnsvYrfkn+kYhonvpfnj8bDaRA
	 78FlZYCQ0WNaaJlk5/oiVpXbvfgML+vNbaDMjhPKpDdSwWJoEjOqNHL/rAjKXaIkQ9
	 pxmlIgh1sYdiFy5kYnVSnS57YEoklAO6epQma6bzQloFnggN6Foe0bY6B7YIlxb3Yd
	 LrSIO0Mcx30wgEdVmr9cnVm5wEq7WdySKooEdIJjeRQaLcFkzQxawgi0jAFj6rX8IJ
	 xPgddPy0jRaQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF463Dzz4xfc;
	Wed, 18 Dec 2024 21:55:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 22/25] cpufreq: ppc_cbe: Remove powerpc Cell driver
Date: Wed, 18 Dec 2024 21:55:10 +1100
Message-ID: <20241218105523.416573-22-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This driver can no longer be built since support for IBM Cell Blades was
removed, in particular CBE_RAS.

Remove the driver.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

Cc: linux-pm@vger.kernel.org

 drivers/cpufreq/Kconfig.powerpc             |  18 --
 drivers/cpufreq/Makefile                    |   3 -
 drivers/cpufreq/ppc_cbe_cpufreq.c           | 173 --------------------
 drivers/cpufreq/ppc_cbe_cpufreq.h           |  33 ----
 drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c | 102 ------------
 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c       | 150 -----------------
 6 files changed, 479 deletions(-)
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq.c
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq.h
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c
 delete mode 100644 drivers/cpufreq/ppc_cbe_cpufreq_pmi.c

diff --git a/drivers/cpufreq/Kconfig.powerpc b/drivers/cpufreq/Kconfig.powerpc
index eb678fa5260a..551e65d35a1d 100644
--- a/drivers/cpufreq/Kconfig.powerpc
+++ b/drivers/cpufreq/Kconfig.powerpc
@@ -1,22 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config CPU_FREQ_CBE
-	tristate "CBE frequency scaling"
-	depends on CBE_RAS && PPC_CELL
-	default m
-	help
-	  This adds the cpufreq driver for Cell BE processors.
-	  For details, take a look at <file:Documentation/cpu-freq/>.
-	  If you don't have such processor, say N
-
-config CPU_FREQ_CBE_PMI
-	bool "CBE frequency scaling using PMI interface"
-	depends on CPU_FREQ_CBE
-	default n
-	help
-	  Select this, if you want to use the PMI interface to switch
-	  frequencies. Using PMI, the processor will not only be able to run at
-	  lower speed, but also at lower core voltage.
-
 config CPU_FREQ_PMAC
 	bool "Support for Apple PowerBooks"
 	depends on ADB_PMU && PPC32
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index d35a28dd9463..17504f43da9a 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -90,9 +90,6 @@ obj-$(CONFIG_ARM_VEXPRESS_SPC_CPUFREQ)	+= vexpress-spc-cpufreq.o
 
 ##################################################################################
 # PowerPC platform drivers
-obj-$(CONFIG_CPU_FREQ_CBE)		+= ppc-cbe-cpufreq.o
-ppc-cbe-cpufreq-y			+= ppc_cbe_cpufreq_pervasive.o ppc_cbe_cpufreq.o
-obj-$(CONFIG_CPU_FREQ_CBE_PMI)		+= ppc_cbe_cpufreq_pmi.o
 obj-$(CONFIG_QORIQ_CPUFREQ)   		+= qoriq-cpufreq.o
 obj-$(CONFIG_CPU_FREQ_PMAC)		+= pmac32-cpufreq.o
 obj-$(CONFIG_CPU_FREQ_PMAC64)		+= pmac64-cpufreq.o
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.c b/drivers/cpufreq/ppc_cbe_cpufreq.c
deleted file mode 100644
index 98595b3ea13f..000000000000
--- a/drivers/cpufreq/ppc_cbe_cpufreq.c
+++ /dev/null
@@ -1,173 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * cpufreq driver for the cell processor
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005-2007
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#include <linux/cpufreq.h>
-#include <linux/module.h>
-#include <linux/of.h>
-
-#include <asm/machdep.h>
-#include <asm/cell-regs.h>
-
-#include "ppc_cbe_cpufreq.h"
-
-/* the CBE supports an 8 step frequency scaling */
-static struct cpufreq_frequency_table cbe_freqs[] = {
-	{0, 1,	0},
-	{0, 2,	0},
-	{0, 3,	0},
-	{0, 4,	0},
-	{0, 5,	0},
-	{0, 6,	0},
-	{0, 8,	0},
-	{0, 10,	0},
-	{0, 0,	CPUFREQ_TABLE_END},
-};
-
-/*
- * hardware specific functions
- */
-
-static int set_pmode(unsigned int cpu, unsigned int slow_mode)
-{
-	int rc;
-
-	if (cbe_cpufreq_has_pmi)
-		rc = cbe_cpufreq_set_pmode_pmi(cpu, slow_mode);
-	else
-		rc = cbe_cpufreq_set_pmode(cpu, slow_mode);
-
-	pr_debug("register contains slow mode %d\n", cbe_cpufreq_get_pmode(cpu));
-
-	return rc;
-}
-
-/*
- * cpufreq functions
- */
-
-static int cbe_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-	struct cpufreq_frequency_table *pos;
-	const u32 *max_freqp;
-	u32 max_freq;
-	int cur_pmode;
-	struct device_node *cpu;
-
-	cpu = of_get_cpu_node(policy->cpu, NULL);
-
-	if (!cpu)
-		return -ENODEV;
-
-	pr_debug("init cpufreq on CPU %d\n", policy->cpu);
-
-	/*
-	 * Let's check we can actually get to the CELL regs
-	 */
-	if (!cbe_get_cpu_pmd_regs(policy->cpu) ||
-	    !cbe_get_cpu_mic_tm_regs(policy->cpu)) {
-		pr_info("invalid CBE regs pointers for cpufreq\n");
-		of_node_put(cpu);
-		return -EINVAL;
-	}
-
-	max_freqp = of_get_property(cpu, "clock-frequency", NULL);
-
-	of_node_put(cpu);
-
-	if (!max_freqp)
-		return -EINVAL;
-
-	/* we need the freq in kHz */
-	max_freq = *max_freqp / 1000;
-
-	pr_debug("max clock-frequency is at %u kHz\n", max_freq);
-	pr_debug("initializing frequency table\n");
-
-	/* initialize frequency table */
-	cpufreq_for_each_entry(pos, cbe_freqs) {
-		pos->frequency = max_freq / pos->driver_data;
-		pr_debug("%d: %d\n", (int)(pos - cbe_freqs), pos->frequency);
-	}
-
-	/* if DEBUG is enabled set_pmode() measures the latency
-	 * of a transition */
-	policy->cpuinfo.transition_latency = 25000;
-
-	cur_pmode = cbe_cpufreq_get_pmode(policy->cpu);
-	pr_debug("current pmode is at %d\n",cur_pmode);
-
-	policy->cur = cbe_freqs[cur_pmode].frequency;
-
-#ifdef CONFIG_SMP
-	cpumask_copy(policy->cpus, cpu_sibling_mask(policy->cpu));
-#endif
-
-	policy->freq_table = cbe_freqs;
-	cbe_cpufreq_pmi_policy_init(policy);
-	return 0;
-}
-
-static void cbe_cpufreq_cpu_exit(struct cpufreq_policy *policy)
-{
-	cbe_cpufreq_pmi_policy_exit(policy);
-}
-
-static int cbe_cpufreq_target(struct cpufreq_policy *policy,
-			      unsigned int cbe_pmode_new)
-{
-	pr_debug("setting frequency for cpu %d to %d kHz, " \
-		 "1/%d of max frequency\n",
-		 policy->cpu,
-		 cbe_freqs[cbe_pmode_new].frequency,
-		 cbe_freqs[cbe_pmode_new].driver_data);
-
-	return set_pmode(policy->cpu, cbe_pmode_new);
-}
-
-static struct cpufreq_driver cbe_cpufreq_driver = {
-	.verify		= cpufreq_generic_frequency_table_verify,
-	.target_index	= cbe_cpufreq_target,
-	.init		= cbe_cpufreq_cpu_init,
-	.exit		= cbe_cpufreq_cpu_exit,
-	.name		= "cbe-cpufreq",
-	.flags		= CPUFREQ_CONST_LOOPS,
-};
-
-/*
- * module init and destoy
- */
-
-static int __init cbe_cpufreq_init(void)
-{
-	int ret;
-
-	if (!machine_is(cell))
-		return -ENODEV;
-
-	cbe_cpufreq_pmi_init();
-
-	ret = cpufreq_register_driver(&cbe_cpufreq_driver);
-	if (ret)
-		cbe_cpufreq_pmi_exit();
-
-	return ret;
-}
-
-static void __exit cbe_cpufreq_exit(void)
-{
-	cpufreq_unregister_driver(&cbe_cpufreq_driver);
-	cbe_cpufreq_pmi_exit();
-}
-
-module_init(cbe_cpufreq_init);
-module_exit(cbe_cpufreq_exit);
-
-MODULE_DESCRIPTION("cpufreq driver for Cell BE processors");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq.h b/drivers/cpufreq/ppc_cbe_cpufreq.h
deleted file mode 100644
index 00cd8633b0d9..000000000000
--- a/drivers/cpufreq/ppc_cbe_cpufreq.h
+++ /dev/null
@@ -1,33 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * ppc_cbe_cpufreq.h
- *
- * This file contains the definitions used by the cbe_cpufreq driver.
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005-2007
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- *
- */
-
-#include <linux/cpufreq.h>
-#include <linux/types.h>
-
-int cbe_cpufreq_set_pmode(int cpu, unsigned int pmode);
-int cbe_cpufreq_get_pmode(int cpu);
-
-int cbe_cpufreq_set_pmode_pmi(int cpu, unsigned int pmode);
-
-#if IS_ENABLED(CONFIG_CPU_FREQ_CBE_PMI)
-extern bool cbe_cpufreq_has_pmi;
-void cbe_cpufreq_pmi_policy_init(struct cpufreq_policy *policy);
-void cbe_cpufreq_pmi_policy_exit(struct cpufreq_policy *policy);
-void cbe_cpufreq_pmi_init(void);
-void cbe_cpufreq_pmi_exit(void);
-#else
-#define cbe_cpufreq_has_pmi (0)
-static inline void cbe_cpufreq_pmi_policy_init(struct cpufreq_policy *policy) {}
-static inline void cbe_cpufreq_pmi_policy_exit(struct cpufreq_policy *policy) {}
-static inline void cbe_cpufreq_pmi_init(void) {}
-static inline void cbe_cpufreq_pmi_exit(void) {}
-#endif
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c b/drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c
deleted file mode 100644
index 04830cd95333..000000000000
--- a/drivers/cpufreq/ppc_cbe_cpufreq_pervasive.c
+++ /dev/null
@@ -1,102 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * pervasive backend for the cbe_cpufreq driver
- *
- * This driver makes use of the pervasive unit to
- * engage the desired frequency.
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005-2007
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <linux/time.h>
-#include <asm/machdep.h>
-#include <asm/hw_irq.h>
-#include <asm/cell-regs.h>
-
-#include "ppc_cbe_cpufreq.h"
-
-/* to write to MIC register */
-static u64 MIC_Slow_Fast_Timer_table[] = {
-	[0 ... 7] = 0x007fc00000000000ull,
-};
-
-/* more values for the MIC */
-static u64 MIC_Slow_Next_Timer_table[] = {
-	0x0000240000000000ull,
-	0x0000268000000000ull,
-	0x000029C000000000ull,
-	0x00002D0000000000ull,
-	0x0000300000000000ull,
-	0x0000334000000000ull,
-	0x000039C000000000ull,
-	0x00003FC000000000ull,
-};
-
-
-int cbe_cpufreq_set_pmode(int cpu, unsigned int pmode)
-{
-	struct cbe_pmd_regs __iomem *pmd_regs;
-	struct cbe_mic_tm_regs __iomem *mic_tm_regs;
-	unsigned long flags;
-	u64 value;
-#ifdef DEBUG
-	long time;
-#endif
-
-	local_irq_save(flags);
-
-	mic_tm_regs = cbe_get_cpu_mic_tm_regs(cpu);
-	pmd_regs = cbe_get_cpu_pmd_regs(cpu);
-
-#ifdef DEBUG
-	time = jiffies;
-#endif
-
-	out_be64(&mic_tm_regs->slow_fast_timer_0, MIC_Slow_Fast_Timer_table[pmode]);
-	out_be64(&mic_tm_regs->slow_fast_timer_1, MIC_Slow_Fast_Timer_table[pmode]);
-
-	out_be64(&mic_tm_regs->slow_next_timer_0, MIC_Slow_Next_Timer_table[pmode]);
-	out_be64(&mic_tm_regs->slow_next_timer_1, MIC_Slow_Next_Timer_table[pmode]);
-
-	value = in_be64(&pmd_regs->pmcr);
-	/* set bits to zero */
-	value &= 0xFFFFFFFFFFFFFFF8ull;
-	/* set bits to next pmode */
-	value |= pmode;
-
-	out_be64(&pmd_regs->pmcr, value);
-
-#ifdef DEBUG
-	/* wait until new pmode appears in status register */
-	value = in_be64(&pmd_regs->pmsr) & 0x07;
-	while (value != pmode) {
-		cpu_relax();
-		value = in_be64(&pmd_regs->pmsr) & 0x07;
-	}
-
-	time = jiffies  - time;
-	time = jiffies_to_msecs(time);
-	pr_debug("had to wait %lu ms for a transition using " \
-		 "pervasive unit\n", time);
-#endif
-	local_irq_restore(flags);
-
-	return 0;
-}
-
-
-int cbe_cpufreq_get_pmode(int cpu)
-{
-	int ret;
-	struct cbe_pmd_regs __iomem *pmd_regs;
-
-	pmd_regs = cbe_get_cpu_pmd_regs(cpu);
-	ret = in_be64(&pmd_regs->pmsr) & 0x07;
-
-	return ret;
-}
-
diff --git a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c b/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
deleted file mode 100644
index 6f0c32592416..000000000000
--- a/drivers/cpufreq/ppc_cbe_cpufreq_pmi.c
+++ /dev/null
@@ -1,150 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * pmi backend for the cbe_cpufreq driver
- *
- * (C) Copyright IBM Deutschland Entwicklung GmbH 2005-2007
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/types.h>
-#include <linux/timer.h>
-#include <linux/init.h>
-#include <linux/pm_qos.h>
-#include <linux/slab.h>
-
-#include <asm/processor.h>
-#include <asm/pmi.h>
-#include <asm/cell-regs.h>
-
-#ifdef DEBUG
-#include <asm/time.h>
-#endif
-
-#include "ppc_cbe_cpufreq.h"
-
-bool cbe_cpufreq_has_pmi = false;
-EXPORT_SYMBOL_GPL(cbe_cpufreq_has_pmi);
-
-/*
- * hardware specific functions
- */
-
-int cbe_cpufreq_set_pmode_pmi(int cpu, unsigned int pmode)
-{
-	int ret;
-	pmi_message_t pmi_msg;
-#ifdef DEBUG
-	long time;
-#endif
-	pmi_msg.type = PMI_TYPE_FREQ_CHANGE;
-	pmi_msg.data1 =	cbe_cpu_to_node(cpu);
-	pmi_msg.data2 = pmode;
-
-#ifdef DEBUG
-	time = jiffies;
-#endif
-	pmi_send_message(pmi_msg);
-
-#ifdef DEBUG
-	time = jiffies  - time;
-	time = jiffies_to_msecs(time);
-	pr_debug("had to wait %lu ms for a transition using " \
-		 "PMI\n", time);
-#endif
-	ret = pmi_msg.data2;
-	pr_debug("PMI returned slow mode %d\n", ret);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(cbe_cpufreq_set_pmode_pmi);
-
-
-static void cbe_cpufreq_handle_pmi(pmi_message_t pmi_msg)
-{
-	struct cpufreq_policy *policy;
-	struct freq_qos_request *req;
-	u8 node, slow_mode;
-	int cpu, ret;
-
-	BUG_ON(pmi_msg.type != PMI_TYPE_FREQ_CHANGE);
-
-	node = pmi_msg.data1;
-	slow_mode = pmi_msg.data2;
-
-	cpu = cbe_node_to_cpu(node);
-
-	pr_debug("cbe_handle_pmi: node: %d max_freq: %d\n", node, slow_mode);
-
-	policy = cpufreq_cpu_get(cpu);
-	if (!policy) {
-		pr_warn("cpufreq policy not found cpu%d\n", cpu);
-		return;
-	}
-
-	req = policy->driver_data;
-
-	ret = freq_qos_update_request(req,
-			policy->freq_table[slow_mode].frequency);
-	if (ret < 0)
-		pr_warn("Failed to update freq constraint: %d\n", ret);
-	else
-		pr_debug("limiting node %d to slow mode %d\n", node, slow_mode);
-
-	cpufreq_cpu_put(policy);
-}
-
-static struct pmi_handler cbe_pmi_handler = {
-	.type			= PMI_TYPE_FREQ_CHANGE,
-	.handle_pmi_message	= cbe_cpufreq_handle_pmi,
-};
-
-void cbe_cpufreq_pmi_policy_init(struct cpufreq_policy *policy)
-{
-	struct freq_qos_request *req;
-	int ret;
-
-	if (!cbe_cpufreq_has_pmi)
-		return;
-
-	req = kzalloc(sizeof(*req), GFP_KERNEL);
-	if (!req)
-		return;
-
-	ret = freq_qos_add_request(&policy->constraints, req, FREQ_QOS_MAX,
-				   policy->freq_table[0].frequency);
-	if (ret < 0) {
-		pr_err("Failed to add freq constraint (%d)\n", ret);
-		kfree(req);
-		return;
-	}
-
-	policy->driver_data = req;
-}
-EXPORT_SYMBOL_GPL(cbe_cpufreq_pmi_policy_init);
-
-void cbe_cpufreq_pmi_policy_exit(struct cpufreq_policy *policy)
-{
-	struct freq_qos_request *req = policy->driver_data;
-
-	if (cbe_cpufreq_has_pmi) {
-		freq_qos_remove_request(req);
-		kfree(req);
-	}
-}
-EXPORT_SYMBOL_GPL(cbe_cpufreq_pmi_policy_exit);
-
-void cbe_cpufreq_pmi_init(void)
-{
-	if (!pmi_register_handler(&cbe_pmi_handler))
-		cbe_cpufreq_has_pmi = true;
-}
-EXPORT_SYMBOL_GPL(cbe_cpufreq_pmi_init);
-
-void cbe_cpufreq_pmi_exit(void)
-{
-	pmi_unregister_handler(&cbe_pmi_handler);
-	cbe_cpufreq_has_pmi = false;
-}
-EXPORT_SYMBOL_GPL(cbe_cpufreq_pmi_exit);
-- 
2.47.1


