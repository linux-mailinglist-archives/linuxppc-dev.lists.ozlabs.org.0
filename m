Return-Path: <linuxppc-dev+bounces-14806-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC98ECC263A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 12:44:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVw7r2m3xz2yDY;
	Tue, 16 Dec 2025 22:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.181.50.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765873106;
	cv=none; b=VMpqZGYybYmL42zsbvMHW0cWKCDiqYcmewbdy9JP3125637sYbn0P1Vfqps51+5Vr4lIvTqBvuMBRykhNL9EniHakaimQv0N+sqdS7wvuh0aAx1GDTZSrNBs1gR5e4OqA2Ok4R3D1aQu9ZOXeC4d5lGprsg+tqctF+oNodjWa2aVHTwADMOrA2JTu3PxjcY2fTN20kM/jCR83uyuRxoHVqvH9j56Unrv4Vlor1QWTQm58lAoQBkhEgCjfUX/nRyIEKlCLcNoz/TECVjyg4/vP+8wCRq1XxUSGX7D1g0x+vkf+YivwxK3vCd9lPnSXfQjYF/YO9UXdD5/dZy5yfNO+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765873106; c=relaxed/relaxed;
	bh=xy8kBN2hBlAN5+FWs5IwS8QGlB0Qe+3MTckLj99rKug=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=luIZI9fAIvh+I18zEjh7kqDBrohf0zu3CWKCkE+x/4vo2nOIQosN+mC1XgQYu7OLRN7XJ48jbFKo2Z7BqiRpZty0lLisKQCYGejMOdpH9izggb2hkNewGmMZg8/8q7QebxYu+oPlAUXuv2qO1dQNv7epdH+4BrjlnjmX7AOU+f/7stZ6FM2WbTLNj6vqr3vyYcrOgjYF1ahZ91zwiy7vmz7ZtkLYc0lcl/LMp4pxQVJawqJBVr4QZSK8Y1ab9onx2gH1V66+I84OMevuo/Uo1pP/NwXrnHo/dIlpNR3czdCSuzV9a1MUuqy2cmayqyw4NB9JwenuZFiunzyu0/OG8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass (client-ip=220.181.50.185; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org) smtp.mailfrom=baidu.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baidu.com (client-ip=220.181.50.185; helo=baidu.com; envelope-from=lirongqing@baidu.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1858 seconds by postgrey-1.37 at boromir; Tue, 16 Dec 2025 19:18:25 AEDT
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVqZ92ZnCz2xqf;
	Tue, 16 Dec 2025 19:18:23 +1100 (AEDT)
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
Subject: [PATCH] watchdog: softlockup: panic when lockup duration exceeds N thresholds
Date: Tue, 16 Dec 2025 02:45:21 -0500
Message-ID: <20251216074521.2796-1-lirongqing@baidu.com>
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
X-ClientProxiedBy: bjhj-exc8.internal.baidu.com (172.31.3.18) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
X-FEAS-Client-IP: 172.31.50.47
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
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
---
 Documentation/admin-guide/kernel-parameters.txt      | 10 +++++-----
 arch/arm/configs/aspeed_g5_defconfig                 |  2 +-
 arch/arm/configs/pxa3xx_defconfig                    |  2 +-
 arch/openrisc/configs/or1klitex_defconfig            |  2 +-
 arch/powerpc/configs/skiroot_defconfig               |  2 +-
 drivers/gpu/drm/ci/arm.config                        |  2 +-
 drivers/gpu/drm/ci/arm64.config                      |  2 +-
 drivers/gpu/drm/ci/x86_64.config                     |  2 +-
 kernel/watchdog.c                                    |  8 +++++---
 lib/Kconfig.debug                                    | 13 +++++++------
 tools/testing/selftests/bpf/config                   |  2 +-
 tools/testing/selftests/wireguard/qemu/kernel.config |  2 +-
 12 files changed, 26 insertions(+), 23 deletions(-)

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
 
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 0685e3a..a5fa116 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -363,7 +363,7 @@ static struct cpumask watchdog_allowed_mask __read_mostly;
 
 /* Global variables, exported for sysctl */
 unsigned int __read_mostly softlockup_panic =
-			IS_ENABLED(CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC);
+			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC;
 
 static bool softlockup_initialized __read_mostly;
 static u64 __read_mostly sample_period;
@@ -879,7 +879,9 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 
 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
 		sys_info(softlockup_si_mask & ~SYS_INFO_ALL_BT);
-		if (softlockup_panic)
+		duration = duration / get_softlockup_thresh();
+
+		if (softlockup_panic && duration >= softlockup_panic)
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


