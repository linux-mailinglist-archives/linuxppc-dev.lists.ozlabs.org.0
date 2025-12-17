Return-Path: <linuxppc-dev+bounces-14833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB025CC647E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 07:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWPJM0bvMz2yWK;
	Wed, 17 Dec 2025 17:38:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765953506;
	cv=none; b=lk8Z5OaKJ13Df2XdeiXewRuOhCCfREx3+R23U3BTkcNK48/juzURcXs6bsCbnpAYuJn8vvqOZ2USTubbOo0TfM5HV9iyCJ+5vJHTu3zvV+8Dl9fm4IT9jL6DKFl+YTMTHVcP7cmrhdyPLpTsgkbpF74tjsHUSk+vsCXyhmf4U/PLmfloHYs4pg/gm6Db98FVA4OuJBCZyzeUIP4tcsoygdXyKo8aMWXwDizVixKHB8Zr7z2y05p66U4vVo7Bgbyjtj6tD6imQKGkbPkK+nNlSgIuYtr++wUeBGfr2drXqi/LiAFgWOdmAwSKhJzxcLd8sVNXXOf5AImqsXsMnKiaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765953506; c=relaxed/relaxed;
	bh=ez0nHLABlSpx7Rb/r0QApb6GlbBm6ikKCkO3IHe+Yb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYcIY1U0vfWxGKHIIXNP7nTJ39rhKZHqgF8ibIB6R65CQKm+1L10xqWKcOJ2gnOTE6qVeKGLYKujaRwOA4FxWA6FYbokEZ3eGan5xwRmJgp7BlIDEhyH53Z7ti01K5st9xKN6L2/A/NgoQ6LrHQuYWfuL2/svpFWjBR9bfltaAiooauEvMpw11TiMAh1mviVJT6eIJwJ61l8U3TGx5wI7s6ARZJW3NBBjYwpM9mIElLKsybpVrrXiccAJuBRgQVjhcYqC8hx+oOeyKYm9AvbbjSRCsWlzBpCiuqWw8XZN7e5Hi7o4UXkXGjKl4W0EyQM13BySXPBT/Zv9IvV+YipNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LxtJ0pTV; dkim-atps=neutral; spf=pass (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LxtJ0pTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 611 seconds by postgrey-1.37 at boromir; Wed, 17 Dec 2025 17:38:22 AEDT
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWPJG0TFlz2yVM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 17:38:20 +1100 (AEDT)
Message-ID: <e216e4ae-b882-454d-be8f-24f21a3549d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765952853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ez0nHLABlSpx7Rb/r0QApb6GlbBm6ikKCkO3IHe+Yb4=;
	b=LxtJ0pTVqGvPZgmeC1TJHmvRdOjJPydQH/ZuYGN5vS9AEJ1yRudY2aKmnm65bndCizYBFr
	wbCt4ANc22ae9r0sHrKlxPzHL1bTNCWx3g9Q/XwJaZfHq2RdljwAERKr1w4+CaWeZneD8b
	CcQbeyYVq+e6Rlx05SL/hDwP72PvgPo=
Date: Wed, 17 Dec 2025 14:27:22 +0800
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
Subject: Re: [PATCH] watchdog: softlockup: panic when lockup duration exceeds
 N thresholds
Content-Language: en-US
To: lirongqing <lirongqing@baidu.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <chleroy@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20251216074521.2796-1-lirongqing@baidu.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20251216074521.2796-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/12/16 15:45, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> The softlockup_panic sysctl is currently a binary option: panic immediately
> or never panic on soft lockups.
> 
> Panicking on any soft lockup, regardless of duration, can be overly
> aggressive for brief stalls that may be caused by legitimate operations.
> Conversely, never panicking may allow severe system hangs to persist
> undetected.
> 
> Extend softlockup_panic to accept an integer threshold, allowing the kernel
> to panic only when the normalized lockup duration exceeds N watchdog
> threshold periods. This provides finer-grained control to distinguish
> between transient delays and persistent system failures.
> 
> The accepted values are:
> - 0: Don't panic (unchanged)
> - 1: Panic when duration >= 1 * threshold (20s default, original behavior)
> - N > 1: Panic when duration >= N * threshold (e.g., 2 = 40s, 3 = 60s.)
> 
> The original behavior is preserved for values 0 and 1, maintaining full
> backward compatibility while allowing systems to tolerate brief lockups
> while still catching severe, persistent hangs.

Thanks! Just a couple of minor things below ;)

