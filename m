Return-Path: <linuxppc-dev+bounces-15106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85647CEB9D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Dec 2025 09:53:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dh3dB5n6sz2yK7;
	Wed, 31 Dec 2025 19:53:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767168202;
	cv=none; b=L/i/jrcyZbhLIHACqmkiwPfBMmUY15ANTB9xooAsH/wHPUPTr/OoUtdQM5ZJDrgJFahmF+HvDlUNCMIhu4KuvZor1B2F0rVU84O0b/lo09p03+EXYHgEP7c65Z3VTsy+0RkqikEYpajKzc5O/EDFxBa64Ncqhuzcf5zZKg5rPf6lgRKtx4jU2XriIx1lbhb9CQB+6T/UwPdBmJEkCDqANZBSyxjtOqSmvGulNF+siWTg9HezKH00LvkSEUAIZkqkV8tPKrDp7Vf0pKMGcoVoVK15kjFj9EuuzB43cQwIlmFUZkMgSdhJtO53wgnq1sNePI/g087zx6TxYhwescgZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767168202; c=relaxed/relaxed;
	bh=AbiVUPMvFY3DppG/lug31OI/3mUsor4zmCYfn7JK0CU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HWcDhXaWMB0vALW1ySG5DrAQUZiX0fXkbTlhgcHmTdJMJhi60P4vAWXS0bB/aOGhqceTLjt8MxzSi8rEC3jNl5yXUPvD/FMtVG+OybnrSFKWWCEL+ZEJbLRtHYg435WONKlFc+YPaCbt/gA6Xref0nPyHpsuxi2q7CcvuZ49d/hCAjRbdxgd67mVyHzCPzvb7MmFtTgnVtUSH3Bt8W9MFtJH1/eE+yoH2Xr7EzQT++4LzQnUUe0wSfLRmcKa26odwwSObtmLnWRHjAtmlzgcu2RyQrXkcHucIFZ62z0fAaIjNuHaa+iwLd/MymHwfxKGmHu5Uoa17TjD2NSYXtoqGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=H8oOI8iP; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=feng.tang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=H8oOI8iP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=feng.tang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dh2Wq6SDBz2yKr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Dec 2025 19:03:17 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767168192; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=AbiVUPMvFY3DppG/lug31OI/3mUsor4zmCYfn7JK0CU=;
	b=H8oOI8iPNie8dj1UGSXrT6zuPeRgUhgcxNSjeKIoGyQIC9SuWa7Cz/Q5Za+Nb8GSNIK5fATbH8xjKGyQZyF/+FZRTjUxBhqZUi2uDHqcNem7u5DKX+rhs+2/QbZKKRPayfRV35uxecfzD4zkLWcmbhN5vnNKgwJcD+Jfccd8vHM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Ww0Jzj1_1767168189 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 31 Dec 2025 16:03:09 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	chleroy@kernel.org,
	lkp@intel.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH] powerpc/watchdog: add support for hardlockup_sys_info sysctl
Date: Wed, 31 Dec 2025 16:03:09 +0800
Message-Id: <20251231080309.39642-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info
on system lockup") adds 'hardlock_sys_info' systcl knob for general
kernel watchdog to control what kinds of system debug info to be dumped
on hardlockup.

Add similar support in powerpc watchdog code to make the sysctl knob
more general, which also fixes a compiling warning in general watchdog
code reported by 0day bot.

Fixes: a9af76a78760 ("watchdog: add sys_info sysctls to dump sys info on system lockup")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512030920.NFKtekA7-lkp@intel.com/
Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
Hi All,

I failed to run it on a QEMU based CONFIG_PPC_BOOK3S_64 platform,
though I setup the basic QEMU ppc64 env. So any test would be much
appreciated!

Andrew,

With this patch, the fix c1c61241465d2 ("kernel/watchdog.c: fix unused var warning)
in -mm tree's 'mm-nonmm-unstable' branch could be dropped.

Thanks,
Feng

 arch/powerpc/kernel/watchdog.c | 15 ++++++++++-----
 include/linux/nmi.h            |  1 +
 kernel/watchdog.c              |  2 +-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 2429cb1c7baa..764001deb060 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/processor.h>
 #include <linux/smp.h>
+#include <linux/sys_info.h>
 
 #include <asm/interrupt.h>
 #include <asm/paca.h>
@@ -235,7 +236,11 @@ static void watchdog_smp_panic(int cpu)
 	pr_emerg("CPU %d TB:%lld, last SMP heartbeat TB:%lld (%lldms ago)\n",
 		 cpu, tb, last_reset, tb_to_ns(tb - last_reset) / 1000000);
 
-	if (!sysctl_hardlockup_all_cpu_backtrace) {
+	if (sysctl_hardlockup_all_cpu_backtrace ||
+	    (hardlockup_si_mask & SYS_INFO_ALL_BT)) {
+		trigger_allbutcpu_cpu_backtrace(cpu);
+		cpumask_clear(&wd_smp_cpus_ipi);
+	} else {
 		/*
 		 * Try to trigger the stuck CPUs, unless we are going to
 		 * get a backtrace on all of them anyway.
@@ -244,11 +249,9 @@ static void watchdog_smp_panic(int cpu)
 			smp_send_nmi_ipi(c, wd_lockup_ipi, 1000000);
 			__cpumask_clear_cpu(c, &wd_smp_cpus_ipi);
 		}
-	} else {
-		trigger_allbutcpu_cpu_backtrace(cpu);
-		cpumask_clear(&wd_smp_cpus_ipi);
 	}
 
+	sys_info(hardlockup_si_mask & ~SYS_INFO_ALL_BT);
 	if (hardlockup_panic)
 		nmi_panic(NULL, "Hard LOCKUP");
 
@@ -415,9 +418,11 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 
 		xchg(&__wd_nmi_output, 1); // see wd_lockup_ipi
 
-		if (sysctl_hardlockup_all_cpu_backtrace)
+		if (sysctl_hardlockup_all_cpu_backtrace ||
+		    (hardlockup_si_mask & SYS_INFO_ALL_BT))
 			trigger_allbutcpu_cpu_backtrace(cpu);
 
+		sys_info(hardlockup_si_mask & ~SYS_INFO_ALL_BT);
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index cf3c6ab408aa..207156f2143c 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -83,6 +83,7 @@ static inline void reset_hung_task_detector(void) { }
 #if defined(CONFIG_HARDLOCKUP_DETECTOR)
 extern void hardlockup_detector_disable(void);
 extern unsigned int hardlockup_panic;
+extern unsigned long hardlockup_si_mask;
 #else
 static inline void hardlockup_detector_disable(void) {}
 #endif
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 0685e3a8aa0a..366122f4a0f8 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -71,7 +71,7 @@ unsigned int __read_mostly hardlockup_panic =
  * hard lockup is detected, it could be task, memory, lock etc.
  * Refer include/linux/sys_info.h for detailed bit definition.
  */
-static unsigned long hardlockup_si_mask;
+unsigned long hardlockup_si_mask;
 
 #ifdef CONFIG_SYSFS
 
-- 
2.25.1


