Return-Path: <linuxppc-dev+bounces-4292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6B9F63F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:55:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrF36bJQz2yn2;
	Wed, 18 Dec 2024 21:55:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519335;
	cv=none; b=VZZr/6LTocDaolWZ1oT8iIaGMWMuhzGICzz0UVkD6NI6XMQ8eVJ7G2PZYaTWPVqLHRm1QR2IgqbVKNBwxGqAtV/2ZH5CM/lF9GizkOg29ShM2otHKQo9qNg0SBCBQU8p8wJqtDWmAm/Q9DxFs2w6FKe7zsUAtUmZ2JdmSxKW4rmZUiClT5TWIpQzLBuv+94Bz9egDXWQVbP5VejjG1Fy3yqdxEkTIwzwZj5iWIihCIsMrJ98wDkoBCh2hO1Mug8HmpFtTmE/y344EHcr8SoROtmH5GduoRfYnXLigzXSIeLBnPFnSMoPwaK/znPZPvDMu+j8qx9Po3IjC28V6F0m2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519335; c=relaxed/relaxed;
	bh=ZU5VU5u835TDqBV6UwlLDdSr8oDk+YYbhiv45rij1qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FAY58GZxOve2PTaZZ0ETe7+o1vvqL1r6Td7W6chSaumJCZz3pN26kkzn1MJLqtyY0pT5pG1bmx5j1rP2dzVuQlBx/NVtx+fhuKZ14/u3o+o06xFYRRg49TcHx/77B+6m1KqZx+Q7oJKlA5hKTilnK/gVQQcKTqzd+D6LvbGIVexbY65X5bPIL5A9MCZElC+I/1NQbfAdtgIfIf2ISn7o9E2V5MwXEJg0yNTwrSLLG6OhKlsrd8xx/uwye8wSc/37sfH10zSAVBS+B2uQH+1uq8MxSfvC7p/3xuW5NF5aBB3Nr5bLMlkPWEKbHG18Ek1fqybDhUP8jy7eHgvzKJJsYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ofSy+6IC; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ofSy+6IC;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrF20gwKz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519329;
	bh=ZU5VU5u835TDqBV6UwlLDdSr8oDk+YYbhiv45rij1qo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ofSy+6IC5qWPYP99Ho4xLNteLUooEQotaxD6YV4BYrHbUXLxljEvLbnGgXPI47to2
	 TRNsFSN19FtsItcopKKLDKb0j7oVHqdQrYQlb/rdyA1fg6O2Jih9CKI+zgnX5nzQEV
	 4zJMydPhe1jMhOB9vAAZQ1GKNh5r53D1bAY7PtgYGIkd7+vufIoYiaf5yxVKgH2rF4
	 yPTKO++7sWSzTxvxWsCiqs6KR2/oTMM+ERPukeV+BkBEU2VmdtHYGMIrcvs6JXSiUx
	 0KdOPYgptMvI5DZ/A51qWtb4jlM6tMTn71Tats3r3CAScRhpdUR1UNy4y01CsaTz+2
	 RPIIj5eFZwe0A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrDw6VpNz4xf8;
	Wed, 18 Dec 2024 21:55:28 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>
Subject: [PATCH v2 05/25] powerpc/cell: Remove CBE_CPUFREQ_SPU_GOVERNOR
Date: Wed, 18 Dec 2024 21:54:53 +1100
Message-ID: <20241218105523.416573-5-mpe@ellerman.id.au>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although this driver is still buildable, it can't actually do anything
in practice now that the low-level cpufreq driver for Cell has been
disabled due to the removal of CBE_RAS.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

 arch/powerpc/platforms/cell/Kconfig           |   9 --
 arch/powerpc/platforms/cell/Makefile          |   2 -
 .../platforms/cell/cpufreq_spudemand.c        | 134 ------------------
 3 files changed, 145 deletions(-)
 delete mode 100644 arch/powerpc/platforms/cell/cpufreq_spudemand.c

diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index 758dc08a6dde..db65bfcd1e74 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -21,13 +21,4 @@ config SPU_BASE
 	bool
 	select PPC_COPRO_BASE
 
-config CBE_CPUFREQ_SPU_GOVERNOR
-	tristate "CBE frequency scaling based on SPU usage"
-	depends on SPU_FS && CPU_FREQ
-	default m
-	help
-	  This governor checks for spu usage to adjust the cpu frequency.
-	  If no spu is running on a given cpu, that cpu will be throttled to
-	  the minimal possible frequency.
-
 endmenu
diff --git a/arch/powerpc/platforms/cell/Makefile b/arch/powerpc/platforms/cell/Makefile
index 1d85c41939f9..7e5ff239c376 100644
--- a/arch/powerpc/platforms/cell/Makefile
+++ b/arch/powerpc/platforms/cell/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_CBE_CPUFREQ_SPU_GOVERNOR)	+= cpufreq_spudemand.o
-
 obj-$(CONFIG_SPU_BASE)			+= spu_callbacks.o spu_base.o \
 					   spu_syscalls.o \
 					   spufs/
