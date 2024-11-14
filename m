Return-Path: <linuxppc-dev+bounces-3179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC39C8B10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:51:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QN2T1hz301Y;
	Thu, 14 Nov 2024 23:51:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588684;
	cv=none; b=MzxY1kSDMOGJarSYFY3kOM78f0rgay1GADN31fGPU8PhbgEU4FUaDezu6m8cidnV659iABeg1EOXkjEtHDYkUaLU1TYwpu/CJSX4uPMvbwdMKrrsDc3Umz0lCDFngrrr5g+4oI0kt4mwSGa1wgtKJ6OdfnMtxUqrvwkqCEooQRiFp+KZjKqM9DotLEvsw0On9mXIeuHFjAw0oDOeTM+gzSEyYQ5LzougkSUVaxi9xUsywpnhsd+aYPkEPW2MsM2zp0nR0BPrnk1N/nKPKZldOrE/lAabHCr0JiZ32YbyzVnZTQg7hFF1BzqFyttmTSYvI2o4Xp7Ux3aGNjW/5ruflw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588684; c=relaxed/relaxed;
	bh=yZuaM54MomYe+84BCNR93OgCg6wwJOHqxGUzH96G2gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6xOZ6wSMdSyaoIk4VpOGRLyB+qPSQYE64yeTj8Uzu/bvwhKOhqx3R7sM3t8b5jVDtbsfwpeOd2xzFK8gx31J0hK9WmbLIex/py5CbTOfEe4swvMMwsYzFezX/MbMGHN37Rdm0e6hC1VHN9lufSR2R+c+plX6n1IurTf28KWcrA2431R6Hs1Nl5a1Bz2Vbi82yAzLyzRk/onNtobJmJdAVAtaKgIH+lZPEYbHThEaglvm25T6tTyg5tBlKNKEUNp1GBh8WAtatlK4LAhsXOAu0jngq70gk58yNKC8w5C/lXmpsivowwm8rGttt5r/0oZRxwr4Po8kLp8GOJxgEPMnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rLOzQ2FI; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rLOzQ2FI;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QL0lVCz2yvq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588679;
	bh=yZuaM54MomYe+84BCNR93OgCg6wwJOHqxGUzH96G2gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLOzQ2FIxZ/pOm1v3w2XhhlYlGYkKl7S77h5sk7+J/7c53n5dXoA5NmYVzpldZr/r
	 1OdE7nPjDk69iVUigLh/IxDZm7uobf8vWe8AB/Le6KWzY3A3SXO+kglUwPzMGduWg2
	 Xh4bPM5lI+mhYrvQ268S+s+ksUR+QmGg6TQcp418Mhvp7X0b8mg0WtXnSHywgNyUqi
	 0p/EhHwndOvVxmTFduIcPhWT8eWAUuRRa2D4GygyXpB8ELL9Y5HcxfaIovUi9qd0sy
	 +5XWer538Qqtc9KjHmCGi1uh3PX1Ka/qMzx/Kpphuuabo8iLb/o+ZswN0MkiyTrMS7
	 mfMu/j3ODFDxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QH186Pz4x8H;
	Thu, 14 Nov 2024 23:51:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 05/20] powerpc/cell: Remove CBE_CPUFREQ_SPU_GOVERNOR
Date: Thu, 14 Nov 2024 23:50:54 +1100
Message-ID: <20241114125111.599093-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although this driver is still buildable, it can't actually do anything
in practice now that the low-level cpufreq driver for Cell has been
disabled due to the removal of CBE_RAS.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
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
2.47.0


