Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 974824ADB16
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 15:24:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtQJP2Nr3z3bbP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 01:24:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=kQzEqm1b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexandre.belloni@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kQzEqm1b; dkim-atps=neutral
X-Greylist: delayed 610 seconds by postgrey-1.36 at boromir;
 Wed, 09 Feb 2022 01:24:12 AEDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtQHc1Qr9z30NB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 01:24:10 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 68287CCFF1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 14:14:03 +0000 (UTC)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B7B81240005;
 Tue,  8 Feb 2022 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644329623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RsIIehydz1EnqBffGxIHEb2hf94PLFF+1tb+pHejgxg=;
 b=kQzEqm1bfJF4SG0N3cWKOzOX0ziEGDeEGXjPZdHwcGYHxS1yD6V15ZfKILI0r/nxxTd/qg
 F+EGVmT3XpFuVHh513R4T5OFQXWE1s4lx0k8xtexzsmKjYms8CuruAkAexUeeoWWdSBwPY
 O8hb66yxplwviprWuJBIhtXzRmpAsrF8k4U2h/0BMChCqL3jefHIxVWNSB5vK0/SDHR+Tr
 3f7hofbiRyVTJC3EGy4VZTt1J/owqwb9EgaOcTervQU0wctap6aFMTWAbbOD+uAGnxMoA8
 umRPE4JkoSNe3bxPWWkQOfMcri+8qiAQnANo61TXrRo0uYDHtCOGRNfAJNeZDA==
Date: Tue, 8 Feb 2022 15:13:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] include: linux: Reorganize timekeeping and ktime headers
Message-ID: <YgJ6lH9aZOrZ0YcJ@piout.net>
References: <20220126200749.12090-1-carlos.bilbao@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126200749.12090-1-carlos.bilbao@amd.com>
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
Cc: bilbao@vt.edu, linux-rtc@vger.kernel.org, linux-ia64@vger.kernel.org,
 jgross@suse.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
 mhiramat@kernel.org, boon.leong.ong@intel.com, john.stultz@linaro.org,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26/01/2022 14:07:50-0600, Carlos Bilbao wrote:
