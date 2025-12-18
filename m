Return-Path: <linuxppc-dev+bounces-14861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F3ACCB4A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 11:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX5pL3kVNz2xrM;
	Thu, 18 Dec 2025 21:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=111.206.215.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766043910;
	cv=none; b=YeYmY40bU7iBpKbM7t87xD/XfPCKvNkP+VyoExE10dr4ZuWdeOwdolclHyESIOK8w6KvWGp84j+Et59iHNhWPEY7jaRDL9dzgZOsISb9ez0n3BJosXZBxIbPTWmWGS7X8Q5hpYypgYNlPO/Gnur+1DJusdl5yxyXH+es5LQdGZ4K3/hLBOFo/xqNuP+i5EVLaavtIvw+HCE+NOKkep++ViUbURoIO2lzqnChWuX0rhtByW3o+mySkXyUESyg8M4M1i25D7cEKUqxD3n3efVbdV3BDB62zXB4y3t9gKy49ERNFEIDZuNSJnIk1sX4vswsfiE9SV53WVLFzD7v/7/0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766043910; c=relaxed/relaxed;
	bh=ubFQKP7gXeN+eys77YmcHRPo28IrnoTQeky3gPptJ6U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aiN6mg65xCtZbik5ZvJS51lVpdLVH5UShDM2jF67/lnHr25bsRAySxhy9fyQZp1E/DlHyMfmBHVBzgXcIn4NilyFWhh4tZnvQF+QLZZJ8q/1nFIFZ1PCoD8nEBMBhmkmIm5Na9rRMkLLf11iz0fgfey0pyd+byZ/jlbs/Kr2JspS6cEyVwZYcVksfuI42QsIdv2LI8AlWM8isZZdbB6drKY8c6Q5JSF3MGx1udnQDYDXAyHVXaLNrh0MjRtk4HlTV2kQY4YFYMyFB9zlDW8wf8SOxhnN1GNPoMT+4+9dixWQ83Ysfa0pVYlANUKs5Eda19B91UgmIPoOx5449WTvIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass (client-ip=111.206.215.185; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org) smtp.mailfrom=baidu.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baidu.com (client-ip=111.206.215.185; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 171724 seconds by postgrey-1.37 at boromir; Thu, 18 Dec 2025 18:45:08 AEDT
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX2kr5Xdsz2xqm;
	Thu, 18 Dec 2025 18:45:05 +1100 (AEDT)
From: lirongqing <lirongqing@baidu.com>
To: Andrew Morton <akpm@linux-foundation.org>, Lance Yang
	<lance.yang@linux.dev>
CC: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<chleroy@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-openrisc@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<dri-devel@lists.freedesktop.org>, <bpf@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <wireguard@lists.zx2c4.com>,
	<netdev@vger.kernel.org>, Li RongQing <lirongqing@baidu.com>
Subject: [PATCH][v2] watchdog: softlockup: panic when lockup duration exceeds N thresholds
Date: Thu, 18 Dec 2025 02:43:00 -0500
Message-ID: <20251218074300.4080-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain
X-Originating-IP: [10.127.73.8]
X-ClientProxiedBy: bjkjy-exc13.internal.baidu.com (172.31.51.13) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
X-FEAS-Client-IP: 172.31.50.47
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Li RongQing <lirongqing@baidu.com>

The softlockup_panic sysctl is currently a binary option: panic immediately
or never panic on soft lockups.

Panicking on any soft lockup, regardless of duration, can be overly
aggressive for brief stalls that may be caused by legitimate operations.
Conversely, never panicking may allow severe system hangs to persist
undetected.

Extend softlockup_panic to accept an integer threshold, allowing the kernel
to panic only when the normalized lockup duration exceeds N watchdog
threshold periods. This provides finer-grained control to distinguish
between transient delays and persistent system failures.

The accepted values are:
- 0: Don't panic (unchanged)
- 1: Panic when duration >= 1 * threshold (20s default, original behavior)
- N > 1: Panic when duration >= N * threshold (e.g., 2 = 40s, 3 = 60s.)

The original behavior is preserved for values 0 and 1, maintaining full
backward compatibility while allowing systems to tolerate brief lockups
while still catching severe, persistent hangs.

Signed-off-by: Li RongQing <lirongqing@baidu.com>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
Diff with v1: add a temp variable thresh_count
              chang config to 0 in kernel/configs/debug.config 
 Documentation/admin-guide/kernel-parameters.txt      | 10 +++++-----
 arch/arm/configs/aspeed_g5_defconfig                 |  2 +-
 arch/arm/configs/pxa3xx_defconfig                    |  2 +-
 arch/openrisc/configs/or1klitex_defconfig            |  2 +-
 arch/powerpc/configs/skiroot_defconfig               |  2 +-
 drivers/gpu/drm/ci/arm.config                        |  2 +-
 drivers/gpu/drm/ci/arm64.config                      |  2 +-
 drivers/gpu/drm/ci/x86_64.config                     |  2 +-
 kernel/configs/debug.config                          |  2 +-
 kernel/watchdog.c                                    | 10 ++++++----
 lib/Kconfig.debug                                    | 13 +++++++------
 tools/testing/selftests/bpf/config                   |  2 +-
 tools/testing/selftests/wireguard/qemu/kernel.config |  2 +-
 13 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afd..27c5f96 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6934,12 +6934,12 @@ Kernel parameters
 
 	softlockup_panic=
 			[KNL] Should the soft-lockup detector generate panics.
-			Format: 0 | 1
+			Format: <int>
 
-			A value of 1 instructs the soft-lockup detector
-			to panic the machine when a soft-lockup occurs. It is
-			also controlled by the kernel.softlockup_panic sysctl
-			and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
+			A value of non-zero instructs the soft-lockup detector
+			to panic the machine when a soft-lockup duration exceeds
+			N thresholds. It is also controlled by the kernel.softlockup_panic
+			sysctl and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
 			respective build-time switch to that functionality.
 
 	softlockup_all_cpu_backtrace=
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 2e6ea13..ec558e5 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -306,7 +306,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_PANIC_TIMEOUT=-1
 CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 CONFIG_BOOTPARAM_HUNG_TASK_PANIC=1
 CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
index 07d422f..fb272e3 100644
--- a/arch/arm/configs/pxa3xx_defconfig
+++ b/arch/arm/configs/pxa3xx_defconfig
@@ -100,7 +100,7 @@ CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_SHIRQ=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_SPINLOCK_SLEEP=y
diff --git a/arch/openrisc/configs/or1klitex_defconfig b/arch/openrisc/configs/or1klitex_defconfig
index fb1eb9a..984b0e3 100644
--- a/arch/openrisc/configs/or1klitex_defconfig
+++ b/arch/openrisc/configs/or1klitex_defconfig
@@ -52,5 +52,5 @@ CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,bpf"
 CONFIG_PRINTK_TIME=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 CONFIG_BUG_ON_DATA_CORRUPTION=y
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 2b71a6d..a4114fc 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -289,7 +289,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_PANIC_ON_OOPS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
 CONFIG_WQ_WATCHDOG=y
diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
index 411e814..d7c5167 100644
--- a/drivers/gpu/drm/ci/arm.config
+++ b/drivers/gpu/drm/ci/arm.config
@@ -52,7 +52,7 @@ CONFIG_TMPFS=y
 CONFIG_PROVE_LOCKING=n
 CONFIG_DEBUG_LOCKDEP=n
 CONFIG_SOFTLOCKUP_DETECTOR=n
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=n
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=0
 
 CONFIG_FW_LOADER_COMPRESS=y
 
diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index fddfbd4..ea0e307 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -161,7 +161,7 @@ CONFIG_TMPFS=y
 CONFIG_PROVE_LOCKING=n
 CONFIG_DEBUG_LOCKDEP=n
 CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 
 CONFIG_DETECT_HUNG_TASK=y
 
diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
index 8eaba388..7ac98a7 100644
--- a/drivers/gpu/drm/ci/x86_64.config
+++ b/drivers/gpu/drm/ci/x86_64.config
@@ -47,7 +47,7 @@ CONFIG_TMPFS=y
 CONFIG_PROVE_LOCKING=n
 CONFIG_DEBUG_LOCKDEP=n
 CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 
 CONFIG_DETECT_HUNG_TASK=y
 
diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
index 9f6ab7d..774702591 100644
--- a/kernel/configs/debug.config
+++ b/kernel/configs/debug.config
@@ -84,7 +84,7 @@ CONFIG_SLUB_DEBUG_ON=y
 # Debug Oops, Lockups and Hangs
 #
 CONFIG_BOOTPARAM_HUNG_TASK_PANIC=0
-# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=0
 CONFIG_DEBUG_ATOMIC_SLEEP=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_PANIC_ON_OOPS=y
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 0685e3a..8168e0d 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -363,7 +363,7 @@ static struct cpumask watchdog_allowed_mask __read_mostly;
 
 /* Global variables, exported for sysctl */
 unsigned int __read_mostly softlockup_panic =
-			IS_ENABLED(CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC);
+			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC;
 
 static bool softlockup_initialized __read_mostly;
 static u64 __read_mostly sample_period;
@@ -774,8 +774,8 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 {
 	unsigned long touch_ts, period_ts, now;
 	struct pt_regs *regs = get_irq_regs();
-	int duration;
 	int softlockup_all_cpu_backtrace;
+	int duration, thresh_count;
 	unsigned long flags;
 
 	if (!watchdog_enabled)
@@ -879,7 +879,9 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 
 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
 		sys_info(softlockup_si_mask & ~SYS_INFO_ALL_BT);
-		if (softlockup_panic)
+		thresh_count = duration / get_softlockup_thresh();
+
+		if (softlockup_panic && thresh_count >= softlockup_panic)
 			panic("softlockup: hung tasks");
 	}
 
@@ -1228,7 +1230,7 @@ static const struct ctl_table watchdog_sysctls[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_dointvec_minmax,
 		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_ONE,
+		.extra2		= SYSCTL_INT_MAX,
 	},
 	{
 		.procname	= "softlockup_sys_info",
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ba36939..17a7a77 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1110,13 +1110,14 @@ config SOFTLOCKUP_DETECTOR_INTR_STORM
 	  the CPU stats and the interrupt counts during the "soft lockups".
 
 config BOOTPARAM_SOFTLOCKUP_PANIC
-	bool "Panic (Reboot) On Soft Lockups"
+	int "Panic (Reboot) On Soft Lockups"
 	depends on SOFTLOCKUP_DETECTOR
+	default 0
 	help
-	  Say Y here to enable the kernel to panic on "soft lockups",
-	  which are bugs that cause the kernel to loop in kernel
-	  mode for more than 20 seconds (configurable using the watchdog_thresh
-	  sysctl), without giving other tasks a chance to run.
+	  Set to a non-zero value N to enable the kernel to panic on "soft
+	  lockups", which are bugs that cause the kernel to loop in kernel
+	  mode for more than (N * 20 seconds) (configurable using the
+	  watchdog_thresh sysctl), without giving other tasks a chance to run.
 
 	  The panic can be used in combination with panic_timeout,
 	  to cause the system to reboot automatically after a
@@ -1124,7 +1125,7 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
 	  high-availability systems that have uptime guarantees and
 	  where a lockup must be resolved ASAP.
 
-	  Say N if unsure.
+	  Say 0 if unsure.
 
 config HAVE_HARDLOCKUP_DETECTOR_BUDDY
 	bool
diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
index 558839e..2485538 100644
--- a/tools/testing/selftests/bpf/config
+++ b/tools/testing/selftests/bpf/config
@@ -1,6 +1,6 @@
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 CONFIG_BPF=y
 CONFIG_BPF_EVENTS=y
 CONFIG_BPF_JIT=y
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 0504c11..bb89d2d 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -80,7 +80,7 @@ CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_WQ_WATCHDOG=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
-CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
 CONFIG_BOOTPARAM_HUNG_TASK_PANIC=1
 CONFIG_PANIC_TIMEOUT=-1
 CONFIG_STACKTRACE=y
-- 
2.9.4