> 
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt      | 10 +++++-----
>   arch/arm/configs/aspeed_g5_defconfig                 |  2 +-
>   arch/arm/configs/pxa3xx_defconfig                    |  2 +-
>   arch/openrisc/configs/or1klitex_defconfig            |  2 +-
>   arch/powerpc/configs/skiroot_defconfig               |  2 +-
>   drivers/gpu/drm/ci/arm.config                        |  2 +-
>   drivers/gpu/drm/ci/arm64.config                      |  2 +-
>   drivers/gpu/drm/ci/x86_64.config                     |  2 +-
>   kernel/watchdog.c                                    |  8 +++++---
>   lib/Kconfig.debug                                    | 13 +++++++------
>   tools/testing/selftests/bpf/config                   |  2 +-
>   tools/testing/selftests/wireguard/qemu/kernel.config |  2 +-
>   12 files changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a8d0afd..27c5f96 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6934,12 +6934,12 @@ Kernel parameters
>   
>   	softlockup_panic=
>   			[KNL] Should the soft-lockup detector generate panics.
> -			Format: 0 | 1
> +			Format: <int>
>   
> -			A value of 1 instructs the soft-lockup detector
> -			to panic the machine when a soft-lockup occurs. It is
> -			also controlled by the kernel.softlockup_panic sysctl
> -			and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
> +			A value of non-zero instructs the soft-lockup detector
> +			to panic the machine when a soft-lockup duration exceeds
> +			N thresholds. It is also controlled by the kernel.softlockup_panic
> +			sysctl and CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC, which is the
>   			respective build-time switch to that functionality.

Seems like kernel/configs/debug.config still has the old format
"# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set" ...

Should be updated to "CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=0", right?

>   
>   	softlockup_all_cpu_backtrace=
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 2e6ea13..ec558e5 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -306,7 +306,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
>   CONFIG_PANIC_ON_OOPS=y
>   CONFIG_PANIC_TIMEOUT=-1
>   CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   CONFIG_BOOTPARAM_HUNG_TASK_PANIC=1
>   CONFIG_WQ_WATCHDOG=y
>   # CONFIG_SCHED_DEBUG is not set
> diff --git a/arch/arm/configs/pxa3xx_defconfig b/arch/arm/configs/pxa3xx_defconfig
> index 07d422f..fb272e3 100644
> --- a/arch/arm/configs/pxa3xx_defconfig
> +++ b/arch/arm/configs/pxa3xx_defconfig
> @@ -100,7 +100,7 @@ CONFIG_PRINTK_TIME=y
>   CONFIG_DEBUG_KERNEL=y
>   CONFIG_MAGIC_SYSRQ=y
>   CONFIG_DEBUG_SHIRQ=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   # CONFIG_SCHED_DEBUG is not set
>   CONFIG_DEBUG_SPINLOCK=y
>   CONFIG_DEBUG_SPINLOCK_SLEEP=y
> diff --git a/arch/openrisc/configs/or1klitex_defconfig b/arch/openrisc/configs/or1klitex_defconfig
> index fb1eb9a..984b0e3 100644
> --- a/arch/openrisc/configs/or1klitex_defconfig
> +++ b/arch/openrisc/configs/or1klitex_defconfig
> @@ -52,5 +52,5 @@ CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,bpf"
>   CONFIG_PRINTK_TIME=y
>   CONFIG_PANIC_ON_OOPS=y
>   CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   CONFIG_BUG_ON_DATA_CORRUPTION=y
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 2b71a6d..a4114fc 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -289,7 +289,7 @@ CONFIG_SCHED_STACK_END_CHECK=y
>   CONFIG_DEBUG_STACKOVERFLOW=y
>   CONFIG_PANIC_ON_OOPS=y
>   CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   CONFIG_HARDLOCKUP_DETECTOR=y
>   CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
>   CONFIG_WQ_WATCHDOG=y
> diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> index 411e814..d7c5167 100644
> --- a/drivers/gpu/drm/ci/arm.config
> +++ b/drivers/gpu/drm/ci/arm.config
> @@ -52,7 +52,7 @@ CONFIG_TMPFS=y
>   CONFIG_PROVE_LOCKING=n
>   CONFIG_DEBUG_LOCKDEP=n
>   CONFIG_SOFTLOCKUP_DETECTOR=n
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=n
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=0
>   
>   CONFIG_FW_LOADER_COMPRESS=y
>   
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index fddfbd4..ea0e307 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -161,7 +161,7 @@ CONFIG_TMPFS=y
>   CONFIG_PROVE_LOCKING=n
>   CONFIG_DEBUG_LOCKDEP=n
>   CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   
>   CONFIG_DETECT_HUNG_TASK=y
>   
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 8eaba388..7ac98a7 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -47,7 +47,7 @@ CONFIG_TMPFS=y
>   CONFIG_PROVE_LOCKING=n
>   CONFIG_DEBUG_LOCKDEP=n
>   CONFIG_SOFTLOCKUP_DETECTOR=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   
>   CONFIG_DETECT_HUNG_TASK=y
>   
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 0685e3a..a5fa116 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -363,7 +363,7 @@ static struct cpumask watchdog_allowed_mask __read_mostly;
>   
>   /* Global variables, exported for sysctl */
>   unsigned int __read_mostly softlockup_panic =
> -			IS_ENABLED(CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC);
> +			CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC;
>   
>   static bool softlockup_initialized __read_mostly;
>   static u64 __read_mostly sample_period;
> @@ -879,7 +879,9 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>   
>   		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
>   		sys_info(softlockup_si_mask & ~SYS_INFO_ALL_BT);
> -		if (softlockup_panic)
> +		duration = duration / get_softlockup_thresh();