> The timekeeping subsystem could use some reorganization. Reorganize and
> separate the headers by making ktime.h take care of the ktime_get()
> family of functions, and reserve timekeeping.h for the actual timekeeping.
> 
> This also helps to avoid implicit function errors and strengthens the
> header dependencies, since timekeeping.h was using ktime_to_ns(), a static
> function defined in a header it does no include, ktime.h.
> 
> This patch also includes the header timekeeping.h wherever it is necessary
> for a successful compilation after the header code reorganization for all
> archs.
> 
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm64/kvm/hypercalls.c    |   1 +
>  arch/ia64/kernel/time.c        |   1 +
>  arch/m68k/atari/time.c         |   1 +
>  arch/m68k/hp300/time.c         |   2 +
>  arch/m68k/mac/via.c            |   1 +
>  arch/m68k/mvme16x/config.c     |   1 +
>  arch/m68k/sun3/sun3ints.c      |   1 +
>  arch/powerpc/kernel/time.c     |   1 +
>  arch/x86/kernel/rtc.c          |   1 +
>  arch/x86/kernel/tsc.c          |   1 +
>  drivers/rtc/class.c            |   1 +
>  include/linux/ktime.h          | 196 +++++++++++++++++++++++++++++++-
>  include/linux/pps_kernel.h     |   1 +
>  include/linux/sched_clock.h    |   2 +
>  include/linux/stmmac.h         |   1 +
>  include/linux/timekeeping.h    | 197 +--------------------------------
>  init/main.c                    |   1 +
>  kernel/time/ntp.c              |   1 +
>  kernel/time/posix-timers.c     |   1 +
>  kernel/time/tick-legacy.c      |   1 +
>  kernel/time/time.c             |   1 +
>  kernel/time/timekeeping.c      |   1 +
>  sound/pci/hda/hda_controller.c |   1 +
>  23 files changed, 218 insertions(+), 198 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index 30da78f72b3b..41499c1d7379 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/arm-smccc.h>
>  #include <linux/kvm_host.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/kvm_emulate.h>
>  
> diff --git a/arch/ia64/kernel/time.c b/arch/ia64/kernel/time.c
> index fa9c0ab8c6fc..85e79ff3c98e 100644
> --- a/arch/ia64/kernel/time.c
> +++ b/arch/ia64/kernel/time.c
> @@ -22,6 +22,7 @@
>  #include <linux/efi.h>
>  #include <linux/timex.h>
>  #include <linux/timekeeper_internal.h>
> +#include <linux/timekeeping.h>
>  #include <linux/platform_device.h>
>  #include <linux/sched/cputime.h>
>  
> diff --git a/arch/m68k/atari/time.c b/arch/m68k/atari/time.c
> index 7e44d0e9d0f8..b09d3ff40b36 100644
> --- a/arch/m68k/atari/time.c
> +++ b/arch/m68k/atari/time.c
> @@ -19,6 +19,7 @@
>  #include <linux/clocksource.h>
>  #include <linux/delay.h>
>  #include <linux/export.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/atariints.h>
>  #include <asm/machdep.h>
> diff --git a/arch/m68k/hp300/time.c b/arch/m68k/hp300/time.c
> index 1d1b7b3b5dd4..56c575096bcb 100644
> --- a/arch/m68k/hp300/time.c
> +++ b/arch/m68k/hp300/time.c
> @@ -14,6 +14,8 @@
>  #include <linux/sched.h>
>  #include <linux/kernel_stat.h>
>  #include <linux/interrupt.h>
> +#include <linux/timekeeping.h>
> +
>  #include <asm/machdep.h>
>  #include <asm/irq.h>
>  #include <asm/io.h>
> diff --git a/arch/m68k/mac/via.c b/arch/m68k/mac/via.c
> index 3d11d6219cdd..6dd8f85288e4 100644
> --- a/arch/m68k/mac/via.c
> +++ b/arch/m68k/mac/via.c
> @@ -31,6 +31,7 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/irq.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/macintosh.h>
>  #include <asm/macints.h>
> diff --git a/arch/m68k/mvme16x/config.c b/arch/m68k/mvme16x/config.c
> index b4422c2dfbbf..ebe1dc3ebb4c 100644
> --- a/arch/m68k/mvme16x/config.c
> +++ b/arch/m68k/mvme16x/config.c
> @@ -28,6 +28,7 @@
>  #include <linux/rtc.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/bootinfo.h>
>  #include <asm/bootinfo-vme.h>
> diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
> index 36cc280a4505..209dccc2aed6 100644
> --- a/arch/m68k/sun3/sun3ints.c
> +++ b/arch/m68k/sun3/sun3ints.c
> @@ -11,6 +11,7 @@
>  #include <linux/sched.h>
>  #include <linux/kernel_stat.h>
>  #include <linux/interrupt.h>
> +#include <linux/timekeeping.h>
>  #include <asm/intersil.h>
>  #include <asm/oplib.h>
>  #include <asm/sun3ints.h>
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index cae8f03a44fe..b577a5a06621 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -54,6 +54,7 @@
>  #include <linux/of_clk.h>
>  #include <linux/suspend.h>
>  #include <linux/processor.h>
> +#include <linux/timekeeping.h>
>  #include <asm/trace.h>
>  
>  #include <asm/interrupt.h>
> diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
> index 586f718b8e95..98ea05cc6aeb 100644
> --- a/arch/x86/kernel/rtc.c
> +++ b/arch/x86/kernel/rtc.c
> @@ -9,6 +9,7 @@
>  #include <linux/export.h>
>  #include <linux/pnp.h>
>  #include <linux/of.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/vsyscall.h>
>  #include <asm/x86_init.h>
> diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
> index a698196377be..add4388283c5 100644
> --- a/arch/x86/kernel/tsc.c
> +++ b/arch/x86/kernel/tsc.c
> @@ -15,6 +15,7 @@
>  #include <linux/timex.h>
>  #include <linux/static_key.h>
>  #include <linux/static_call.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/hpet.h>
>  #include <asm/timer.h>
> diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
> index 4b460c61f1d8..7e2bce8cf0b1 100644
> --- a/drivers/rtc/class.c
> +++ b/drivers/rtc/class.c
> @@ -16,6 +16,7 @@
>  #include <linux/kdev_t.h>
>  #include <linux/idr.h>
>  #include <linux/slab.h>
> +#include <linux/timekeeping.h>
>  #include <linux/workqueue.h>
>  
>  #include "rtc-core.h"
> diff --git a/include/linux/ktime.h b/include/linux/ktime.h
> index 73f20deb497d..07971008b795 100644
> --- a/include/linux/ktime.h
> +++ b/include/linux/ktime.h
> @@ -229,6 +229,198 @@ static inline ktime_t ms_to_ktime(u64 ms)
>  	return ms * NSEC_PER_MSEC;
>  }
>  
> -# include <linux/timekeeping.h>
> +/*
> + * ktime_get() family: read the current time in a multitude of ways,
> + *
> + * The default time reference is CLOCK_MONOTONIC, starting at
> + * boot time but not counting the time spent in suspend.
> + * For other references, use the functions with "real", "clocktai",
> + * "boottime" and "raw" suffixes.
> + *
> + * To get the time in a different format, use the ones wit
> + * "ns", "ts64" and "seconds" suffix.
> + *
> + * See Documentation/core-api/timekeeping.rst for more details.
> + */
>  
> -#endif
> +
> +/*
> + * timespec64 based interfaces
> + */
> +extern void ktime_get_raw_ts64(struct timespec64 *ts);
> +extern void ktime_get_ts64(struct timespec64 *ts);
> +extern void ktime_get_real_ts64(struct timespec64 *tv);
> +extern void ktime_get_coarse_ts64(struct timespec64 *ts);
> +extern void ktime_get_coarse_real_ts64(struct timespec64 *ts);
> +
> +void getboottime64(struct timespec64 *ts);
> +
> +/*
> + * time64_t base interfaces
> + */
> +extern time64_t ktime_get_seconds(void);
> +extern time64_t __ktime_get_real_seconds(void);
> +extern time64_t ktime_get_real_seconds(void);
> +
> +/*
> + * ktime_t based interfaces
> + */
> +
> +enum tk_offsets {
> +	TK_OFFS_REAL,
> +	TK_OFFS_BOOT,
> +	TK_OFFS_TAI,
> +	TK_OFFS_MAX,
> +};
> +
> +extern ktime_t ktime_get(void);
> +extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
> +extern ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs);
> +extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
> +extern ktime_t ktime_get_raw(void);
> +extern u32 ktime_get_resolution_ns(void);
> +
> +/**
> + * ktime_get_real - get the real (wall-) time in ktime_t format
> + */
> +static inline ktime_t ktime_get_real(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_REAL);
> +}
> +
> +static inline ktime_t ktime_get_coarse_real(void)
> +{
> +	return ktime_get_coarse_with_offset(TK_OFFS_REAL);
> +}
> +
> +/**
> + * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
> + *
> + * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
> + * time spent in suspend.
> + */
> +static inline ktime_t ktime_get_boottime(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_BOOT);
> +}
> +
> +static inline ktime_t ktime_get_coarse_boottime(void)
> +{
> +	return ktime_get_coarse_with_offset(TK_OFFS_BOOT);
> +}
> +
> +/**
> + * ktime_get_clocktai - Returns the TAI time of day in ktime_t format
> + */
> +static inline ktime_t ktime_get_clocktai(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_TAI);
> +}
> +
> +static inline ktime_t ktime_get_coarse_clocktai(void)
> +{
> +	return ktime_get_coarse_with_offset(TK_OFFS_TAI);
> +}
> +
> +static inline ktime_t ktime_get_coarse(void)
> +{
> +	struct timespec64 ts;
> +
> +	ktime_get_coarse_ts64(&ts);
> +	return timespec64_to_ktime(ts);
> +}
> +
> +static inline u64 ktime_get_coarse_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_coarse());
> +}
> +
> +static inline u64 ktime_get_coarse_real_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_coarse_real());
> +}
> +
> +static inline u64 ktime_get_coarse_boottime_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_coarse_boottime());
> +}
> +
> +static inline u64 ktime_get_coarse_clocktai_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_coarse_clocktai());
> +}
> +
> +/**
> + * ktime_mono_to_real - Convert monotonic time to clock realtime
> + */
> +static inline ktime_t ktime_mono_to_real(ktime_t mono)
> +{
> +	return ktime_mono_to_any(mono, TK_OFFS_REAL);
> +}
> +
> +static inline u64 ktime_get_ns(void)
> +{
> +	return ktime_to_ns(ktime_get());
> +}
> +
> +static inline u64 ktime_get_real_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_real());
> +}
> +
> +static inline u64 ktime_get_boottime_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_boottime());
> +}
> +
> +static inline u64 ktime_get_clocktai_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_clocktai());
> +}
> +
> +static inline u64 ktime_get_raw_ns(void)
> +{
> +	return ktime_to_ns(ktime_get_raw());
> +}
> +
> +extern u64 ktime_get_mono_fast_ns(void);
> +extern u64 ktime_get_raw_fast_ns(void);
> +extern u64 ktime_get_boot_fast_ns(void);
> +extern u64 ktime_get_real_fast_ns(void);
> +
> +/*
> + * timespec64/time64_t interfaces utilizing the ktime based ones
> + * for API completeness, these could be implemented more efficiently
> + * if needed.
> + */
> +static inline void ktime_get_boottime_ts64(struct timespec64 *ts)
> +{
> +	*ts = ktime_to_timespec64(ktime_get_boottime());
> +}
> +
> +static inline void ktime_get_coarse_boottime_ts64(struct timespec64 *ts)
> +{
> +	*ts = ktime_to_timespec64(ktime_get_coarse_boottime());
> +}
> +
> +static inline time64_t ktime_get_boottime_seconds(void)
> +{
> +	return ktime_divns(ktime_get_coarse_boottime(), NSEC_PER_SEC);
> +}
> +
> +static inline void ktime_get_clocktai_ts64(struct timespec64 *ts)
> +{
> +	*ts = ktime_to_timespec64(ktime_get_clocktai());
> +}
> +
> +static inline void ktime_get_coarse_clocktai_ts64(struct timespec64 *ts)
> +{
> +	*ts = ktime_to_timespec64(ktime_get_coarse_clocktai());
> +}
> +
> +static inline time64_t ktime_get_clocktai_seconds(void)
> +{
> +	return ktime_divns(ktime_get_coarse_clocktai(), NSEC_PER_SEC);
> +}
> +
> +#endif /* _LINUX_KTIME_H */
> diff --git a/include/linux/pps_kernel.h b/include/linux/pps_kernel.h
> index 78c8ac4951b5..24970c202ac6 100644
> --- a/include/linux/pps_kernel.h
> +++ b/include/linux/pps_kernel.h
> @@ -12,6 +12,7 @@
>  #include <linux/cdev.h>
>  #include <linux/device.h>
>  #include <linux/time.h>
> +#include <linux/timekeeping.h>
>  
>  /*
>   * Global defines
> diff --git a/include/linux/sched_clock.h b/include/linux/sched_clock.h
> index 835ee87ed792..f0fa287710da 100644
> --- a/include/linux/sched_clock.h
> +++ b/include/linux/sched_clock.h
> @@ -5,6 +5,8 @@
>  #ifndef LINUX_SCHED_CLOCK
>  #define LINUX_SCHED_CLOCK
>  
> +#include <linux/timekeeping.h>
> +
>  #ifdef CONFIG_GENERIC_SCHED_CLOCK
>  /**
>   * struct clock_read_data - data required to read from sched_clock()
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index a6f03b36fc4f..bf235ff101d5 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/platform_device.h>
>  #include <linux/phy.h>
> +#include <linux/timekeeping.h>
>  
>  #define MTL_MAX_RX_QUEUES	8
>  #define MTL_MAX_TX_QUEUES	8
> diff --git a/include/linux/timekeeping.h b/include/linux/timekeeping.h
> index 78a98bdff76d..b1c54f5ff91e 100644
> --- a/include/linux/timekeeping.h
> +++ b/include/linux/timekeeping.h
> @@ -19,201 +19,6 @@ extern void legacy_timer_tick(unsigned long ticks);
>  extern int do_settimeofday64(const struct timespec64 *ts);
>  extern int do_sys_settimeofday64(const struct timespec64 *tv,
>  				 const struct timezone *tz);
> -
> -/*
> - * ktime_get() family: read the current time in a multitude of ways,
> - *
> - * The default time reference is CLOCK_MONOTONIC, starting at
> - * boot time but not counting the time spent in suspend.
> - * For other references, use the functions with "real", "clocktai",
> - * "boottime" and "raw" suffixes.
> - *
> - * To get the time in a different format, use the ones wit
> - * "ns", "ts64" and "seconds" suffix.
> - *
> - * See Documentation/core-api/timekeeping.rst for more details.
> - */
> -
> -
> -/*
> - * timespec64 based interfaces
> - */
> -extern void ktime_get_raw_ts64(struct timespec64 *ts);
> -extern void ktime_get_ts64(struct timespec64 *ts);
> -extern void ktime_get_real_ts64(struct timespec64 *tv);
> -extern void ktime_get_coarse_ts64(struct timespec64 *ts);
> -extern void ktime_get_coarse_real_ts64(struct timespec64 *ts);
> -
> -void getboottime64(struct timespec64 *ts);
> -
> -/*
> - * time64_t base interfaces
> - */
> -extern time64_t ktime_get_seconds(void);
> -extern time64_t __ktime_get_real_seconds(void);
> -extern time64_t ktime_get_real_seconds(void);
> -
> -/*
> - * ktime_t based interfaces
> - */
> -
> -enum tk_offsets {
> -	TK_OFFS_REAL,
> -	TK_OFFS_BOOT,
> -	TK_OFFS_TAI,
> -	TK_OFFS_MAX,
> -};
> -
> -extern ktime_t ktime_get(void);
> -extern ktime_t ktime_get_with_offset(enum tk_offsets offs);
> -extern ktime_t ktime_get_coarse_with_offset(enum tk_offsets offs);
> -extern ktime_t ktime_mono_to_any(ktime_t tmono, enum tk_offsets offs);
> -extern ktime_t ktime_get_raw(void);
> -extern u32 ktime_get_resolution_ns(void);
> -
> -/**
> - * ktime_get_real - get the real (wall-) time in ktime_t format
> - */
> -static inline ktime_t ktime_get_real(void)
> -{
> -	return ktime_get_with_offset(TK_OFFS_REAL);
> -}
> -
> -static inline ktime_t ktime_get_coarse_real(void)
> -{
> -	return ktime_get_coarse_with_offset(TK_OFFS_REAL);
> -}
> -
> -/**
> - * ktime_get_boottime - Returns monotonic time since boot in ktime_t format
> - *
> - * This is similar to CLOCK_MONTONIC/ktime_get, but also includes the
> - * time spent in suspend.
> - */
> -static inline ktime_t ktime_get_boottime(void)
> -{
> -	return ktime_get_with_offset(TK_OFFS_BOOT);
> -}
> -
> -static inline ktime_t ktime_get_coarse_boottime(void)
> -{
> -	return ktime_get_coarse_with_offset(TK_OFFS_BOOT);
> -}
> -
> -/**
> - * ktime_get_clocktai - Returns the TAI time of day in ktime_t format
> - */
> -static inline ktime_t ktime_get_clocktai(void)
> -{
> -	return ktime_get_with_offset(TK_OFFS_TAI);
> -}
> -
> -static inline ktime_t ktime_get_coarse_clocktai(void)
> -{
> -	return ktime_get_coarse_with_offset(TK_OFFS_TAI);
> -}
> -
> -static inline ktime_t ktime_get_coarse(void)
> -{
> -	struct timespec64 ts;
> -
> -	ktime_get_coarse_ts64(&ts);
> -	return timespec64_to_ktime(ts);
> -}
> -
> -static inline u64 ktime_get_coarse_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_coarse());
> -}
> -
> -static inline u64 ktime_get_coarse_real_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_coarse_real());
> -}
> -
> -static inline u64 ktime_get_coarse_boottime_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_coarse_boottime());
> -}
> -
> -static inline u64 ktime_get_coarse_clocktai_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_coarse_clocktai());
> -}
> -
> -/**
> - * ktime_mono_to_real - Convert monotonic time to clock realtime
> - */
> -static inline ktime_t ktime_mono_to_real(ktime_t mono)
> -{
> -	return ktime_mono_to_any(mono, TK_OFFS_REAL);
> -}
> -
> -static inline u64 ktime_get_ns(void)
> -{
> -	return ktime_to_ns(ktime_get());
> -}
> -
> -static inline u64 ktime_get_real_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_real());
> -}
> -
> -static inline u64 ktime_get_boottime_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_boottime());
> -}
> -
> -static inline u64 ktime_get_clocktai_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_clocktai());
> -}
> -
> -static inline u64 ktime_get_raw_ns(void)
> -{
> -	return ktime_to_ns(ktime_get_raw());
> -}
> -
> -extern u64 ktime_get_mono_fast_ns(void);
> -extern u64 ktime_get_raw_fast_ns(void);
> -extern u64 ktime_get_boot_fast_ns(void);
> -extern u64 ktime_get_real_fast_ns(void);
> -
> -/*
> - * timespec64/time64_t interfaces utilizing the ktime based ones
> - * for API completeness, these could be implemented more efficiently
> - * if needed.
> - */
> -static inline void ktime_get_boottime_ts64(struct timespec64 *ts)
> -{
> -	*ts = ktime_to_timespec64(ktime_get_boottime());
> -}
> -
> -static inline void ktime_get_coarse_boottime_ts64(struct timespec64 *ts)
> -{
> -	*ts = ktime_to_timespec64(ktime_get_coarse_boottime());
> -}
> -
> -static inline time64_t ktime_get_boottime_seconds(void)
> -{
> -	return ktime_divns(ktime_get_coarse_boottime(), NSEC_PER_SEC);
> -}
> -
> -static inline void ktime_get_clocktai_ts64(struct timespec64 *ts)
> -{
> -	*ts = ktime_to_timespec64(ktime_get_clocktai());
> -}
> -
> -static inline void ktime_get_coarse_clocktai_ts64(struct timespec64 *ts)
> -{
> -	*ts = ktime_to_timespec64(ktime_get_coarse_clocktai());
> -}
> -
> -static inline time64_t ktime_get_clocktai_seconds(void)
> -{
> -	return ktime_divns(ktime_get_coarse_clocktai(), NSEC_PER_SEC);
> -}
> -
>  /*
>   * RTC specific
>   */
> @@ -308,4 +113,4 @@ void read_persistent_wall_and_boot_offset(struct timespec64 *wall_clock,
>  extern int update_persistent_clock64(struct timespec64 now);
>  #endif
>  
> -#endif
> +#endif /* _LINUX_TIMEKEEPING_H */
> diff --git a/init/main.c b/init/main.c
> index bb984ed79de0..6a6f85e9404f 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -99,6 +99,7 @@
>  #include <linux/kcsan.h>
>  #include <linux/init_syscalls.h>
>  #include <linux/stackdepot.h>
> +#include <linux/timekeeping.h>
>  
>  #include <asm/io.h>
>  #include <asm/bugs.h>
> diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
> index 406dccb79c2b..804f06801737 100644
> --- a/kernel/time/ntp.c
> +++ b/kernel/time/ntp.c
> @@ -18,6 +18,7 @@
>  #include <linux/module.h>
>  #include <linux/rtc.h>
>  #include <linux/audit.h>
> +#include <linux/timekeeping.h>
>  
>  #include "ntp_internal.h"
>  #include "timekeeping_internal.h"
> diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
> index 1cd10b102c51..410a9336748e 100644
> --- a/kernel/time/posix-timers.c
> +++ b/kernel/time/posix-timers.c
> @@ -13,6 +13,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/time.h>
> +#include <linux/timekeeping.h>
>  #include <linux/mutex.h>
>  #include <linux/sched/task.h>
>  
> diff --git a/kernel/time/tick-legacy.c b/kernel/time/tick-legacy.c
> index af225b32f5b3..9a534f716462 100644
> --- a/kernel/time/tick-legacy.c
> +++ b/kernel/time/tick-legacy.c
> @@ -7,6 +7,7 @@
>  #include <linux/irq.h>
>  #include <linux/profile.h>
>  #include <linux/timekeeper_internal.h>
> +#include <linux/timekeeping.h>
>  
>  #include "tick-internal.h"
>  
> diff --git a/kernel/time/time.c b/kernel/time/time.c
> index 29923b20e0e4..7292ed074742 100644
> --- a/kernel/time/time.c
> +++ b/kernel/time/time.c
> @@ -29,6 +29,7 @@
>  #include <linux/timex.h>
>  #include <linux/capability.h>
>  #include <linux/timekeeper_internal.h>
> +#include <linux/timekeeping.h>
>  #include <linux/errno.h>
>  #include <linux/syscalls.h>
>  #include <linux/security.h>
> diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> index b348749a9fc6..d234cb8a97fe 100644
> --- a/kernel/time/timekeeping.c
> +++ b/kernel/time/timekeeping.c
> @@ -22,6 +22,7 @@
>  #include <linux/pvclock_gtod.h>
>  #include <linux/compiler.h>
>  #include <linux/audit.h>
> +#include <linux/timekeeping.h>
>  
>  #include "tick-internal.h"
>  #include "ntp_internal.h"
> diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
> index 930ae4002a81..8014f02e4443 100644
> --- a/sound/pci/hda/hda_controller.c
> +++ b/sound/pci/hda/hda_controller.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/slab.h>
> +#include <linux/timekeeping.h>
>  
>  #ifdef CONFIG_X86
>  /* for art-tsc conversion */
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