diff --git a/arch/powerpc/platforms/cell/cpufreq_spudemand.c b/arch/powerpc/platforms/cell/cpufreq_spudemand.c
deleted file mode 100644
index 79172ba36eca..000000000000
--- a/arch/powerpc/platforms/cell/cpufreq_spudemand.c
+++ /dev/null
@@ -1,134 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * spu aware cpufreq governor for the cell processor
- *
- * © Copyright IBM Corporation 2006-2008
- *
- * Author: Christian Krafft <krafft@de.ibm.com>
- */
-
-#include <linux/cpufreq.h>
-#include <linux/sched.h>
-#include <linux/sched/loadavg.h>
-#include <linux/module.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
-#include <linux/atomic.h>
-#include <asm/machdep.h>
-#include <asm/spu.h>
-
-#define POLL_TIME	100000		/* in µs */
-#define EXP		753		/* exp(-1) in fixed-point */
-
-struct spu_gov_info_struct {
-	unsigned long busy_spus;	/* fixed-point */
-	struct cpufreq_policy *policy;
-	struct delayed_work work;
-	unsigned int poll_int;		/* µs */
-};
-static DEFINE_PER_CPU(struct spu_gov_info_struct, spu_gov_info);
-
-static int calc_freq(struct spu_gov_info_struct *info)
-{
-	int cpu;
-	int busy_spus;
-
-	cpu = info->policy->cpu;
-	busy_spus = atomic_read(&cbe_spu_info[cpu_to_node(cpu)].busy_spus);
-
-	info->busy_spus = calc_load(info->busy_spus, EXP, busy_spus * FIXED_1);
-	pr_debug("cpu %d: busy_spus=%d, info->busy_spus=%ld\n",
-			cpu, busy_spus, info->busy_spus);
-
-	return info->policy->max * info->busy_spus / FIXED_1;
-}
-
-static void spu_gov_work(struct work_struct *work)
-{
-	struct spu_gov_info_struct *info;
-	int delay;
-	unsigned long target_freq;
-
-	info = container_of(work, struct spu_gov_info_struct, work.work);
-
-	/* after cancel_delayed_work_sync we unset info->policy */
-	BUG_ON(info->policy == NULL);
-
-	target_freq = calc_freq(info);
-	__cpufreq_driver_target(info->policy, target_freq, CPUFREQ_RELATION_H);
-
-	delay = usecs_to_jiffies(info->poll_int);
-	schedule_delayed_work_on(info->policy->cpu, &info->work, delay);
-}
-
-static void spu_gov_init_work(struct spu_gov_info_struct *info)
-{
-	int delay = usecs_to_jiffies(info->poll_int);
-	INIT_DEFERRABLE_WORK(&info->work, spu_gov_work);
-	schedule_delayed_work_on(info->policy->cpu, &info->work, delay);
-}
-
-static void spu_gov_cancel_work(struct spu_gov_info_struct *info)
-{
-	cancel_delayed_work_sync(&info->work);
-}
-
-static int spu_gov_start(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct spu_gov_info_struct *info = &per_cpu(spu_gov_info, cpu);
-	struct spu_gov_info_struct *affected_info;
-	int i;
-
-	if (!cpu_online(cpu)) {
-		printk(KERN_ERR "cpu %d is not online\n", cpu);
-		return -EINVAL;
-	}
-
-	if (!policy->cur) {
-		printk(KERN_ERR "no cpu specified in policy\n");
-		return -EINVAL;
-	}
-
-	/* initialize spu_gov_info for all affected cpus */
-	for_each_cpu(i, policy->cpus) {
-		affected_info = &per_cpu(spu_gov_info, i);
-		affected_info->policy = policy;
-	}
-
-	info->poll_int = POLL_TIME;
-
-	/* setup timer */
-	spu_gov_init_work(info);
-
-	return 0;
-}
-
-static void spu_gov_stop(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct spu_gov_info_struct *info = &per_cpu(spu_gov_info, cpu);
-	int i;
-
-	/* cancel timer */
-	spu_gov_cancel_work(info);
-
-	/* clean spu_gov_info for all affected cpus */
-	for_each_cpu (i, policy->cpus) {
-		info = &per_cpu(spu_gov_info, i);
-		info->policy = NULL;
-	}
-}
-
-static struct cpufreq_governor spu_governor = {
-	.name = "spudemand",
-	.start = spu_gov_start,
-	.stop = spu_gov_stop,
-	.owner = THIS_MODULE,
-};
-cpufreq_governor_init(spu_governor);
-cpufreq_governor_exit(spu_governor);
-
-MODULE_DESCRIPTION("SPU-aware cpufreq governor for the cell processor");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Christian Krafft <krafft@de.ibm.com>");
-- 
2.47.1