Nit: reusing "duration" here makes things a bit confusing, maybe just
use a temp variable?

	thresh_count = duration / get_softlockup_thresh();

	if (softlockup_panic && thresh_count >= softlockup_panic)
		panic("softlockup: hung tasks");

Cheers,
Lance

> +
> +		if (softlockup_panic && duration >= softlockup_panic)
>   			panic("softlockup: hung tasks");
>   	}
>   
> @@ -1228,7 +1230,7 @@ static const struct ctl_table watchdog_sysctls[] = {
>   		.mode		= 0644,
>   		.proc_handler	= proc_dointvec_minmax,
>   		.extra1		= SYSCTL_ZERO,
> -		.extra2		= SYSCTL_ONE,
> +		.extra2		= SYSCTL_INT_MAX,
>   	},
>   	{
>   		.procname	= "softlockup_sys_info",
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index ba36939..17a7a77 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1110,13 +1110,14 @@ config SOFTLOCKUP_DETECTOR_INTR_STORM
>   	  the CPU stats and the interrupt counts during the "soft lockups".
>   
>   config BOOTPARAM_SOFTLOCKUP_PANIC
> -	bool "Panic (Reboot) On Soft Lockups"
> +	int "Panic (Reboot) On Soft Lockups"
>   	depends on SOFTLOCKUP_DETECTOR
> +	default 0
>   	help
> -	  Say Y here to enable the kernel to panic on "soft lockups",
> -	  which are bugs that cause the kernel to loop in kernel
> -	  mode for more than 20 seconds (configurable using the watchdog_thresh
> -	  sysctl), without giving other tasks a chance to run.
> +	  Set to a non-zero value N to enable the kernel to panic on "soft
> +	  lockups", which are bugs that cause the kernel to loop in kernel
> +	  mode for more than (N * 20 seconds) (configurable using the
> +	  watchdog_thresh sysctl), without giving other tasks a chance to run.
>   
>   	  The panic can be used in combination with panic_timeout,
>   	  to cause the system to reboot automatically after a
> @@ -1124,7 +1125,7 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
>   	  high-availability systems that have uptime guarantees and
>   	  where a lockup must be resolved ASAP.
>   
> -	  Say N if unsure.
> +	  Say 0 if unsure.
>   
>   config HAVE_HARDLOCKUP_DETECTOR_BUDDY
>   	bool
> diff --git a/tools/testing/selftests/bpf/config b/tools/testing/selftests/bpf/config
> index 558839e..2485538 100644
> --- a/tools/testing/selftests/bpf/config
> +++ b/tools/testing/selftests/bpf/config
> @@ -1,6 +1,6 @@
>   CONFIG_BLK_DEV_LOOP=y
>   CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   CONFIG_BPF=y
>   CONFIG_BPF_EVENTS=y
>   CONFIG_BPF_JIT=y
> diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
> index 0504c11..bb89d2d 100644
> --- a/tools/testing/selftests/wireguard/qemu/kernel.config
> +++ b/tools/testing/selftests/wireguard/qemu/kernel.config
> @@ -80,7 +80,7 @@ CONFIG_HARDLOCKUP_DETECTOR=y
>   CONFIG_WQ_WATCHDOG=y
>   CONFIG_DETECT_HUNG_TASK=y
>   CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
> -CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=1
>   CONFIG_BOOTPARAM_HUNG_TASK_PANIC=1
>   CONFIG_PANIC_TIMEOUT=-1
>   CONFIG_STACKTRACE=y


